function out = runMissionSim(varargin)
% Optional overrides:   runMissionSim("mass",5,"propDiam",0.35)

% ---------------------------------------------------------------
% 1. Load base configs
cfgCampus  = campusConfig();
cfgVeh     = vehicleConfig();

% 2. Apply overrides (name/value pairs)
for k = 1:2:numel(varargin)
    cfgVeh.(varargin{k}) = varargin{k+1};
end

% 3. Build scenario & vehicle
sc         = buildCampusScenario();
waypts     = missionWaypoints();

uav        = uavPlatform("Quad1","Scenario",sc,"ReferenceFrame","ENU");
sensors(1) = uavSensor("GPS","UpdateRate",10);
addSensor(uav,sensors(1));

% Battery block (Simscape) – outputs SOC for emergency logic
battBlk    = makeBatteryBlock(cfgVeh);

% Simple multirotor dynamics model
load_system('uavMultirotor');          % supplied by UAV Toolbox examples
mdl       = 'uavMultirotor';
set_param(mdl,'StopTime',"200");

% Parameter injection
set_param([mdl '/Vehicle Parameters'],'Value',cfgVeh);

% Guidance module
assignin('base','waypoints',waypts);
open_system([mdl '/Guidance/WaypointFollower']);

% 4. Run simulation ------------------------------------------------
simOut = sim(mdl,"SimulationMode","accelerator");
out    = simOut;

% 5. Basic result plots
figure; plot(simOut.tout,simOut.logsout.get('pos').Values.Data(:,3));
xlabel('t (s)'); ylabel('Altitude (m)'); grid on;
title('Altitude profile');
end
