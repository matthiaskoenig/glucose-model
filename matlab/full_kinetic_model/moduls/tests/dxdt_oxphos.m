function [dxdt] = dxdt_oxphos(t, x, pars)
%DXDT_OXPHOS ODE for the mp_oxphos_module
%
%   date        110408
%   author      Matthias Koenig
%   version     0.1


%% ODE definition
% OXPHOS: lac + o2_mito + 5 adp_mito -> 5 atp_mito

OXPHOS_Vmax = 1;        % [mM/s]
OXPHOS_km_adp = 1;          % [mM]
OXPHOS_km_o2 = 0.1;         % [mM]
OXPHOS_km_lac = 0.3;        % [mM]
dxdt.OXPHOS = OXPHOS_Vmax * x.lac/(x.lac + OXPHOS_km_lac) ...
                          * x.adp_mito/(x.adp_mito + OXPHOS_km_adp) ...
                          * x.o2_mito/(x.o2_mito + OXPHOS_km_o2);

% ADC: atp_mito + adp_mito <-> atp 
ADC_Vmax = 1;          % [mM/s ????]
dxdt.GLCT = ADC_Vmax * (atp_mito - atp)*(adp_mito-adp);
