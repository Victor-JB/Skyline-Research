
UAV 6DOF Simulink Model Instructions
====================================

This package includes a .mat file with simulated input data for a 6DOF UAV model in Simulink.

Included File:
--------------
- uav6dof_inputs.mat : Contains thrust, wind_x, wind_y, wind_z, and angular velocities over time.

Steps to Implement in Simulink:
-------------------------------
1. Open Simulink and create a new model.
2. From the Aerospace Blockset, drag in:
   - '6DOF (Euler Angles)' block
   - 'From Workspace' blocks for each of: thrust, wind_x, wind_y, wind_z, omega_x, omega_y, omega_z
   - 'Mux' blocks to combine signals into force/torque vectors
   - 'Scope' blocks to visualize outputs
3. Load the data:
   In your MATLAB script or Command Window, run:
       load('uav6dof_inputs.mat')

4. Connect inputs:
   - Combine thrust and wind vectors into a 3x1 force vector
   - Combine omega values into a 3x1 torque vector
   - Connect both to the 6DOF block

5. Run the simulation for 20 seconds and view the position, velocity, and orientation outputs.

