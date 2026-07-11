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
addMesh(scene,"polygon",{buildingData{1}(1:4,:),[0 30]},color.Gray)
addMesh(scene,"polygon",{buildingData{2}(2:5,:),[0 30]},color.Red)

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

for idx = 0:size(position, 3)-1
    % Move the UAV
    refreshdata
    drawnow limitrate

    % Advance time and update visuals
    advance(scene);
    move(plat,[position(:,:,idx+1),zeros(1,6),eul2quat(orientation(:,:,idx+1)),zeros(1,3)])
    show3D(scene, "Time", scene.CurrentTime, FastUpdate=true, Parent=ax);

    % Plot trajectory and render
    refreshdata;
    drawnow limitrate;
end
hold off