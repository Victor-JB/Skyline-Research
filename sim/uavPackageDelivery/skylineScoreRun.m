function r = skylineScoreRun(out, p, varargin)
%SKYLINESCORERUN  Score one MultirotorModel run.
%
%   r = skylineScoreRun(simOut, p)
%   r = skylineScoreRun(simOut, p, 'Goal', [-120 -12], 'LandTol', 5, 'BirdRadius', 0.5)
%
% status: 1 = landed within LandTol, 0 = missed landing, 2 = hit bird.
% The model only logs X_e, so the bird distance is recomputed here from the
% same BirdMotion equation the model uses (no 'birdcrash' signal needed).

ip = inputParser;
ip.addParameter('Goal', [-120 -12]);
ip.addParameter('LandTol', 5);
ip.addParameter('BirdRadius', 0.5);   % same threshold as the model's crash? block
ip.parse(varargin{:});
o = ip.Results;

ls = out.get('logsout');
if isempty(ls)
    ls = evalin('base', 'logsout');
end
Xe = ls.get('X_e').Values;
tt = Xe.Time(:);
P  = squeeze(Xe.Data);
if size(P,1) == 3 && size(P,2) ~= 3, P = P.'; end

final = P(end, :);
err   = norm(final(1:2) - o.Goal(:)');

minBird = inf;
if p.bird
    B = birdPos(tt, p.bird_start, p.bird_end, p.bird_cycle);
    minBird = min(vecnorm(P - B, 2, 2));
end

status = double(err <= o.LandTol);
if minBird <= o.BirdRadius
    status = 2;
end

r = struct('mass', p.mass, 'massPert', p.massPert, 'thrustPert', p.thrustPert, ...
    'perturbation', abs(p.massPert) + abs(p.thrustPert), ...
    'baseWind', p.baseWind, 'windRMS', p.windRMS, 'windMax', p.windMax, ...
    'error', err, 'finalXYZ', final, 'minBirdDist', minBird, ...
    'status', status, 'endTime', tt(end), 't', tt, 'pos', P);
end

function B = birdPos(t, s, e, T)
% Same equation as the BirdMotion MATLAB Function in the model
t = t(:);
d = e - s;
phase = abs(mod(t, T) / (T/2) - 1);
wig = [0.5*sin(1.0*t), 0.5*sin(1.2*t), 0.2*sin(0.8*t)];
B = s + phase .* d + wig;
end
