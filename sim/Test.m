tic
% Create the UAV scenario.
scene = uavScenario(UpdateRate=2,ReferenceLocation=[75 -46 0]);

% Add a ground plane.
color.Gray = 0.651*ones(1,3);
color.Green = [0.3922 0.8314 0.0745];
color.Red = [1 0 0];
addMesh(scene,"polygon",{[-250 -150; 200 -150; 200 180; -250 180],[-4 0]},color.Green)

% Load building polygons.
load("scuLayout.mat");

% Add sets of polygons as extruded meshes with varying heights from 10-30.
addMesh(scene,"polygon",{buildingData{1}(1:4,:),[0 70]},color.Gray)
addMesh(scene,"polygon",{buildingData{2}(2:5,:),[0 20]},color.Red)

% Show the scenario.
show3D(scene);
xlim([-250 200])
ylim([-150 180])
zlim([0 50])

load("flightData.mat")

% Set up platform
plat = uavPlatform("UAV",scene,ReferenceFrame="NED", ...
    InitialPosition=position(:,:,1),InitialOrientation=eul2quat(orientation(:,:,1)));

% Set up platform mesh. Add a rotation to orient the mesh to the UAV body frame.
updateMesh(plat,"quadrotor",{10},color.Red,[0 0 0],eul2quat([0 0 pi]))

[ax,plotFrames] = show3D(scene);
xlim([-250 200])
ylim([-150 180])
zlim([0 50])
view([-110 30])
axis equal
hold on

traj = plot3(nan,nan,nan,Color=[1 1 1],LineWidth=2);
traj.XDataSource = "position(:,2,1:idx+1)";
traj.YDataSource = "position(:,1,1:idx+1)";
traj.ZDataSource = "-position(:,3,1:idx+1)";

setup(scene)

% Wind parameters
wind_effect = zeros(size(position));  % create wind effect on modified positions to show later
windSeries = randn(size(position));  % Random wind at each step
windScale = [0.2, 0.2, 0.2];         % Scale per direction

% Loop through all time steps
for idx = 0:size(position, 3)-1
    % Get current index
    i = idx + 1;

    % Apply wind displacement based on velocity and time step
    wind = squeeze(windSeries(:,:,i)) .* windScale;
    wind_displacement = wind * i;  % Linear wind effect over time
    current_position = position(:,:,i) + wind_displacement;


    % Store for later use
    wind_effect(:,:,i) = current_position;

    % Advance time and update visuals
    advance(scene);
    move(plat, [current_position, zeros(1,6), eul2quat(orientation(:,:,i)), zeros(1,3)]);
    show3D(scene, "Time", scene.CurrentTime, FastUpdate=true, Parent=ax);

    refreshdata;
    drawnow limitrate;
end

% Assuming orientation and position are both 1x3x30
numSteps = size(orientation, 3);
updateRate = 2;      % Hz
dt = 1 / updateRate;
t = (0:numSteps-1) * dt;

% Extract and reshape data
pos = squeeze(position);       % Now 3x30
ori = squeeze(orientation);    % Now 3x30

% Transpose to get 30x3
pos = pos';
ori = ori';

% Plot
figure;
subplot(2,1,1);
plot(t, pos);
xlabel('Time (s)');
ylabel('Position (m)');
legend('X','Y','Z');
title('Drone Position Over Time');

subplot(2,1,2);
plot(t, ori);
xlabel('Time (s)');
ylabel('Orientation (rad)');
legend('Roll','Pitch','Yaw');
title('Drone Orientation Over Time');

figure;
plot3(squeeze(position(1,2,:)), squeeze(position(1,1,:)), -squeeze(position(1,3,:)), 'b');
hold on
plot3(squeeze(wind_effect(1,2,:)), squeeze(wind_effect(1,1,:)), -squeeze(wind_effect(1,3,:)), 'r');
legend('Original Path', 'Wind-Affected Path');
title('Drone Trajectory With and Without Wind');


hold off
toc