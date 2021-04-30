function error=model_fit_zgz(x)
global E0
global r
global Vtank
global Tmeasured
global Ctankini25
global Ctankini34
global Vcell
global Ccellini25
global Ccellini34
global Vtank1
global Vtank2
global Vtank_Catholyte
global Vtank_Anolyte
global Tensio2
global alpha_1
global alpha_2
global k0_1
global k0_2

global Vcell

% E0=x(1);
% r=x(2);
% Vtank=x(3);
% Ctankini25 = x(4);
% Ctankini34 = x(5);
% Vcell = x(6);
% Ccellini25 = x(7);
% Ccellini34 = x(8);


%E0=x(1);
%r=x(1);
%Vtank=x(3);
%Ctankini25 = x(1);
%Ctankini34 = 400-Ctankini25;
%Vcell = x(5);
%Ccellini25 = x(2);
%Ccellini34 = 400-Ccellini25;
%E0=x(2);
%[x0,a]

% r = x(1);
% E0 = x(2);
% alpha_1 = x(3); 
% alpha_2 = x(4);

% Vcell = x(1);
% Vtank_Anolyte = x(2);
% Vtank_Catholyte = x(3);
k0_1 = x(1);
k0_2 = x(2);
%sim('Model_Estimation');
sim('Model_Experiment2_LIFTEC_Paper');
y=ans.Vestimated;

error=sum(abs(y-Tmeasured));