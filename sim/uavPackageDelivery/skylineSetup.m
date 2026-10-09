function mdl = skylineSetup(varargin)
%SKYLINESETUP  Put MultirotorModel into a known state for Skyline runs.
%
%   mdl = skylineSetup()                 % fast, no pacing (Monte Carlo)
%   mdl = skylineSetup('Pacing', 1)      % run at 1x real time (for screen recording)
%   mdl = skylineSetup('Animate', false) % no UAV Animation window
%
% Opens the uavPackageDelivery project if needed, sets every flag the model
% reads from the base workspace, and loads the model. Run it once per MATLAB
% session (runDemo / runEnvelope call it for you).

p = inputParser;
p.addParameter('Pacing', [], @(x) isempty(x) || (isnumeric(x) && isscalar(x) && x > 0));
p.addParameter('Animate', true, @islogical);
p.addParameter('SimTime', 120, @isnumeric);
p.addParameter('GPSChoice', 'Model', @ischar);   % 'NoModel' bypasses the INS GPS-noise block
p.parse(varargin{:});
o = p.Results;

here = fileparts(mfilename('fullpath'));

% Open the project (adds models/, data/, utilities/ to the path and runs modelInit)
try
    proj = matlab.project.rootProject;
catch
    proj = [];
end
if isempty(proj) || ~strcmp(proj.Name, 'uavPackageDelivery')
    openProject(fullfile(here, 'uavPackageDelivery.prj'));
end

mdl = 'MultirotorModel';

% Flags the model's variant blocks and Stateflow read (same values as MonteCarlo.m)
flags = struct( ...
    'guidanceType',        1, ...  % Full Guidance (Stateflow mode selector + APF)
    'isDroneMulticopter',  1, ...
    'isPhotoRealisticSim', 0, ...
    'plantModelFi',        1, ...  % 1 = HIGH-fidelity 6DOF plant (wind/drift only exist here)
    'showLidarPointCloud', 0, ...
    'showVideoViewer',     0, ...
    'showUAVAnimation',    double(o.Animate), ...
    'useHeading',          1, ...
    'startFlightTime',     0, ...
    'useQGC',              0, ...
    'isNewOA',             0, ...
    'simTime',             o.SimTime);
fn = fieldnames(flags);
for k = 1:numel(fn)
    assignin('base', fn{k}, flags.(fn{k}));
end

% The repo's work/ folder holds Simulink build caches (slprj) from an older
% MATLAB release, which R2025b refuses to reuse. Build into a per-release
% temp folder instead, so nothing in the repo has to be deleted.
gd = fullfile(tempdir, ['skyline_simcache_' version('-release')]);
Simulink.fileGenControl('set', 'CacheFolder', gd, 'CodeGenFolder', gd, 'createDir', true);

load_system(mdl);

% R2025b fix: in the high-fidelity plant, the GPS position reaches the
% Aerospace Blockset "Flat Earth to LLA" block as single, but that block now
% requires double ("Data type mismatch ... GPS Model / XYZ (NEU)"). Insert a
% Data Type Conversion to double in front of it. Done in memory only; the
% .slx is not saved, so the patch is re-applied each MATLAB session.
gpsDir = [mdl '/Inner Loop and Plant Model/High-FidelityModel/Plant Model/Bus setup/Generate GPS Data'];
sa = [gpsDir '/Scale and Assemble GPS Data '];   % trailing space is part of the block name
if isempty(find_system(sa, 'SearchDepth', 1, 'Name', 'ToDouble'))
    try
        add_block('simulink/Signal Attributes/Data Type Conversion', [sa '/ToDouble'], ...
            'OutDataTypeStr', 'double', 'Position', [120 40 160 70]);
        delete_line(sa, 'Xe/1', 'Flat Earth to LLA/1');
        add_line(sa, 'Xe/1', 'ToDouble/1', 'autorouting', 'on');
        add_line(sa, 'ToDouble/1', 'Flat Earth to LLA/1', 'autorouting', 'on');
    catch err
        warning('skylineSetup:gps', 'Could not patch GPS data types: %s', err.message);
    end
end
% Optional: bypass the INS GPS-noise block entirely ('NoModel'); default keeps it.
for vs = {'Variant Source', 'Variant Source1'}
    try
        set_param([gpsDir '/' vs{1}], 'LabelModeActiveChoice', o.GPSChoice);
    catch err
        warning('skylineSetup:gps', 'Could not set %s: %s', vs{1}, err.message);
    end
end

if isempty(o.Pacing)
    set_param(mdl, 'EnablePacing', 'off');
else
    set_param(mdl, 'EnablePacing', 'on', 'PacingRate', o.Pacing);
end
end
