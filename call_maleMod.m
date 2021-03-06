%-------------------------------------------------------------------------
% Need to set 3 parameters
% (i) refers to the dose of endotoxin: (1--none), (2--3mg/kg),(3--6mmg/kg),(4--12mg/kg)
% (j) refers to the CT: (1--CT0), (2--CT3), (3--CT6),(4--CT9),(5--CT12), (6--CT15), (7--CT18),(8--CT21)
% "tend" = final simulation time
%-------------------------------------------------------------------------

% note that both CJL males and females experience an 8h-phase advance.
% CT refers to the time in the control model against which the CJL model is compared.
% For example, when it says CT12 below, the actual CJL model starts at CT4. 
% This notation facilitates the monitoring of simulations.

function [Tm,Ym] = call_maleMod(i,j,tend)
tSpan = 0:0.1:tend;
% same as in control model
dCA      = 3.1777e-2;
sCA      = 0.004; 
sIL10    =1187.2; 
xIL10d   =713.8094;
dIL10    =95.465;

y13_0 = [0,3,6,12]; 
y18_0 = sIL10*xIL10d/(dIL10*xIL10d - sIL10);
y20_0 = sCA/dCA;

% ------------------CT0-----------------------
y0CT(1,:)=[8.9437,0.93781, 25.975, 2.0011,0.53522, 33.804,0.35102, 0.027876,0.45508, 5.2666,0.81791,0.21279,y13_0(i),0,0,0,0, y18_0,0,y20_0];
% ------------------CT3-----------------------
y0CT(2,:)=[12.079, 1.1786, 22.899,  2.734,0.38805, 41.041,0.39332,0.03355,0.44723, 3.5376, 1.0038,0.18517,y13_0(i),0,0,0,0, y18_0,0,y20_0];
% ------------------CT6-----------------------
y0CT(3,:)=[13.786, 1.4396, 12.333, 3.2663,0.48074, 50.008,0.44871, 0.029031,0.45888, 2.6526, 1.3889, 0.1513,y13_0(i),0,0,0,0, y18_0,0,y20_0];
% ------------------CT9-----------------------
y0CT(4,:)=[11.666, 1.6772, 4.5214, 3.8704,0.88757, 54.909,0.51872, 0.018628,0.48506, 2.7466, 1.8307,0.12595,y13_0(i),0,0,0,0, y18_0,0,y20_0];
% ------------------CT12-----------------------
y0CT(5,:)=[9.8905,1.76, 2.5358,  4.155, 1.2895, 54.258, 0.5609,0.01335, 0.5059, 3.3498, 2.0195,0.11997,y13_0(i),0,0,0,0, y18_0,0,y20_0];
% ------------------CT15-----------------------
y0CT(6,:)=[6.3132, 1.6184, 1.8467, 3.2825, 2.1894, 46.184,0.60124,0.0056306,0.54449, 6.2125, 2.0455,0.14336,y13_0(i),0,0,0,0, y18_0,0,y20_0];
% ------------------CT18-----------------------
y0CT(7,:)=[4.6043, 1.1231, 8.3302, 2.0912, 2.1254, 38.896,0.49239,0.0064595,0.52808, 7.7922, 1.5789,0.18311,y13_0(i),0,0,0,0, y18_0,0,y20_0];
% ------------------CT21-----------------------
y0CT(8,:)=[6.3665,0.82621, 23.367, 1.6077,0.85427, 32.012,0.35106, 0.020593,0.47451,  6.641,0.89398,0.21781,y13_0(i),0,0,0,0, y18_0,0,y20_0];

lps0=y13_0(i);
y0=y0CT(j,:);
[Tm,Ym] = ode45(@(t,y)maleMod(t,y,lps0), tSpan, y0); 
end