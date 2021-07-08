# IRI Redox Flow Battery
Redox flow battery project within the doctoral thesis developed at the Institute of Robotics and Informatics (IRI) [IRI Project](https://sites.google.com/view/flowbat2021iri/pti-flowbat-iri?authuser=0).

This page has been created to give visibility to the work developed in the IRI in terms of modeling and control of a redox flow batteries. Here is presented the model that is being developed in Matlab and that allows us to analyze the operation of a redox flow battery.

<p align="center">
  <img src="https://github.com/AlecleonUPC/IRI-Redox-Flow-Battery/blob/master/Project_GITHUB/Figures/RFB_Scheme.JPG">
</p>

# What contains this project
This project presents the folders that are contained in this project, and how to use the different files in case that anyone wants to simulate his particular redox flow battery system, or determine some of the parameters that can not been easily measured, with real data by means of a calibration algorithm that is presented.

There are four different folders:
- Figures: contain the different Figures of the Simulink models and the ones that appear on this web project.
- Real data: contains 3 .txt files consisting on data from a real experiment with a cell. This data includes Voltage, Current and Time.
- Model: contains the file "CompleteModel.slx" and "CompleteModelv16a.slx" that is a 2016a version Simulink model of the complete system and the "Data_Parameters_CompleteModel.m" file.
- Calibration: contains 5 different files, the same "Data_Parameters.m", the Simulink "Model", the "Model_Calibration.m" and "Run_Calibration.m" which are the Matlab funcitons used to perform the parameter calibration by means of a Particle Swarm Optimization, and the "Results_Plots.m" that shows the results.

It is important to notice, that in order to perform the Model or Calibration with real data, it is need to have these files in the same Matlab folder.

## Model
The Model folder contains the files need to perform a Simulation of the complete system. In this way, it is possible to simulate the evolution of the different concentrations, voltage, temperature and hydraulic losses selecting the current (positive during the charging and negative during the discharging), the flow rates and the air temperature.
<p align="center">
  <img width="460" height="300" src="https://github.com/AlecleonUPC/IRI-Redox-Flow-Battery/blob/master/Project_GITHUB/Figures/CompleteModel.JPG">
</p>



## Calibration

# Publications

- 2021
  - [1] Clemente, A., Cecilia, A., Costa-Castelló, R.: SOC and diffusion rates estimation in redox flow batteries: An II-based high-gain observer approach. European Control Conference.
  - [2] Clemente, A., Costa-Castelló, R.: Flow controlling tuning for the voltage of a redox flow battery considering the effect of overpotentials. ETFA 2021 - 26th Annual Conference of the IEEE Industrial Electronics Society (IES).
  - [3] Clemente, A., Montiel, M., Barreras, F., Lozano, A., Costa-Castelló, R.: Vanadium Redox Flow Battery State of Charge Estimation Using a Concentration Model and a Sliding Mode Observer. IEEE ACCESS, 9, 72368–72376. [DOI](https://ieeexplore.ieee.org/document/9427541/)
 
- 2020
  - [1] Clemente, A., Ramos, A., Costa-Castelló, R. Voltage H∞ control of a vanadium redox flow battery. Electronics, 9(10): 1567. [DOI](https://doi.org/10.3390/electronics9101567)
  - [2] Clemente, A., Costa-Castelló, R. Redox flow batteries: A literature review oriented to automatic control. Energies, 13(17): 4514. [DOI](https://doi.org/10.3390/en13174514)
