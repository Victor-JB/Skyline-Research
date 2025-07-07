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
showUAVAnimation = 1;

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
simTime = 100;

numRuns = 1;  % Set how many runs you want

errors = zeros(1, numRuns);
 results = repmat(struct( ...
    'mass', [], ...
    'wind', [], ...
    'windMag', [], ...
    'motor_delay', [], ...
    'error', [], ...
    'finalZ', [], ...
    'status', [] ...
), numRuns, 1);

for i = 1:numRuns
    tic
    fprintf("Run %d\n", i);

    % Randomized Parameters

    % Mass (scaled from 3–8 kg to Simulink model input)
    input_mass = 3 + (8 - 3) * rand();
    mass_param = Simulink.Parameter(input_mass);
    mass_param.CoderInfo.StorageClass = 'ExportedGlobal';
    assignin('base', 'mass_param', mass_param);

    % Base Wind (±7, ±7, ±2)
    baseWindRange = [0; 0; 0];
    baseWind = baseWindRange .* (2 * rand(3,1) - 1);  % [-7, 7], [-7, 7], [-2, 2]
    
    % Time setup
    T = 100; dt = 0.1;
    t = 0:dt:T;
    n = length(t);
    
    % Gust standard deviations (realistic)
    gust_std = [2; 2; 0.5]; % Max ~2 m/s in X/Y, 0.5 m/s in Z
    
    % Generate smooth gusts (filtered white noise)
    gustX = smoothdata(randn(1,n) * gust_std(1), 'gaussian', 50);
    gustY = smoothdata(randn(1,n) * gust_std(2), 'gaussian', 50);
    gustZ = smoothdata(randn(1,n) * gust_std(3), 'gaussian', 50);
    
    % Total wind (base + gust)
    windTotal = [baseWind(1) + gustX;
                 baseWind(2) + gustY;
                 baseWind(3) + gustZ]';
    
    % Package
    wind_param = timeseries(windTotal, t');
    assignin('base', 'wind_param', wind_param);

    % GPS Drift
    gpsDriftX = cumsum(randn(length(t), 1) * 0.01); %0.01
    gpsDriftY = cumsum(randn(length(t), 1) * 0.00);
    gps_drift_signal = timeseries([gpsDriftX, gpsDriftY], t);
    assignin('base', 'gps_drift_signal', gps_drift_signal);

    % IMU Drift
    gyroDrift = cumsum(randn(length(t), 3) * deg2rad(0.01));%0.01
    gyro_drift_signal = timeseries(gyroDrift, t);
    assignin('base', 'gyro_drift_signal', gyro_drift_signal);

    % Barometric Drift
    baroDriftZ = cumsum(randn(length(t), 1) * 0.01);%0.01
    baro_drift_signal = timeseries(baroDriftZ, t);
    assignin('base', 'baro_drift_signal', baro_drift_signal);

    % Motor Delay (prevent negative)
    motor_delay_time = max(0, 0.015 + 0.005 * randn);
    assignin('base', 'motor_delay_time', motor_delay_time);

    % Run Simulation
    simOut = sim('MultirotorModel');

    uavState = logsout.get('UAVState').Values;
    pos = uavState.pos_vel;

    goalXYZ = [-120, -12, 0];  % Target
    finalXYZ = [pos.x.Data(end), pos.y.Data(end), pos.z.Data(end)];
    errorVec = finalXYZ(1:2) - goalXYZ(1:2);
    distanceError = norm(errorVec);
    errors(i) = distanceError;

    % Calculate wind magnitude
    windXYMag = sqrt(windTotal(:,1).^2 + windTotal(:,2).^2); % instantaneous magnitude in XY
    windMagnitude = rms(windXYMag); % root mean square over time

    % Success/failure: within 3m and above ground
    status = (distanceError <= 5);

    % Log run data
    results(i) = struct( ...
        'mass', input_mass, ...
        'wind', baseWind, ...
        'windMag', windMagnitude, ...
        'motor_delay', motor_delay_time, ...
        'error', distanceError, ...
        'finalZ', finalXYZ(3), ...
        'status', status ...
    );

    toc
    disp(input_mass);
    disp(windMagnitude);
    disp(finalXYZ());
    disp(distanceError);
end

% Close old figures
close all;

% Plot Error Distribution
figure;
histogram(errors, 'Normalization', 'probability', 'BinWidth', 0.1);
xlabel('Landing Error (meters)');
ylabel('Probability Density');
title(sprintf('Monte Carlo Error Distribution (%d runs)', numRuns));
grid on;

% Plot Wind vs. Mass with Success/Failure
massVals = [results.mass];
windMags = [results.windMag];
statuses = [results.status];
 
figure;
scatter(massVals(statuses==1), windMags(statuses==1), 60, 'g', 'filled'); hold on;
scatter(massVals(statuses==0), windMags(statuses==0), 60, 'r', 'filled');
xlabel('Mass (kg)');
ylabel('Wind+Gust Magnitude (m/s)');
title('Success vs. Failure by Mass and Wind');
legend('Success', 'Failure');
grid on;