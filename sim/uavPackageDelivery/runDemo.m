%RUNDEMO  A few hand-picked Skyline runs for screen recording.
%
% Usage (from sim/uavPackageDelivery):
%   >> runDemo                 % runs the scenarios listed below, one after another
%   edit the SCENARIOS list or set  demoOnly = "bird";  before running to pick one.
%
% Each run:
%   - flies MultirotorModel (high-fidelity plant) at PACING x real time with the
%     UAV Animation window open, so you can screen-record it
%   - prints the outcome and draws a top-down map: buildings, mission legs,
%     drone track, bird track, landing circle
%   - saves the run to results/demo_<scenario>_<time>.mat

PACING = 1;          % 1 = real time (good for video). [] = as fast as possible.
SEED   = 7;          % fixed seed -> the same "random" gusts/drift every time

SCENARIOS = {
%   name        Mass  BaseWind [N E D]   Bird   extra
    "nominal",  3,    [0 0 0],           false, {'GustStd',[0 0 0],'Drift',false}
    "windy",    4,    [6 -5 0.5],        false, {}
    "heavy",    7,    [5 5 0],           false, {}
    "bird",     4,    [2 1 0],           true,  {'BirdAngle',0,'BirdHalfCycle',12}
};

if exist('demoOnly', 'var') && ~isempty(demoOnly)
    SCENARIOS = SCENARIOS([SCENARIOS{:,1}] == demoOnly, :);
end

mdl = skylineSetup('Pacing', PACING, 'Animate', true, 'SimTime', 120);
here = fileparts(which('runDemo'));
outDir = fullfile(here, 'results');
if ~exist(outDir, 'dir'), mkdir(outDir); end
B = load(fullfile(here, 'data', 'blockbuildingdata.mat'));   % building footprints (x=N, y=E)

for s = 1:size(SCENARIOS, 1)
    [name, m, w, hasBird, extra] = SCENARIOS{s, :};
    rng(SEED);
    p = skylineSampleRun('Mass', m, 'BaseWind', w, 'Bird', hasBird, extra{:});
    fprintf('\n=== %s: mass %.1f kg, base wind [%g %g %g] m/s, bird %d ===\n', ...
        name, m, w, hasBird);

    simOut = sim(mdl, 'ReturnWorkspaceOutputs', 'on');
    r = skylineScoreRun(simOut, p);

    labels = ["MISSED LANDING", "LANDED", "HIT BIRD"];
    fprintf('Result: %s | landing error %.2f m | closest bird %.1f m | t_end %.1f s\n', ...
        labels(r.status + 1), r.error, r.minBirdDist, r.endTime);

    % ---- top-down map for the slide ----
    f = figure('Name', "Skyline " + name, 'Color', 'w');
    hold on; axis equal; grid on
    for k = 1:numel(B.wayPoints1)
        bp = B.wayPoints1{k};
        if ~isempty(bp)
            fill(bp(:,2), bp(:,1), [0.85 0.87 0.9], 'EdgeColor', [0.55 0.6 0.65]);
        end
    end
    wp = [-186 -105; -118.8 -105; -118.8 -76.9; -119.1 -12.0];       % baseMission legs used
    plot(wp(:,2), wp(:,1), '--', 'Color', [0.4 0.4 0.4], 'LineWidth', 1);
    plot(r.pos(:,2), r.pos(:,1), 'Color', [0.12 0.44 0.55], 'LineWidth', 2);
    th = linspace(0, 2*pi, 100);
    plot(-12 + 5*cos(th), -120 + 5*sin(th), 'Color', [0.2 0.6 0.3], 'LineWidth', 1.5);
    if hasBird
        tb = linspace(0, r.endTime, 600)';
        d = p.bird_end - p.bird_start;
        ph = abs(mod(tb, p.bird_cycle)/(p.bird_cycle/2) - 1);
        Bp = p.bird_start + ph.*d;
        plot(Bp(:,2), Bp(:,1), ':', 'Color', [0.72 0.39 0.1], 'LineWidth', 1.5);
    end
    plot(r.pos(end,2), r.pos(end,1), 'o', 'MarkerFaceColor', [0.12 0.44 0.55], 'MarkerEdgeColor', 'w');
    xlabel('East (m)'); ylabel('North (m)');
    title(sprintf('%s: %s, error %.1f m', name, labels(r.status+1), r.error));
    xlim([-150 20]); ylim([-200 -60]);

    stamp = datestr(now, 'yyyymmdd_HHMMSS');
    save(fullfile(outDir, "demo_" + name + "_" + stamp + ".mat"), 'p', 'r', 'name');
    exportgraphics(f, fullfile(outDir, "demo_" + name + "_" + stamp + ".png"), 'Resolution', 200);
end
