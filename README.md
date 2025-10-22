# Project Skyline · Safe and Intelligent Autonomy for Aerial Delivery
Santa Clara University · Burak Kürkçü Research Group

> A research initiative developing verifiable, safety-critical autonomy for small UAVs operating in human environments.

---

## Overview
Project Skyline develops safety-critical autonomy frameworks for aerial delivery systems. Our work integrates control theory, perception, and simulation-based validation to improve UAV reliability in real-world conditions.

We focus on verifiable, failure-resilient autopilot and perception modules for GPS-denied and disturbance-rich environments such as university campuses, industrial sites, and suburban corridors.

---

## Technical Stack

| Domain | Tools / Frameworks | Description |
|---------|--------------------|--------------|
| Simulation | MATLAB · Simulink · Gazebo | 6-DoF digital twin and Monte Carlo regression testing |
| Control | PX4 · Control Barrier Functions | Supervisory safety layer for enforcing flight constraints |
| Perception | Stereo Vision · LiDAR · IMU · GPS Fusion | Multi-sensor perception pipeline for robust navigation |
| Analysis | Python · ROS · OpenCV | Data logging, safety metrics, and post-flight validation |

---

## Research Focus
- **Autopilot Safety and Certification Readiness** – redundant control architectures and verified safety guarantees.  
- **Obstacle Detection and Sensor Fusion** – robust perception under uncertain sensing conditions.  
- **Simulation-Based Validation** – Monte Carlo trials for wind, mass, and sensor fault modeling.  
- **Operational Risk Modeling** – quantitative risk estimation and envelope analysis.

---

## Example Modules (coming soon, here for placeholder)
- `/matlab/autopilot_validation.m` — Monte Carlo flight envelope analysis  
- `/gazebo/sensor_fault_tests/` — randomized LiDAR and IMU fault injection  
- `/analysis/safety_metrics.py` — probability of constraint violation estimator  

---

## Results
- Safety metrics computed over **6,000+ simulated flight scenarios**
- Validated control-barrier-function enforcement in real time
- Modular sensor fusion architecture ready for hardware-in-the-loop testing

---

## Proposal & Documentation
- [📄 Research Proposal (PDF)](docs/Project_Skyline_Proposal.pdf)
- [📊 Simulation Environment Image](docs/system_architecture_diagram.png) (TBAdded)

---

## Contact
**Burak Kürkçü, Ph.D.** — Faculty Advisor  
**Nikhil Ranjit** — nranjit@scu.edu  
**Victor Joulin-Batejat** — vjoulinbatejat@scu.edu
