function outFile = makeShowcaseVideo(varargin)
%MAKESHOWCASEVIDEO  Run a few Skyline delivery scenarios and record a looping 1080p MP4.
%
%   makeShowcaseVideo                                  % all 4 scenarios, 2x speed
%   makeShowcaseVideo('Scenarios', ["windy","bird"])   % pick scenarios
%   makeShowcaseVideo('Speed', 3)                      % faster playback
%
% Each scenario is simulated with MultirotorModel (high-fidelity 6-DOF plant),
% then replayed in a 3D scene: city blocks, mission route, drone with trail,
% moving obstacle, landing target, live wind gauge and a status readout.
% Title cards separate scenarios and the video starts and ends on the same
% card, so it loops cleanly on a TV.
%
% Output: results/skyline_showcase_<time>.mp4 (falls back to .avi if MPEG-4
% is unavailable). Rendering takes a few minutes; leave the figure window
% visible and uncovered while it records.
%
% Needs: skylineSetup.m, skylineSampleRun.m, skylineScoreRun.m (same folder).

ip = inputParser;
ip.addParameter('Scenarios', ["nominal", "windy", "heavy", "bird"]);
ip.addParameter('Speed', 2);              % playback speed vs. sim time
ip.addParameter('FPS', 30);
ip.addParameter('Seed', 7);
ip.addParameter('Out', '');
ip.addParameter('VideoSize', [1920 1080]); % output resolution [W H]
ip.addParameter('WindowSize', [1280 720]); % on-screen figure size [W H]
ip.parse(varargin{:});
o = ip.Results;
o.Scenarios = string(o.Scenarios);

here = fileparts(mfilename('fullpath'));
outDir = fullfile(here, 'results');
if ~exist(outDir, 'dir'), mkdir(outDir); end
if isempty(o.Out)
    o.Out = fullfile(outDir, "skyline_showcase_" + datestr(now, 'yyyymmdd_HHMMSS') + ".mp4");
end

% ---------------- 1. Simulate -------------------------------------------
mdl = skylineSetup('Animate', false, 'SimTime', 120);
B = load(fullfile(here, 'data', 'blockbuildingdata.mat'));
S = scenarioTable();

runs = struct('label', {}, 'sub', {}, 'p', {}, 'r', {});
for name = o.Scenarios
    k = find([S.name] == name, 1);
    if isempty(k)
        error('Unknown scenario "%s". Options: %s', name, strjoin([S.name], ', '));
    end
    sc = S(k);
    rng(o.Seed);
    p = skylineSampleRun('Mass', sc.mass, 'BaseWind', sc.wind, 'Bird', sc.bird, sc.extra{:});
    fprintf('Simulating "%s" ... ', sc.label);
    tic
    simOut = sim(mdl, 'ReturnWorkspaceOutputs', 'on');
    r = skylineScoreRun(simOut, p);
    fprintf('done in %.0f s (landing error %.1f m)\n', toc, r.error);
    sub = sprintf('Payload %.0f kg  ·  average wind %.1f m/s', p.mass, p.windRMS);
    if p.bird, sub = sub + "  ·  moving obstacle"; end
    runs(end+1) = struct('label', sc.label, 'sub', sub, 'p', p, 'r', r); %#ok<AGROW>
end

% ---------------- 2. Render ---------------------------------------------
[vw, o.Out] = openWriter(o.Out, o.FPS);
fig = figure('Color', 'w', 'Units', 'pixels', 'Position', [40 40 o.WindowSize], ...
    'MenuBar', 'none', 'ToolBar', 'none', 'Name', 'Skyline showcase', 'NumberTitle', 'off');
cleaner = onCleanup(@() finish(vw, fig));

intro = {'Project Skyline', 'Simulated drone delivery under wind, payload and sensor uncertainty'};
titleCard(fig, vw, o, intro{:}, 3);
for i = 1:numel(runs)
    titleCard(fig, vw, o, runs(i).label, runs(i).sub, 2);
    renderRun(fig, vw, o, runs(i), B);
end
titleCard(fig, vw, o, intro{:}, 3);   % same card at the end so the loop is seamless

outFile = o.Out;
fprintf('\nSaved %s\n', outFile);
end

% ========================================================================
function S = scenarioTable()
S = [ ...
 struct('name', "nominal", 'label', "Calm conditions",          'mass', 3, 'wind', [0 0 0],    'bird', false, 'extra', {{'GustStd', [0 0 0], 'Drift', false}}), ...
 struct('name', "windy",   'label', "Gusty crosswind",          'mass', 4, 'wind', [6 -5 0.5], 'bird', false, 'extra', {{}}), ...
 struct('name', "heavy",   'label', "Heavy payload",            'mass', 6, 'wind', [5 5 0],    'bird', false, 'extra', {{}}), ...
 struct('name', "bird",    'label', "Moving obstacle on final approach", 'mass', 4, 'wind', [2 1 0], 'bird', true, 'extra', {{'BirdAngle', 0, 'BirdHalfCycle', 12}})];
end

% ========================================================================
function renderRun(fig, vw, o, run, B)
p = run.p; r = run.r;
C = palette();

clf(fig);
ax = axes(fig, 'Position', [0 0 1 1]);
hold(ax, 'on'); axis(ax, 'off'); axis(ax, 'equal');
ax.Clipping = 'off';

% ground and buildings (x = East, y = North, z = Up)
patch(ax, [-175 45 45 -175], [-220 -220 -40 -40], [0 0 0 0], C.ground, 'EdgeColor', 'none');
heights = [10 12 9 11 8 12 10 9 11 10 12];   % below the 15 m cruise altitude so the drone stays visible
for k = 1:numel(B.wayPoints1)
    P = B.wayPoints1{k};
    if isempty(P), continue; end
    extrude(ax, P(:, 2), P(:, 1), heights(mod(k - 1, numel(heights)) + 1), C);
end

% mission route at cruise altitude, and landing target
wp = [-186 -105; -118.8 -105; -118.8 -76.9; -119.1 -12.0];   % [N E]
plot3(ax, wp(:, 2), wp(:, 1), [15 15 15 15], '--', 'Color', C.route, 'LineWidth', 1.5);
th = linspace(0, 2*pi, 80);
patch(ax, -12 + 5*cos(th), -120 + 5*sin(th), 0.05*ones(size(th)), C.targetFill, ...
    'EdgeColor', C.target, 'LineWidth', 2, 'FaceAlpha', 0.6);
plot3(ax, [-12 -12], [-120 -120], [0 8], '-', 'Color', C.target, 'LineWidth', 2);

% timeline
[t, iu] = unique(r.t);
P = r.pos(iu, :);
T = t(end);
tf = unique([0:(o.Speed / o.FPS):T, T]);
Pf = interp1(t, P, tf, 'linear');
E = Pf(:, 2); N = Pf(:, 1); U = -Pf(:, 3);
Wf = interp1(p.windT, p.wind, tf, 'linear', 'extrap');
if p.bird
    Bf = birdPos(tf(:), p);
end

% The plant has no ground contact: if the drone sinks to the ground away from
% the target (e.g. payload beyond available thrust), end the replay there.
crashed = false;
kc = find(U < 0.5 & hypot(N + 120, E + 12) > 8 & tf(:) > 2, 1);
if ~isempty(kc)
    crashed = true;
    tf = tf(1:kc); E = E(1:kc); N = N(1:kc); U = U(1:kc); Wf = Wf(1:kc, :);
    if p.bird, Bf = Bf(1:kc, :); end
end
U = max(U, 0);

% moving objects
drone = makeDrone(ax, C);
shadow = plot3(ax, E(1), N(1), 0.1, 'o', 'MarkerSize', 7, 'MarkerFaceColor', C.shadow, 'MarkerEdgeColor', 'none');
trail = plot3(ax, E(1), N(1), U(1), '-', 'Color', C.drone, 'LineWidth', 2.5);
if p.bird
    birdTrail = plot3(ax, Bf(1, 2), Bf(1, 1), -Bf(1, 3), ':', 'Color', C.bird, 'LineWidth', 1.5);
    bird = plot3(ax, Bf(1, 2), Bf(1, 1), -Bf(1, 3), 'o', 'MarkerSize', 16, ...
        'MarkerFaceColor', C.bird, 'MarkerEdgeColor', 'w', 'LineWidth', 1.5);
end

% camera
xlim(ax, [-165 35]); ylim(ax, [-210 -45]); zlim(ax, [0 45]);
camproj(ax, 'perspective');
az0 = -38; el = 42;
view(ax, az0, el);
camtarget(ax, [-60 -128 4]);               % centre of the delivery route
camva(ax, 7.5);                            % fixed field of view: whole route in frame
light(ax, 'Position', [-1 -1 2], 'Style', 'infinite');
lighting(ax, 'gouraud'); material(ax, 'dull');

% HUD
hud = annotation(fig, 'textbox', [0.015 0.80 0.52 0.18], 'Interpreter', 'tex', ...
    'FontSize', 15, 'EdgeColor', 'none', 'BackgroundColor', 'w', 'FaceAlpha', 0.85, ...
    'Color', C.text, 'VerticalAlignment', 'top', 'Margin', 8);
annotation(fig, 'textbox', [0.015 0.01 0.7 0.05], 'String', ...
    'MATLAB / Simulink  ·  6-DOF quadrotor  ·  SoftCon Lab, Santa Clara University', ...
    'FontSize', 11, 'EdgeColor', 'none', 'Color', C.muted);
status = annotation(fig, 'textbox', [0.20 0.07 0.60 0.08], 'String', '', ...
    'FontSize', 22, 'FontWeight', 'bold', 'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', ...
    'BackgroundColor', 'w', 'FaceAlpha', 0.0, 'Color', C.text);
gauge = makeWindGauge(fig, C);

yaw = 0;
nF = numel(tf);
for k = 1:nF
    if k > 1
        d = [E(k) - E(k - 1), N(k) - N(k - 1)];
        if norm(d) > 0.02, yaw = atan2(d(2), d(1)); end
    end
    drone.Matrix = makehgtform('translate', [E(k) N(k) U(k)], 'zrotate', yaw);
    set(shadow, 'XData', E(k), 'YData', N(k));
    set(trail, 'XData', E(1:k), 'YData', N(1:k), 'ZData', U(1:k));
    if p.bird
        j0 = max(1, k - round(4 * o.FPS / o.Speed));
        set(bird, 'XData', Bf(k, 2), 'YData', Bf(k, 1), 'ZData', -Bf(k, 3));
        set(birdTrail, 'XData', Bf(j0:k, 2), 'YData', Bf(j0:k, 1), 'ZData', -Bf(j0:k, 3));
    end
    w = Wf(k, :);
    updateWindGauge(gauge, w(2), w(1));
    dist = hypot(N(k) + 120, E(k) + 12);
    hud.String = { ...
        ['\bf' char(run.label)], ...
        sprintf('\\rmPayload %.1f kg     t = %5.1f s', p.mass, tf(k)), ...
        sprintf('Altitude %4.1f m     Distance to target %5.1f m', U(k), dist)};
    view(ax, az0 + 18 * (k / nF), el);
    writeFrame(fig, vw, o);
end

% result, held for 3 s
if crashed
    msg = 'Lost altitude: payload exceeds available thrust'; col = C.miss;
else
switch r.status
    case 1, msg = sprintf('Landed %.1f m from target', r.error); col = C.target;
    case 2, msg = 'Obstacle strike';                            col = C.bird;
    otherwise, msg = sprintf('Missed landing by %.1f m', r.error); col = C.miss;
end
end
set(status, 'String', msg, 'Color', col, 'FaceAlpha', 0.9);
for k = 1:round(3 * o.FPS)
    view(ax, az0 + 18 + 4 * (k / (3 * o.FPS)), el);
    writeFrame(fig, vw, o);
end
end

% ========================================================================
function h = makeDrone(ax, C)
h = hgtransform(ax);
L = 3.5;                                   % drawn ~5x real size so it reads on screen
plot3([-L L], [0 0], [0 0], '-', 'Color', C.droneDark, 'LineWidth', 3, 'Parent', h);
plot3([0 0], [-L L], [0 0], '-', 'Color', C.droneDark, 'LineWidth', 3, 'Parent', h);
th = linspace(0, 2*pi, 40);
for c = [L 0; -L 0; 0 L; 0 -L]'
    patch(c(1) + 1.4*cos(th), c(2) + 1.4*sin(th), 0.15*ones(size(th)), C.drone, ...
        'EdgeColor', C.droneDark, 'FaceAlpha', 0.75, 'Parent', h);
end
patch(1.0*cos(th), 1.0*sin(th), 0.3*ones(size(th)), C.droneDark, 'EdgeColor', 'none', 'Parent', h);
plot3([0 L*0.9], [0 0], [0.35 0.35], '-', 'Color', C.target, 'LineWidth', 3, 'Parent', h);  % nose
end

function extrude(ax, x, y, h, C)
keep = [true; hypot(diff(x), diff(y)) > 1e-6];
x = x(keep); y = y(keep);
if hypot(x(end) - x(1), y(end) - y(1)) < 1e-6, x(end) = []; y(end) = []; end
n = numel(x);
patch(ax, x, y, h*ones(n, 1), C.roof, 'EdgeColor', C.edge, 'LineWidth', 0.5);
for i = 1:n
    j = mod(i, n) + 1;
    patch(ax, [x(i) x(j) x(j) x(i)], [y(i) y(j) y(j) y(i)], [0 0 h h], C.wall, ...
        'EdgeColor', C.edge, 'LineWidth', 0.5);
end
end

function g = makeWindGauge(fig, C)
g.ax = axes(fig, 'Position', [0.84 0.74 0.14 0.24]);
hold(g.ax, 'on'); axis(g.ax, 'equal', 'off');
th = linspace(0, 2*pi, 100);
fill(g.ax, cos(th), sin(th), [1 1 1], 'EdgeColor', C.edge, 'FaceAlpha', 0.85);
plot(g.ax, 0.5*cos(th), 0.5*sin(th), ':', 'Color', C.edge);
text(g.ax, 0, 1.15, 'N', 'HorizontalAlignment', 'center', 'FontSize', 11, 'Color', C.muted);
g.arrow = quiver(g.ax, 0, 0, 0, 0, 0, 'Color', C.wind, 'LineWidth', 3, 'MaxHeadSize', 0.8);
g.label = text(g.ax, 0, -1.35, '', 'HorizontalAlignment', 'center', 'FontSize', 13, ...
    'FontWeight', 'bold', 'Color', C.text);
xlim(g.ax, [-1.3 1.3]); ylim(g.ax, [-1.6 1.3]);
end

function updateWindGauge(g, wE, wN)
s = hypot(wE, wN);
k = min(s, 10) / 10;                       % full radius = 10 m/s
if s > 0
    set(g.arrow, 'UData', k * wE / s, 'VData', k * wN / s);
else
    set(g.arrow, 'UData', 0, 'VData', 0);
end
g.label.String = sprintf('Wind %.1f m/s', s);
end

function titleCard(fig, vw, o, ttl, sub, secs)
C = palette();
clf(fig);
ax = axes(fig, 'Position', [0 0 1 1], 'Visible', 'off');
xlim(ax, [0 1]); ylim(ax, [0 1]);
text(ax, 0.5, 0.57, ttl, 'FontSize', 40, 'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center', 'Color', C.text);
text(ax, 0.5, 0.45, sub, 'FontSize', 19, 'HorizontalAlignment', 'center', 'Color', C.muted);
text(ax, 0.5, 0.10, 'SoftCon Lab  ·  Santa Clara University', 'FontSize', 14, ...
    'HorizontalAlignment', 'center', 'Color', C.muted);
for k = 1:round(secs * o.FPS)
    writeFrame(fig, vw, o);
end
end

function B = birdPos(t, p)
d = p.bird_end - p.bird_start;
T = p.bird_cycle;
phase = abs(mod(t, T) / (T/2) - 1);
wig = [0.5*sin(1.0*t), 0.5*sin(1.2*t), 0.2*sin(0.8*t)];
B = p.bird_start + phase .* d + wig;       % NED
end

function C = palette()
C.ground = [0.91 0.93 0.90]; C.roof = [0.86 0.88 0.90]; C.wall = [0.78 0.81 0.84];
C.edge = [0.55 0.60 0.64];   C.route = [0.45 0.50 0.55]; C.text = [0.11 0.14 0.16];
C.muted = [0.36 0.41 0.45];  C.drone = [0.12 0.44 0.55]; C.droneDark = [0.07 0.25 0.32];
C.shadow = [0.55 0.58 0.60]; C.bird = [0.72 0.39 0.10];  C.target = [0.18 0.55 0.27];
C.targetFill = [0.84 0.94 0.85]; C.miss = [0.75 0.15 0.12]; C.wind = [0.12 0.44 0.55];
end

% ========================================================================
function [vw, out] = openWriter(out, fps)
try
    vw = VideoWriter(out, 'MPEG-4');
    vw.Quality = 95;
catch
    out = regexprep(out, '\.mp4$', '.avi');
    vw = VideoWriter(out, 'Motion JPEG AVI');
    warning('MPEG-4 not available, writing %s instead', out);
end
vw.FrameRate = fps;
open(vw);
end

function writeFrame(fig, vw, o)
drawnow;
fr = getframe(fig);
img = fr.cdata;
H = o.VideoSize(2); W = o.VideoSize(1);
[h, w, ~] = size(img);
if h ~= H || w ~= W                       % retina / odd window sizes -> fixed output size
    img = img(round(linspace(1, h, H)), round(linspace(1, w, W)), :);
end
writeVideo(vw, img);
end

function finish(vw, fig)
try, close(vw); catch, end
if isvalid(fig), close(fig); end
end
