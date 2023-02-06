# Redox Flow Battery
Redox flow battery project within the doctoral thesis developed at the Institute of Robotics and Informatics (IRI) [IRI Project](https://sites.google.com/view/flowbat2021iri/pti-flowbat-iri?authuser=0).

This page has been created to give visibility to the work developed in the IRI in terms of modeling and control of a redox flow batteries. Here is presented the model that is being developed in Matlab and that allows us to analyze the operation of a redox flow battery.

<p align="center">
  <img width="400" height="250" src="https://github.com/AlecleonUPC/IRI-Redox-Flow-Battery/blob/master/Project_GITHUB/Figures/RFB_Scheme.JPG">
</p>

# What contains this project
This project presents the folders that are contained in this project, and how to use the different files in case that anyone wants to simulate his particular redox flow battery system, or determine some of the parameters that can not been easily measured, with real data by means of a calibration algorithm that is presented.

There are four different folders:
- Figures: contain the different Figures of the Simulink models and the ones that appear on this web project.
- Real data: contains 3 .txt files consisting on data from a real experiment with a cell. This data includes Voltage, Current and Time.
- Model: contains the file "CompleteModel.slx" and "CompleteModelv16a.slx" that is a 2016a version Simulink model of the complete system and the "Data_Parameters_CompleteModel.m" file.
- Calibration: contains 5 different files, the same "Data_Parameters.m", the Simulink "Model", the "Model_Calibration.m" and "Run_Calibration.m" which are the Matlab funcitons used to perform the parameter calibration by means of a Particle Swarm Optimization, and the "Results_Plots.m" that shows the results.

It is important to notice, that in order to perform the Model or Calibration with real data, it is need to have these files in the same Matlab folder.

## Real data
The Real data folder contains different arrays of data that can be used to simulate and compare real profiles of charging or discharging processes. Actually, in this project there are only three arrays of data that are being used which consists on:
- Time: array with the samples times of the acquired data (in seconds).
- Current: array of the charging or discharginc currents (in Amperes).
- Voltage: array of the cell voltage measures (in Volts)

With this data, it is possible to analyze the system introducing the Current as an input and compare the Voltage array which has been acquired experimentally with the voltage resulted from the model.

## Model
The Model folder contains the files need to perform a Simulation of the complete system. In this way, it is possible to simulate the evolution of the different concentrations, voltage, temperature and hydraulic losses selecting the current (positive during the charging and negative during the discharging), the flow rates and the air temperature.

The "CompleteModel.slx" and "CompleteModelv16a.slx" files contain the complete Simulink model
<p align="center">
  <img width="700" height="300" src="https://github.com/AlecleonUPC/IRI-Redox-Flow-Battery/blob/master/Project_GITHUB/Figures/CompleteModel.JPG">
</p>

This model, has been separated in different parts which consists on the following ones:

- Electrochemical model: determines the evolution of the different species concentration in the cells and tanks parts of the system. It considers the current and electrolyte flow rates and also the diffusion through the membrane, whose impact it is seen in the long term.
<p align="center">
  <img  src="https://github.com/AlecleonUPC/IRI-Redox-Flow-Battery/blob/master/Project_GITHUB/Figures/ElectrochemicalModel.JPG">
</p>

- Voltage and overpotentials model: determines the cell or stack voltage of the system. It is based on the Nerst equation expression to compute the open cirucuit cell voltage which only depends on the cell concentrations, but it also takes into account the effect of other overpotentials such as the activation and ohmic ones.
<p align="center">
  <img src="https://github.com/AlecleonUPC/IRI-Redox-Flow-Battery/blob/master/Project_GITHUB/Figures/Voltages.JPG">
</p>

- Hydrualic model: determines the power of the pumps needed to inject the desired electrolyte flow rate in the system considering the pressure that appears in the different parts of the system (electrodes, pipes...).
<p align="center">
  <img src="https://github.com/AlecleonUPC/IRI-Redox-Flow-Battery/blob/master/Project_GITHUB/Figures/HydraulicPressure.JPG">
</p>

- Temperature model: determines the temperature of all parts of the system, paying attention in the cell/stack temperature which is the ones that can be most affected  by temperature increases due, for example, to the Joule effect.
<p align="center">
  <img src="https://github.com/AlecleonUPC/IRI-Redox-Flow-Battery/blob/master/Project_GITHUB/Figures/ThermalModel.JPG">
</p>

- Indicators: allows to determine the most important metrics of a redox flow battery system, which are the energy stored, the state of charge (SOC) in both sides of the system or the power of the battery.
<p align="center">
  <img src="https://github.com/AlecleonUPC/IRI-Redox-Flow-Battery/blob/master/Project_GITHUB/Figures/Indicators.JPG">
</p>

In order to execute the Model folder. The following steps must be done:

1. Open the "Data_Parameters_CompleteModel.m" file. This file contain the Parameters of the complete model that can be changed for the user in terms of the desired characteristics.
2. Execute the "Data_Parameters_CompleteModel.m" file to save into the Worksapce all parameters.
3. Run the "CompleteModel.slx" or "CompleteModelv16a.slx" Simulink model to see ther results.


## Calibration
This folder contains the different files that are needed to compute a calibration of the desired parameters of the model system that can be unknown for the user as for example, ohmic and overpotentials constants, initial concentrations, real standard electrode potentials, among others. As for the moment only has been obtained data from the current and voltage measures, this calibration only is necessary for the electrochemical and voltage models. 

This calibration has been performed using a PSO optimization, which determines the value of an array of bounded paramaters that is unknown its real value. In order to do that, a error cost function is used, being in this case the absolute error between the estimated voltage and the real ones. The different files that must be executed are:

- Data_parameters: contain the data of real experiments and the known paramaters of the model system that can be changed by the user.
- Model: there are two files called "Model" and "Modelv16a" which consists on the electrochemical and voltage model in Simulink versions 2020a and 2016a, respectively.
- Model_Calibration: is a Matlab function where the parameters to estimated are defined as global, and in form of an array (i.e: E=x(1), r=x(2)), and the cost error function is declared.
- Run_Calibration: is a Matlab function that runs the calibration. In this field it is needed to declare the number of parameter to estimate, the upper and lower bounds of them, and by means of the "options" it is possible to define the characteristics of the optimization problem in terms of maximum number of iterations, Size of the initial poblation...
- Results_Plots: shows the result plot of the obtained voltage with the tuned parameters and the real ones.

# Publications

- 2021
  - [1] Clemente, A., Cecilia, A., Costa-Castelló, R.: SOC and diffusion rates estimation in redox flow batteries: An II-based high-gain observer approach. European Control Conference.
  - [2] Clemente, A., Costa-Castelló, R.: Flow controlling tuning for the voltage of a redox flow battery considering the effect of overpotentials. ETFA 2021 - 26th Annual Conference of the IEEE Industrial Electronics Society (IES).
  - [3] Clemente, A., Montiel, M., Barreras, F., Lozano, A., Costa-Castelló, R.: Vanadium Redox Flow Battery State of Charge Estimation Using a Concentration Model and a Sliding Mode Observer. IEEE ACCESS, 9, 72368–72376. [DOI](https://ieeexplore.ieee.org/document/9427541/)
  - [4] BA BE BI
  
- 2020
  - [1] Clemente, A., Ramos, A., Costa-Castelló, R. Voltage H∞ control of a vanadium redox flow battery. Electronics, 9(10): 1567. [DOI](https://doi.org/10.3390/electronics9101567)
  - [2] Clemente, A., Costa-Castelló, R. Redox flow batteries: A literature review oriented to automatic control. Energies, 13(17): 4514. [DOI](https://doi.org/10.3390/en13174514)
