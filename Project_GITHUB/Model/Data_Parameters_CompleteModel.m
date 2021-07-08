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
k0_1 = 1.6e-6;
k0_2 = 1.5e-4;


%% Hydraulic parameters
%%Electrolyte parameters (Measured)
ro = 1354;                      %Density of electrolyte [kg/m3]
mu = 4.928e-3;                  %Dynamic viscosity [Pa.s]


%%% Collector parameters
L_col = 0.53;                   %Collector length [m]
h_col = 0.01;                   %Collector height [m]
w_col = 0.3;                    %Collector weight [m]

A_col = h_col*w_col;            %Collector transversal section [m2]
V_col = A_col*L_col;            %Collector volume [m3]

f_value = 58.91;

D_col = 2*A_col/(h_col+w_col);  %Hydraulic Collector Diameter [m]
  

%%% Recess parameters
L_rec = 0.02;            %Recess length [m]
w_rec = 0.3;             %Recess weight [m]
t_rec = 0.00125;         %Recess Thickness [m]

A_rec = w_rec*t_rec;    %Recess Section [m2]

Kin = 0.5;         %Constant losses at electrolyte input
Kout = 1.0;        %Constant losses at electrolyte output

D_rec = 2*A_rec/(w_rec+t_rec); %Hydraulic Recess Diameter [m]



%%%Electrode parameters
L_el = 0.3;         %Electrode Length [m]
w_el = 0.3;         %Electrode weight [m]
t_el = 0.003;       %Electrode Thickness [m]

A_el = w_el*t_el;   %Electrode Section [m2]

porosity = 0.9;     %Porosity [-]
df = 17.6e-6;       %Diameter of electrode fibres [m]
CKC = 4.28;         %Kozeny-Carman constant [-]

K_el = (df^2/(16*CKC))*(porosity^3/(1-porosity)^2)*w_el*t_el;



%%%%%%%%%%%%%%%%% PIPES %%%%%%%%%%%%%%%%
%%%Pipes parameters
D_pipe = 0.05;                     %Pipe diameter [m]
A_pipe = 0.001963;                 %Pipe section [m2]
delta = 1.5e-6;                    %Pipe rugosity [-]
f_pipe = 0.03593;                  %Darcy Friction factor [-]


%%%%  LINE 1  %%%%
%%%Pipes Parameters
D_L11 = 0.05;                      %Diameter for line 1 pipe 1 [m]
D_L12 = 0.025;                     %Diameter for line 1 pipe 2 [m]
D_L13 = 0.01;                      %Diameter for line 1 pipe 3 [m]
D_L1 = [D_L11 D_L12 D_L13];
f_L11 = 0.03593;                   %Friction factor line 1 pipe 1 [-]
f_L12 = 0.02977;                   %Friction factor line 1 pipe 2 [-]
f_L13 = 0.03123;                   %Friction factor line 1 pipe 3 [-]
f_L1 = [f_L11 f_L12 f_L13];
L_L11 = 2.5;                       %Length line 1 pipe 1 [m]
L_L12 = 1.0;                       %Length line 1 pipe 2 [m]
L_L13 = 0.2;                       %Length line 1 pipe 3 [m]
L_L1 = [L_L11 L_L12 L_L13];




%%%Elbows Parameters
N_E11 = 3;              %Number of elbows type 1 in line 1 [-]
N_E12 = 1;              %Number of elbows type 2 in line 1 [-]
N_E13 = 0;              %Number of elbows type 3 in line 1 [-]
N_E1 = [N_E11 N_E12 N_E13];
K_E11 = 0.57;           %Constant losses for pipe 1 (50mm) [-]
K_E12 = 0.69;           %Constant losses for pipe 2 (25mm) [-]
K_E13 = 0.74;           %Constant losses for pipe 3 (10mm) [-]
K_E1 = [K_E11 K_E12 K_E13];


%%%Valves Parameters
N_valves1 = 3;              %Number of valves in line 1 [-]
K_valve1 = 0.06;            %Constant Losses in Valve   [-]


%%%Section Change
K_inc1 = 0.68;                         %Constant losses in change from 25 to 50 [-]
K_dec1 = 0.07;                         %Constant losses in reduction [-]


%%%Input and Output
K_in1 = 0.5;                           %Constant losses in input [-]
K_out1 = 1.0;                          %Constant losses in output [-]
N_in1 = 2;                             %Number of inputs in pipes [-]
N_out1 = 2;                            %Number of outputs in pipes [-]


%%%Flow Division Collectors
K_con1 = 0.35;                     %Constant losses in contraction [-]
K_exp1 = 0.7;                      %Constant losses in expansion [-]





%%%%  LINE 2  %%%%
%%%Pipes Parameters
D_L21 = 0.05;                      %Diameter for line 1 pipe 1 [m]
D_L22 = 0.025;                     %Diameter for line 1 pipe 2 [m]
D_L23 = 0.01;                      %Diameter for line 1 pipe 3 [m]
D_L2 = [D_L21 D_L22 D_L23];
f_L21 = 0.03593;                   %Friction factor line 1 pipe 1 [-]
f_L22 = 0.02977;                   %Friction factor line 1 pipe 2 [-]
f_L23 = 0.03123;                   %Friction factor line 1 pipe 3 [-]
f_L2 = [f_L21 f_L22 f_L23];
L_L21 = 2.2;                       %Length line 1 pipe 1 [m]
L_L22 = 0.25;                      %Length line 1 pipe 2 [m]
L_L23 = 0.2;                       %Length line 1 pipe 3 [m]
L_L2 = [L_L21 L_L22 L_L23];


%%%Elbows Parameters
N_E21 = 4;                         %Number of elbows type 1 in line 1 [-]
N_E22 = 1;                         %Number of elbows type 2 in line 1 [-]
N_E23 = 0;                         %Number of elbows type 3 in line 1 [-]
N_E2 = [N_E21 N_E22 N_E23];
K_E21 = 0.57;                      %Constant losses for pipe 1 (50mm) [-]
K_E22 = 0.69;                      %Constant losses for pipe 2 (25mm) [-]
K_E23 = 0.74;                      %Constant losses for pipe 3 (10mm) [-]
K_E2 = [K_E21 K_E22 K_E23];


%%%Valves Parameters
N_valves2 = 3;                     %Number of valves in line 1 [-]
K_valve2 = 0.06;                   %Constant Losses in Valve   [-]


%%%Section Change
K_inc2 = 0.68;                     %Constant losses in change from 25 to 50 [-] 
K_dec2 = 0.07;                     %Constant losses in reduction [-]

%%%Input and Output
K_in2 = 0.5;                       %Constant losses in input [-]
K_out2 = 1.0;                      %Constant losses in output [-]
N_in2 = 2;                         %Number of inputs in pipes [-]
N_out2 = 2;                        %Number of outputs in pipes [-]


%%%Flow Division Collectors
K_con2 = 0.35;                     %Constant losses in contraction [-]
K_exp2 = 0.7;                      %Constant losses in expansion [-]


%%%Pump Efficiency
alpha = 0.8;    %Pump efficiency

%% Thermal Parameters
Vpipe = 1.256e-3;
Vcell = 0.0171;

ro = 1354;      %Density of electrolyte [kg/m3]
mu = 4.928e-3;  %Dynamic viscosity [Pa.s]
Cp = 3200;      %Specific heat of vanadium
UsAs = 1.31;    %Heat transfer between stack and air
r = 0.04;       %Charge/Discharge resistance
UpAp = 0.47;    %Heat transfer between pipes and air
UtAt = 12.69;   %Heat transfer between tanks and air

H1 = -220000;   %Heat of reaction for V2 specie
H2 = -64000;    %Heat of reaction for V3 specie
H4 = -91200;    %Heat of reaction for V4 specie
H5 = -246800;   %Heat of reaction for V5 specie

