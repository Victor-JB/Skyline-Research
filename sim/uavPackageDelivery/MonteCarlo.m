% This script initializes workspace variables for the UAV Toolbox Reference
% Application.

% Set guidance type to Full Guidance
%<COMMENT>: This needs to be 0 for all fixed wing a/c
guidanceType = 1;

% Configure the drone as a Multicopter
isDroneMulticopter = 1;

% Do not use full photo realistic sim
isPhotoRealisticSim = 0;

% Low fidelity plant model 
plantModelFi = 1;

% No show for Lidar Point Cloud
showLidarPointCloud = 0;

% No show the Video Viewer
showVideoViewer = 0;

% Show the UAV Animation as it flies
showUAVAnimation = 0;

% Use heading in the guidance model
useHeading = 1;

%Takeoff after 0 S
startFlightTime = 0;

% Do not use QGroundControl
useQGC = 0;

% No pacing
load_system('MultirotorModel');
set_param('MultirotorModel','EnablePacing', 'off');

% Simulation Stop Time
simTime = 50;

numRuns = 1;  % Number of simulations
errors = zeros(numRuns,1);

for i = 1:numRuns
    tic
    disp("run" + i);
    % Random mass (3–5 kg scaled to model)
    input_mass = 3 + (5 - 3) * rand(); 
    mass_param = Simulink.Parameter((input_mass-3)/100 + 0.06);
    mass_param.CoderInfo.StorageClass = 'ExportedGlobal';
    assignin('base', 'mass_param', mass_param);

    % Random base wind
    baseWindRange = [3; 3; 1];
    baseWind = baseWindRange .* (2 * rand(3,1) - 1);

    % Random gusts
    T = 50;
    dt = 0.1;
    t = 0:dt:T;

    gustX = zeros(size(t));
    gustY = zeros(size(t));
    gustZ = zeros(size(t));
    for j = 1:round(5/dt):length(t)
        gustX(j:end) = gustX(j:end) + (rand()-0.5)*2;
        gustY(j:end) = gustY(j:end) + (rand()-0.5)*2;
        gustZ(j:end) = gustZ(j:end) + (rand()-0.5)*0.5;
    end

    windTotal = [baseWind(1) + gustX;
                 baseWind(2) + gustY;
                 baseWind(3) + gustZ]';

    wind_param = timeseries(windTotal, t');
    assignin('base', 'wind_param', wind_param);

    % GPS Drift
    gpsDriftX = cumsum(randn(length(t), 1) * 0.01);
    gpsDriftY = cumsum(randn(length(t), 1) * 0.01);
    gps_drift_signal = timeseries([gpsDriftX, gpsDriftY], t);
    assignin('base', 'gps_drift_signal', gps_drift_signal);

    % IMU Drift
    gyroDrift = cumsum(randn(length(t), 3) * deg2rad(0.01));
    gyro_drift_signal = timeseries(gyroDrift, t);
    assignin('base', 'gyro_drift_signal', gyro_drift_signal);

    % Barometric Drift
    baroDriftZ = cumsum(randn(length(t), 1) * 0.01);
    baro_drift_signal = timeseries(baroDriftZ, t);
    assignin('base', 'baro_drift_signal', baro_drift_signal);

    % Motor delay
    motor_delay_time = max(0, 0.015 + 0.005*randn);
    assignin('base', 'motor_delay_time', motor_delay_time);

    % Run sim
    simOut = sim('MultirotorModel');

    uavState = logsout.get('UAVState').Values;
    pos = uavState.pos_vel;
    
    goalXYZ = [-120, -10, 0];  % [X Y Z] in meters
    finalX = pos.x.Data(end);
    finalY = pos.y.Data(end);
    finalZ = pos.z.Data(end);
    
    finalXYZ = [finalX, finalY, finalZ];
    %disp("Final UAV position [X Y Z]:");
    %disp(finalXYZ);
    
    errorVec = finalXYZ - goalXYZ;
    distanceError = norm(errorVec);
    errors(i) = norm(errorVec);
    toc
end

figure;
histogram(errors, 'Normalization', 'probability', 'BinWidth', 0.1);
xlabel('Landing Error (meters)');
ylabel('Probability Density');
title(sprintf('Monte Carlo Error Distribution (%d runs)', numRuns));
grid on;
