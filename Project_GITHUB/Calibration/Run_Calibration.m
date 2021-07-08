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
global alpha_1
global alpha_2
global k0_1
global k0_2


global Tmeasured

Tmeasured = Tensio2;
%E0=0.2;
%a=2;

%sim('model');
%yref=ans.y;


%lb=[1.1;0.01;1e-6;0.001;0.001;1e-7;0.001;0.001];
%ub=[2.0;0.5;1e-4;398;398;1e-5;398;398];

%lb=[1.1;0.01;0.001;0.001;1e-7];
%ub=[2.0;0.5;398;398;1e-5];

%lb=[0.001;0.001];
%ub=[398;398];

%r,E0,alpha1,alpha2
% lb=[0.001;1.0;0.1;0.1];
% ub=[0.5;1.5;0.9;0.9];

% Vcell,Vtanks
% lb=[1e-8;1e-6;1e-6];
% ub=[1e-5;6e-5;6e-5];

%K01, K02
lb=[1e-9;1e-9];
ub=[1e-5;1e-5];

rng default  % For reproducibility
nvars = 2;
options = optimoptions('particleswarm','Display','iter','MaxIterations',20,'SwarmSize',50,'HybridFcn',@fmincon);
tic
x = particleswarm(@Model_Calibration,nvars,lb,ub)
toc