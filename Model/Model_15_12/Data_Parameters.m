%% Experiment 2  (I = 1.35 A)   (Q = 75mL/min)

filename = 'Time2.txt';
delimiterIn = ' ';
headerlinesIn = 1;
Time2 = importdata(filename,delimiterIn,headerlinesIn);
Time2 = Time2.data;


filename = 'Current2.txt';
delimiterIn = ' ';
headerlinesIn = 1;
Current2 = importdata(filename,delimiterIn,headerlinesIn);
Current2 = Current2.data;

filename = 'Tensio2.txt';
delimiterIn = ' ';
headerlinesIn = 1;
Tensio2 = importdata(filename,delimiterIn,headerlinesIn);
Tensio2 = Tensio2.data;


Current_In =[Time2,Current2];
Curr_mes = Current_In;

%% Plots of variables measured

figure(1)
plot(Time2,Current2)
xlabel('Time [s]')
ylabel('Current [A]')

figure(2)
plot(Time2,Tensio2)
xlabel('Time [s]')
ylabel('Voltage [V]')


%% Model parameters: Electrochemical Parameters

%%% Electrolytes
cV = 1600;          %Total concentration of vanadium species [mol/m3]
mV = 50942;         %Molar mass of vanadium species [kg/mol]
cH2SO4 = 2000;      %Total concentration of H2SO4 [mol/m3]
mH2SO4 = 98079;     %Molar mass of vanadium H2SO4 [kg/mol]
cH3PO4 = 50;        %Total concentration of H3PO4 [mol/m3]
mH3PO4 = 97994;     %Molar mass of H3PO4  [kg/mol]

%%% Constants
F = 96485;          %Faraday constant [C/mol.e]
R = 8.31;           %Gas constant
T = 298;            %Temperature [K]

%%% Electrochemical parameters
A = 9e-4;           %Electrode Surface [m2]
I = 1.449;            %Stack Current [A]N = 1;              
N = 1;              %Number of cells [-]
Vtank = 60e-6;
Vtank_Catholyte = 55.74e-6;                                 %Catholyte Volume [m3]
Vtank_Anolyte = 45e-6;                                   %Anolyte Volume [m3]
Vcell = 1e-6;                                            %Stack Volume [m3]
S = 9e-4;                                                %Membrane Surface [m2]
d = 1.5e-6;                                               %Thickness [m]

D2 = 4.438e-14;                                          %Diffussion Coefficient [m/s]
D3 = 1.0024e-14;                                         %Diffussion Coefficient [m/s]
D4 = 3.8e-14;                                            %Diffussion Coefficient [m/s]
D5 = 1.75e-14;                                           %Diffussion Coefficient [m/s]

D = [-D2 0 -D4 -2*D5;
     0 -D3 2*D4 3*D5;
     3*D2 2*D3 -D4 0;
     -2*D2 -D3 0 -D5];


Ctankini2 = 5;
Ctankini3 = 395;
Ctankini4 = 395;
Ctankini5 = 5;

Ccellini2 = 200;
Ccellini3 = 200;
Ccellini4 = 200;
Ccellini5 = 200;

Ctankini25 = Ctankini2;
Ctankini34 = Ctankini3;

Ccellini25 = Ccellini2;
Ccellini34 = Ccellini3;

% E0 = 1.34;
% r = 0.185;
% alpha_1 = 0.52;
% alpha_2 = 0.45;

r = 0.001;
E0 = 1.368;
alpha_1 = 0.5019;
alpha_2 = 0.4982;
k0_1 = 1e-4;
k0_2 = 1e-4;
Chini = 2000;
