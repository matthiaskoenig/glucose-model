function [V, TD] = m_glycerol_ode(S, t, mpars)
%% MODEL_PPPP Rate laws for integration
%  Definition of the rate laws and calculation of the fluxes for the given
%  parameters and concentrations. This function is called by the ODE
%  integration routine.
%
% Units
%   time: minutes     [min] ,  
%   concentration     [mM] = [mmol/l] 
%   volume:           [l]
%   fluxes:           [µmol/(min kg)] kg body weight
%
%   author: Matthias Koenig 
%           Charite Berlin
%           Computational Systems Biochemistry Berlin
%           matthias.koenig@charite.de
%   date:   110815


%% Test for negative concentrations
%TODO : analyse possble problems in more detail
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
atp = S(1);
adp = S(2);
nad = S(3);
nadh = S(4);
glyc_ext = S(5);
glyc = S(6); 
glyc3p = S(7);
dhap = S(8);

%% Vmax values
Vmax = mpars.vmax;

%% Reaction kinetics
% *********************************** %
% v1 : GLYT  Glycerol Transport
% *********************************** %
% glyc_ext <-> glyc
% {Westergaard1998} : saturation kinetics
v1_deltag = 0;                              % ? [kJ/mol]
v1_keq = keq(v1_deltag);                    % []
v1_td = (glyc_ext - glyc/v1_keq);
v1_km = 0.3;                                 % [mM] {Westergaard1998}
v1 = Vmax(1)/v1_km * v1_td /(1 + glyc_ext/v1_km + glyc/v1_km);


% *********************************** %
% v2 : GLYK  Glycerol Kinase
% *********************************** %	
% glyc + atp -> glycp + adp 
% EC 2.7.1.30 - glycerol kinase
v2_deltag = -16.7;                          % ? [kJ/mol]
v2_keq = keq(v2_deltag);                    
v2_td = (glyc*atp - glyc3p*adp / v2_keq);

v2_km_glyc = 0.036;          % [mM] {Westergaard1998, Barrera1979}
v2_km_atp = 0.1;             % [mM] {Lin1977}
v2_ki_glyc3p = 0.05;         % [mM] {Sestoft1975}

v2 = Vmax(2) * glyc/(v2_km_glyc*(1+glyc3p/v2_ki_glyc3p) + glyc) * ...
                    atp/(v2_km_atp + atp);


% *********************************** %
% v3 : GLYDH  Glycerolphosphate Dehydrogenase
% *********************************** %
% glyc3p + nad <-> dhap + nadh + h+
v3_deltag = 19.59;        % [kJ/mol] {Lin1977}  
v3_keq = keq(v3_deltag); 
v3_td = (glyc3p*nad - dhap*nadh/v3_keq);


v3_k_glyc3p = 0.1;      % ? [mM]
v3_k_nad    = 0.1;      % ? [mM]
v3_k_dhap   = 0.1;      % ? [mM]
v3_k_nadh   = 0.1;      % ? [mM]
v3 = Vmax(3) / (v3_k_glyc3p * v3_k_nad) * v3_td / ( (1+nad/v3_k_nad)*(1+glyc3p/v3_k_glyc3p) + (1+dhap/v3_k_dhap) * (1+nadh/v3_k_nadh) - 1);


%% Return fluxes
V  = [v1 v2 v3]';
TD = [v1_td v2_td v3_td]';
