function env = plotEnvelope(src, varargin)
%PLOTENVELOPE  Success/failure scatter + largest "safe" ellipsoid.
%
%   plotEnvelope('results/envelope_20261009_120000.mat')
%   plotEnvelope(resultsStruct, 'MinSuccess', 0.95, 'Wind', 'windMax')
%
% The ellipsoid is anchored at the easy corner (lightest mass, no wind, no
% perturbation) and grown as large as possible while the fraction of
% successful runs inside it stays >= MinSuccess.
%
% NOTE on the committed MonteCarlo.m: Nikhil's earlier versions used
% MinSuccess = 0.9. The final commit has `fracSuccess >= 0.`, which accepts
% ANY success rate, so its "Safe Zone" is just the biggest ellipsoid the grid
% allows. Use 0.9-0.95 here for a meaningful bound.

ip = inputParser;
ip.addParameter('MinSuccess', 0.9);
ip.addParameter('MinPoints', 10);
ip.addParameter('Wind', 'windRMS');       % or 'windMax'
ip.addParameter('MassCap', 7);
ip.parse(varargin{:});
o = ip.Results;

if ischar(src) || isstring(src)
    S = load(src); R = S.results;
else
    R = src;
end

mass = [R.mass];
wind = [R.(o.Wind)];
pert = 100 * [R.perturbation];
st   = [R.status];
c0 = [min(mass), 0, 0];

rx = linspace(0.25, o.MassCap - c0(1), 25);
ry = linspace(0.5, max(wind)*1.05, 30);
rz = linspace(0.5, max(max(pert)*1.05, 1), 30);

best = struct('rx', NaN, 'ry', NaN, 'rz', NaN, 'vol', -inf, 'frac', NaN, 'n', 0);
for a = rx
    for b = ry
        for c = rz
            in = ((mass-c0(1))/a).^2 + ((wind-c0(2))/b).^2 + ((pert-c0(3))/c).^2 <= 1;
            n = nnz(in);
            if n < o.MinPoints, continue; end
            frac = nnz(st(in) == 1) / n;
            v = a*b*c;
            if frac >= o.MinSuccess && v > best.vol
                best = struct('rx', a, 'ry', b, 'rz', c, 'vol', v, 'frac', frac, 'n', n);
            end
        end
    end
end

figure('Color', 'w'); hold on; grid on
cols = {[0.1 0.7 0.2], [0.85 0.15 0.1], [0.8 0.2 0.8]};
names = {'Missed landing', 'Success', 'Hit bird'};
h = gobjects(0); lab = {};
for s = [1 0 2]
    k = st == s;
    if any(k)
        h(end+1) = scatter3(mass(k), wind(k), pert(k), 30, cols{s==[1 0 2]}, 'filled'); %#ok<AGROW>
        lab{end+1} = names{s+1}; %#ok<AGROW>
    end
end
if ~isnan(best.rx)
    [ex, ey, ez] = sphere(50);
    XS = best.rx*ex + c0(1); YS = best.ry*ey + c0(2); ZS = best.rz*ez + c0(3);
    XS(XS < c0(1)) = NaN; YS(YS < 0) = NaN; ZS(ZS < 0) = NaN;
    h(end+1) = surf(XS, YS, ZS, 'FaceAlpha', 0.2, 'EdgeColor', 'none', 'FaceColor', [0.4 0.6 1]);
    lab{end+1} = sprintf('Envelope (>= %.0f%% success)', 100*o.MinSuccess);
end
xlabel('Mass (kg)'); ylabel(sprintf('Wind (%s, m/s)', o.Wind)); zlabel('Perturbation (%)');
title(sprintf('Success vs. failure, %d runs', numel(R)));
legend(h, lab, 'Location', 'northeastoutside');
view(135, 25); set(gca, 'XDir', 'reverse');

succ = [R(st == 1).error];
fprintf('Runs: %d | success %d | missed %d | bird %d\n', numel(R), nnz(st==1), nnz(st==0), nnz(st==2));
if ~isempty(succ)
    fprintf('Landing error (successes): mean %.2f m, std %.2f, max %.2f\n', mean(succ), std(succ), max(succ));
end
if isnan(best.rx)
    fprintf('No ellipsoid reached %.0f%% success with >= %d runs inside.\n', 100*o.MinSuccess, o.MinPoints);
else
    fprintf('Envelope: mass %.2f-%.2f kg, wind up to %.1f m/s, perturbation up to %.1f%% (%d runs inside, %.0f%% success)\n', ...
        c0(1), c0(1)+best.rx, best.ry, best.rz, best.n, 100*best.frac);
end
env = best;
end
