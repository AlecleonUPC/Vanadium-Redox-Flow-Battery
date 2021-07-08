# IRI Redox Flow Battery
Redox flow battery project within the doctoral thesis developed at the Institute of Robotics and Informatics (IRI) [IRI Project](https://sites.google.com/view/flowbat2021iri/pti-flowbat-iri?authuser=0).

This page has been created to give visibility to the work developed in the IRI in terms of modeling and control of a redox flow batteries. Here is presented the model that is being developed in Matlab and that allows us to analyze the operation of a redox flow battery.

<p align="center">
  <img width="460" height="300" src="https://github.com/AlecleonUPC/IRI-Redox-Flow-Battery/blob/master/Project_GITHUB/Figures/RFB_Scheme.JPG">
</p>

# What contains this project
This project presents the folders that are contained in this project, and how to use the different files in case that anyone wants to simulate his particular redox flow battery system, or determine some of the parameters that can not been easily measured, with real data by means of a calibration algorithm that is presented.

There are four different folders:
- Figures: contain the different Figures of the Simulink models and the ones that appear on this web project.
- Real data: contains 3 .txt files consisting on data from a real experiment with a cell. This data includes Voltage, Current and Time.
- Model: contains the file "CompleteModel" that is a 2016a version Simulink model of the complete system and the the "Data_Parameters.m" file.
- Calibration: contains 5 different files, the same "Data_Parameters.m", the Simulink "Model", the "Model_Calibration.m" and "Run_Calibration.m" which are the Matlab funcitons used to perform the parameter calibration by means of a Particle Swarm Optimization, and the "Results_Plots.m" that shows the results.

It is important to notice, that in order to perform the Model or Calibration with real data, it is need to have these files in the same Matlab folder.

## Model

## Calibration

# Publications

