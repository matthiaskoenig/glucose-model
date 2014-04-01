function [dydt, v, v_human, v_kgbw] = dydt_toy_model(t, y)
% dydt_toy_model
% 
%   t in [s]
%   all y are densities, i.e amount_per_volume
%
%  Toy example to check the unit conversions and scaling from hepatocytes
%  to whole liver.
%
%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2014 Matthias Koenig
%   date:   2014-03-27

%% Test for scaling
factor = 10;
scale = 1*factor;             % [-]

Vcyto = 1 *factor ;           % [litre]
Vext  = 10 *Vcyto;   % [litre] 

%% Concentrations [mM = mmole_per_litre]
A_ext     = y(1);
A         = y(2);
B         = y(3);
B_ext     = y(4);

% *********************************** %
% AIMP : A importer
% *********************************** %
% A_ext <-> A
AIMP_keq = 1;       % [-]
AIMP_km = 42;      % [mM]
AIMP_Vmax = 420;   % [mmol_per_s]
AIMP = scale * AIMP_Vmax/AIMP_km * (A_ext - A/AIMP_keq)/(1 + A_ext/AIMP_km + A/AIMP_km);
% [mmole_per_s]

% *********************************** %
% ABREAC : A-B Isomerase
% *********************************** %
% A <-> B
ABREAC_keq = 10;  % [-]
ABREAC_km_A  = 0.5;        % [mM]
ABREAC_km_B = 0.01;         % [mM]
ABREAC_Vmax = 420;               % [mmol/l]
ABREAC = scale * ABREAC_Vmax/ABREAC_km_A * (A - B/ABREAC_keq) / (1 + A/ABREAC_km_A + B/ABREAC_km_B);
% [mmole_per_s]

% *********************************** %
% BEXP : B exporter
% *********************************** %
% B <-> B_ext
BEXP_keq = 1;       % [-]
BEXP_km = 3;      % [mM]
BEXP_Vmax = 100;   % [mmol_per_s]
BEXP = scale * BEXP_Vmax/BEXP_km * (B - B_ext/BEXP_keq)/(1 + B_ext/BEXP_km + B/BEXP_km);
% [mmole_per_s]

%%  Fluxes and concentration changes [mmol/s/litre]
dydt = zeros(size(y));
dydt(1) = (-AIMP)/Vext;  % A_ext
dydt(2) = (+AIMP -ABREAC)/Vcyto;  % A
dydt(3) = (-BEXP +ABREAC)/Vcyto;  % B
dydt(4) = (+BEXP)/Vext;  % B_ext

% set constant values
dydt(1) = 0;    % A_ext constant

%% Actual fluxes in [mmol/s]
v  = [AIMP        % v1
      ABREAC      % v2
      BEXP        % v3
     ];
 
% At this point all fluxes v are in [mmol/s], all
% concentrations in mmol/litre. The simulations were performed for a
% hepatic tissue of the simulation volume.
% To get absolute liver values these fluxes have to be scaled with
Vliver  = 1.5;           % [liter]
f_liver = Vliver/Vcyto;  % [-]
bodyweight  = 70;        % [kg]
sec_per_min = 60;        % [s/min]
v_human = v * f_liver * sec_per_min*1E3; % [mmol/s] -> [µmol/min] 
v_kgbw  = v_human/bodyweight;            % [µmol/min/kgbw]
 
con_factor = sec_per_min*1E3/bodyweight

