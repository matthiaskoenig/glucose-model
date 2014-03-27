function [V] = model_example_ode(S, mpars)
%% MODEL_PPPP Rate laws for integration
%  Definition of the rate laws and calculation of the fluxes for the given
%  parameters and concentrations. This function is called by the ODE
%  integration routine.
%  
%   Returns fluxes V.
%
%   S                   vector of concentrations
%   options.const_c     vector of constant concentrations


% Units
%   time: minutes     [s] ,  
%   concentration     [mM] = [mmol/l] 
%   volume:           [l]
%
%   author: Matthias Koenig 
%           Charite Berlin
%           Computational Systems Biochemistry Berlin
%           matthias.koenig@charite.de
%   date:   110615


%% Set constant concentrations
for k=1:size(mpars.const_c, 1)
   if mpars.const_c(k,1) == 1
       S(k) = mpars.const_c(k,2);
   end
end


%% Test for negative concentrations
if any(find(S<0))
   warning('Negative concentrations !!!')
   for k=1:length(S)
      if S(k) < 0
          S(k)
          k
          S(k) = 0;
          x(k) = 0;
      end
   end
end


%% Concentrations
A_ext = S(1);
A = S(2);
B = S(3);
C = S(4);
C_ext = S(5);


% *********************************** %
% v1 : A transporter
% *********************************** %
% A_ext <-> A
v1_keq          = 1;          % [mM]
v1_km_A_ext     = 2;          % [mM]
v1_km_A         = 0.5;        % [mM]
v1_Vmax         = 1;

v1 = v1_Vmax * (A_ext - A/v1_keq) /(1 + A_ext/v1_km_A_ext + A/v1_km_A);


% *********************************** %
% v2 : B - C isomerase
% *********************************** %
% product inhibition by C
% irreversible reaction
% A -> B + C

v2_km_A         = 1;          % [mM]
v2_ki_C         = 2.0;        % [mM]
v2_Vmax         = 1;

v2 = v2_Vmax * A/(v2_km_A * (1+C/v2_ki_C) + A);


% *********************************** %
% v3 : C transporter
% *********************************** %
% C <-> C_ext
v3_keq          = 1;          % [mM]
v3_km_C_ext     = 0.1;          % [mM]
v3_km_C         = 0.1;          % [mM]
v3_Vmax         = 10;

v3 = v3_Vmax * (C - C_ext/v3_keq) /(1 + C_ext/v3_km_C_ext + C/v3_km_C);


% *********************************** %
% v4 : B - C isomerase
% *********************************** %
% B <-> C
v4_keq          = 5;        % []
v4_km_C         = 1;          % [mM]
v4_km_B         = 0.3;        % [mM]
v4_Vmax         = 5;

v4 = v4_Vmax * (B - C/v4_keq) /(1 + B/v4_km_B + C/v4_km_C);

% *********************************** %
% v5 : C_ex - Removal
% *********************************** %
% C_ex ->
v5_km_C_ext      = 10;          % [mM]
v5_Vmax         = 5;

v5 = v5_Vmax * C_ext/(C_ext + v5_km_C_ext);


%% RETURN FLUXES
V  = [v1 v2 v3 v4 v5]';
