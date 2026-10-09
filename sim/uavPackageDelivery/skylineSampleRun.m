function p = skylineSampleRun(varargin)
%SKYLINESAMPLERUN  Draw (or fix) one run's disturbances and push them to the base workspace.
%
%   p = skylineSampleRun()                         % fully random, same ranges as MonteCarlo.m
%   p = skylineSampleRun('Mass', 5, 'BaseWind', [6 -4 0.5], 'Bird', false)
%
% Any parameter left empty is randomized. Returns a struct with everything
% that was used, so a run can be reproduced or scored later.
%
% Parameters (defaults = random draw):
%   Mass            payload+vehicle mass, kg            (U[3,7])
%   BaseWind        steady wind [N E D], m/s            (U[+-8, +-8, +-2])
%   GustStd         gust std [N E D], m/s               ([2 2 0.5])
%   MassPert        controller mass error, fraction     (0;  set e.g. 'rand' for U[-0.1,0.1])
%   ThrustPert      thrust scaling error, fraction      (0;  'rand' for U[-0.1,0.1])
%   Drift           true/false: GPS/gyro/baro random walks (true)
%   Bird            true/false: bird present            (true)
%   BirdAngle       bird heading in the horizontal, rad (U[0,2pi])
%   BirdHalfCycle   seconds per one-way pass            (U[10,30])
%   SimTime         seconds of disturbance data         (base-workspace simTime, or 120)

ip = inputParser;
ip.addParameter('Mass', []);
ip.addParameter('BaseWind', []);
ip.addParameter('GustStd', [2; 2; 0.5]);
ip.addParameter('MassPert', 0);
ip.addParameter('ThrustPert', 0);
ip.addParameter('Drift', true);
ip.addParameter('Bird', true);
ip.addParameter('BirdAngle', []);
ip.addParameter('BirdHalfCycle', []);
ip.addParameter('SimTime', []);
ip.parse(varargin{:});
o = ip.Results;

if isempty(o.SimTime)
    try, o.SimTime = evalin('base', 'simTime'); catch, o.SimTime = 120; end
end

% ---- Mass ----------------------------------------------------------------
if isempty(o.Mass), o.Mass = 3 + 4*rand(); end
massPert   = pertValue(o.MassPert);
thrustPert = pertValue(o.ThrustPert);

mass_param = Simulink.Parameter(o.Mass);
mass_param.CoderInfo.StorageClass = 'ExportedGlobal';
assignin('base', 'mass_param', mass_param);
ctrl_mass = o.Mass * (1 + massPert);          % what the controller *thinks* the mass is
assignin('base', 'ctrl_mass', ctrl_mass);      % <- name the model actually reads
assignin('base', 'ctrl_mass_param', Simulink.Parameter(ctrl_mass));
assignin('base', 'ctrl_thrust_perturbation_param', Simulink.Parameter(1 + thrustPert));

% ---- Wind (steady + smoothed gusts), covers the whole sim -----------------
dt = 0.1;
t  = (0:dt:o.SimTime + 5)';
n  = numel(t);
if isempty(o.BaseWind), o.BaseWind = [8 8 2] .* (2*rand(1,3) - 1); end
g  = o.GustStd(:)';
gust = [smoothdata(randn(n,1)*g(1), 'gaussian', 50), ...
        smoothdata(randn(n,1)*g(2), 'gaussian', 50), ...
        smoothdata(randn(n,1)*g(3), 'gaussian', 50)];
windTotal = o.BaseWind(:)' + gust;
assignin('base', 'wind_param', timeseries(windTotal, t));

% ---- Sensor drift ---------------------------------------------------------
k = double(logical(o.Drift));
assignin('base', 'gps_drift_signal',  timeseries([cumsum(randn(n,1)*0.01*k), zeros(n,1)], t));
assignin('base', 'gyro_drift_signal', timeseries(cumsum(randn(n,3)*deg2rad(0.01)*k), t));
assignin('base', 'baro_drift_signal', timeseries(cumsum(randn(n,1)*0.01*k), t));

% ---- Bird -----------------------------------------------------------------
mid = [-119, -50, -15];                       % on the final leg of baseMission
if o.Bird
    if isempty(o.BirdAngle), o.BirdAngle = 2*pi*rand(); end
    if isempty(o.BirdHalfCycle), o.BirdHalfCycle = 10 + 20*rand(); end
    dz   = (rand - 0.5) * 6;
    dist = 25 + 5*rand;
    dir  = [[cos(o.BirdAngle), sin(o.BirdAngle)] * dist, dz];
    bird_start = mid - 0.5*dir;
    bird_end   = mid + 0.5*dir;
else
    % Park the bird far away and still: APF never activates
    bird_start = [5000 5000 -15];
    bird_end   = bird_start;
    o.BirdHalfCycle = 10;
end
bird_cycle = 2 * o.BirdHalfCycle;
assignin('base', 'bird_start', bird_start);
assignin('base', 'bird_end',   bird_end);
assignin('base', 'bird_cycle', bird_cycle);

% ---- Inertia (kept for completeness: the 6DOF block currently uses
%      Vehicle.Airframe.inertia, so this value is NOT used by the model) -------
m = o.Mass; a = 0.325; b = 0.325; c = 0.1;
assignin('base', 'inertia_param', Simulink.Parameter(diag(m/12*[b^2+c^2, a^2+c^2, a^2+b^2])));

% ---- Return everything ----------------------------------------------------
p = struct('mass', o.Mass, 'massPert', massPert, 'thrustPert', thrustPert, ...
    'baseWind', o.BaseWind(:)', 'windRMS', rms(vecnorm(windTotal(:,1:2), 2, 2)), ...
    'windMax', max(vecnorm(windTotal(:,1:2), 2, 2)), ...
    'drift', logical(o.Drift), 'bird', logical(o.Bird), ...
    'bird_start', bird_start, 'bird_end', bird_end, 'bird_cycle', bird_cycle, ...
    'windT', t, 'wind', windTotal);
end

function v = pertValue(x)
if ischar(x) || isstring(x)
    v = 0.2*rand() - 0.1;          % 'rand' -> U[-10%, +10%]
else
    v = x;
end
end
