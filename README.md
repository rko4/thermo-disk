# thermo-disk

**A transient radial heat‑transfer simulator in MATLAB**  
An explicit finite‑difference solver for temperature evolution in a thin copper disk under sudden internal heating, created as a 2013 interview home task.

---

## Overview

This project solves the cylindrical heat equation in a disk (inner radius R₁, outer radius R₂) with:
- **Fixed internal boundary** at constant temperature  
- **Insulated outer boundary** (no flux)  
- **Negligible convective losses** on the curved face  

The temperature update formula is:  
u(n+1,j) = A·u(n,j) + B·u(n,j+1) + C·u(n,j-1) + D·T_air

Coefficients A, B, C, D derive from copper’s material properties and geometry.

---

## Features

- **Pure MATLAB** (no extra toolboxes)  
- Modular functions for parameter init, solver, plotting, and animation  
- 2D contour & 3D surface visualizations  
- Easy tuning of Δr, Δt, disk dimensions, and material constants  

---

## Repository Structure

- `initParameters.m`  
  Initialize disk geometry, material constants, and numerical steps.  
- `heatDisk.m`  
  Core solver: returns temperature matrix over time and radius.  
- `showDistribution.m`  
  Plot temperature vs. radius at a specified time.  
- `animateDistribution.m`  
  Create 2D contour animations.  
- `animateCylindricDistribution.m`  
  Create 3D surface animations.  
- `evalDistribution.m`  
  Master script: runs init, solver, and selected visualizations.  
- `Task_thermal_solution.pdf`  
  Derivation details and sample output snapshots.

---

## Usage

1. Open MATLAB and change directory to the project root.  
2. Run the master script:
   ```matlab
   evalDistribution;
