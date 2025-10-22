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
simTime = 120;

numRuns = 100;  % Set how many runs you want

errors = zeros(1, numRuns);
 results = repmat(struct( ...
    'mass', [], ...
    'perturbation', [], ...
    'wind', [], ...
    'windMag', [], ...
    'error', [], ...
    'finalZ', [], ...
    'status', [] ...
), numRuns, 1);

for i = 1:numRuns
    tic
    fprintf("Run %d\n", i);

    % Randomized Parameters

    % Random perturbation between -10% and +10%
    mass_perturbation = 0;%(rand() * 0.2) - 0.1;  % range [-0.1, +0.1]

    % Mass (scaled from 3–8 kg to Simulink model input)
    input_mass = 3 + (7 - 3) * rand();
    mass_param = Simulink.Parameter(input_mass);
    mass_param.CoderInfo.StorageClass = 'ExportedGlobal';
    assignin('base', 'mass_param', mass_param);
    ctrl_mass = input_mass * (1 + mass_perturbation);
    assignin('base', 'ctrl_mass_param', Simulink.Parameter(ctrl_mass));

    % Inertia
    m = input_mass;
    x = 0.325;
    y = 0.325;
    z = 0.1;
    
    Ixx = (1/12)*m*(y^2 + z^2);
    Iyy = (1/12)*m*(x^2 + z^2);
    Izz = (1/12)*m*(x^2 + y^2);

    inertia_matrix = diag([Ixx, Iyy, Izz]);
    assignin('base', 'inertia_param', Simulink.Parameter(inertia_matrix));

    % Base Wind (±8, ±8, ±2)
    baseWindRange = [8; 8; 2];
    baseWind = baseWindRange.* (2 * rand(3,1) - 1);  % [-7, 7], [-7, 7], [-2, 2]
    
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

    % Thrust perturbation between -10% and +10%
    thrust_perturbation = 0;%(rand() * 0.2) - 0.1;  % range [-0.1, +0.1]
    ctrl_thrust_perturbation = 1 + thrust_perturbation;
    assignin('base', 'ctrl_thrust_perturbation_param', Simulink.Parameter(ctrl_thrust_perturbation));

    % Bird generation
    mid = [-119, -50, -15];

    angle = 2 * pi * rand;
    dir2D = [cos(angle), sin(angle)];
    dz = (rand - 0.5) * 6;  % vertical span ±3 m

    distance = 25 + 5 * rand;  % 25–30 meters
    dir = [dir2D * distance, dz];
    bird_start = mid - 0.5 * dir;
    bird_end   = mid + 0.5 * dir;
    
    half_cycle = 10 + 20 * rand;  % 5–15 seconds
    bird_cycle = 2 * half_cycle;

    assignin('base', 'bird_start', bird_start);
    assignin('base', 'bird_end', bird_end);
    assignin('base', 'bird_cycle', bird_cycle);

    % Run Simulation
    sim('MultirotorModel');

    pos_ts = logsout.get('X_e').Values;
    finalXYZ = pos_ts.Data(end, :);

    goalXYZ = [-120, -12, 0];  % Target
    errorVec = finalXYZ(1:2) - goalXYZ(1:2);  % Only x, y components
    distanceError = norm(errorVec);           % Euclidean distance
    errors(i) = distanceError;

    % Calculate wind magnitude
    windXYMag = sqrt(windTotal(:,1).^2 + windTotal(:,2).^2); % instantaneous magnitude in XY
    windMagnitude = rms(windXYMag); % root mean square over time

    % Success/failure: within 5m
    status = (distanceError <= 5);
    
    birdcrash = logsout.get('birdcrash').Values;
    bird_collision_flag = any(birdcrash.Data > 0);
    if bird_collision_flag
        status = 2;
        break;
    end

    % Log run data
    results(i) = struct( ...
        'mass', input_mass, ...
        'perturbation', abs(mass_perturbation)+abs(thrust_perturbation), ...
        'wind', baseWind, ...
        'windMag', windMagnitude, ...
        'error', distanceError, ...
        'finalZ', finalXYZ(3), ...
        'status', status ...
    );

    toc
    disp(input_mass);
    disp(windMagnitude);
    disp(finalXYZ());
    disp(distanceError);
    clear simOut logsout pos_ts
    clear simOut logsout birdcrash
end

% Close old figures
close all;

%% === Extract data ===
massVals = [results.mass];
windMags = [results.windMag];
perturbationVals = [results.perturbation] * 100;  % convert to %

statuses = [results.status];  % 1=success, 0=failure

% === Center point ===
centerMass = 3;
centerWind = 0;
centerPert = 0;

% === Max caps ===
massCap = 6.3;

% === Search ranges ===
radiiStepsX = linspace(0.5, massCap - centerMass, 20);  % mass (to cap)
radiiStepsY = linspace(0.5, 10, 24);                   % wind
radiiStepsZ = linspace(0.5, 20, 40);                  % perturbation

% === Initialize search ===
maxVolume = -inf;
bestRx = NaN; bestRy = NaN; bestRz = NaN;
bestFrac = 0;
for rx = radiiStepsX
    for ry = radiiStepsY
        for rz = radiiStepsZ
            insideIdx = ((massVals - centerMass) / rx).^2 + ...
                        ((windMags - centerWind) / ry).^2 + ...
                        ((perturbationVals - centerPert) / rz).^2 <= 1;
            numInside = sum(insideIdx);
            if numInside < 10, continue; end
            numSuccess = sum(statuses(insideIdx) == 1);
            fracSuccess = numSuccess / numInside;
            volume = (4/3) * pi * rx * ry * rz;
            if fracSuccess >= 0. && volume > maxVolume
                bestRx = rx; bestRy = ry; bestRz = rz;
                maxVolume = volume;
                bestFrac = fracSuccess;
            end
        end
    end
end

fprintf('Selected ellipsoid: rx=%.2f, ry=%.2f, rz=%.2f | Success inside: %.1f%%\n', ...
        bestRx, bestRy, bestRz, bestFrac * 100);

% === Plot 3D scatter ===
figure;
scatter3(massVals(statuses==1), windMags(statuses==1), perturbationVals(statuses==1), ...
    40, 'g', 'filled'); hold on;
scatter3(massVals(statuses==0), windMags(statuses==0), perturbationVals(statuses==0), ...
    40, 'r', 'filled');
scatter3(massVals(statuses==2), windMags(statuses==2), perturbationVals(statuses==2), ...
    40, 'm', 'filled');

xlabel('Mass (kg)');
ylabel('Wind+Gust Magnitude (m/s)');
zlabel('Perturbation (%)');
title('Success vs. Failure');
grid on;
view(135, 25);
xlim([3 7]);
ylim([0 12]);
zlim([0 20]);
set(gca, 'XDir','reverse');

% === Draw ellipsoid ===
[ex, ey, ez] = sphere(50);
XS = bestRx * ex + centerMass;
YS = bestRy * ey + centerWind;
ZS = bestRz * ez + centerPert;

% Apply caps to ellipsoid surface (cut off negative + mass cap)
XS(XS < centerMass) = NaN;
YS(YS < centerWind) = NaN;
ZS(ZS < centerPert) = NaN;
XS(XS > massCap) = NaN;

% Plot
surf(XS, YS, ZS, 'FaceAlpha', 0.2, 'EdgeColor', 'none', 'FaceColor', [0.4 0.6 1]);
legend('Success', 'Missed landing', 'Hit Bird', 'Safe Zone');

% Extract errors for successes
successErrors = [results([results.status] == 1).error];

% Compute stats
meanErr = mean(successErrors);
stdErr = std(successErrors);
minErr = min(successErrors);
maxErr = max(successErrors);

fprintf('Landing error stats (successful runs only):\n');
fprintf('Mean = %.2f m, Std = %.2f m, Min = %.2f m, Max = %.2f m\n', ...
    meanErr, stdErr, minErr, maxErr);