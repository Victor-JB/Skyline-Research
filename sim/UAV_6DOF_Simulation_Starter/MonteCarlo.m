numRuns = 1;
final_positions = zeros(numRuns, 3);
all_paths = cell(numRuns, 1);  % stores each Xe path

for i = 1:numRuns
    t = linspace(0, 20, 201);

    % Random parameters
    mass = 1.5 + rand*0.5;
    wind_scale = randn;

    wind_x = wind_scale * 2 * sin(0.5 * t);
    wind_y = wind_scale * 1.5 * cos(0.3 * t);
    wind_z = wind_scale * 0.4 * sin(0.7 * t);
    thrust = mass * 9.81 * ones(size(t));
    force_input = [t' wind_x' wind_y' -thrust' + wind_z'];

    omega_x = 0.01 * sin(0.4 * t);
    omega_y = 0.01 * cos(0.4 * t);
    omega_z = 0.015 * sin(0.2 * t);
    torque_input = [t' omega_x' omega_y' omega_z'];

    % Simulate
    simOut = sim('UAV_6DOF','StopTime','20','SaveOutput','on');

    % Extract entire path
    Xe = simOut.logsout.get('Xe').Values.Data;
    all_paths{i} = Xe;
    final_positions(i, :) = Xe(end, :);
end
figure;
hold on;
for i = 1:numRuns
    path = all_paths{i};
    plot3(path(:,1), path(:,2), path(:,3), 'LineWidth', 1.2);
    scatter3(path(1,1), path(1,2), path(1,3), 50, 'g', 'filled'); % Start
    scatter3(path(end,1), path(end,2), path(end,3), 50, 'r', 'filled'); % End
end
xlabel('X'); ylabel('Y'); zlabel('Z');
grid on;
axis equal;
view(3);  % Set 3D viewing angle
title('Monte Carlo UAV Paths (3D)');