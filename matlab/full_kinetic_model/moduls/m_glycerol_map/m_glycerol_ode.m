function [v] = m_glycerol_ode(x, t, mpars)
%% MODEL_GLYEROL_ODE Rate laws for integration
%  Definition of the rate laws and calculation of the fluxes for the given
%  parameters and concentrations. 
%  
%   Returns fluxes.

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
%   date:   110820

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test for negative concentrations
if any(find(x <0 ))
   warning('Negative concentrations !!!')
   for k=1:length(x)
      if x(k) < 0
          mpars.x_names{k}
          x(k)
          x(k) = 0;
      end
   end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Concentrations
atp     = x(mpars.x_ind('atp'));
adp     = x(mpars.x_ind('adp'));
nad     = x(mpars.x_ind('nad'));
nadh    = x(mpars.x_ind('nadh'));
glyc_ext  = x(mpars.x_ind('glyc_{ext}'));
glyc    = x(mpars.x_ind('glyc'));
glyc3p  = x(mpars.x_ind('glyc3p'));
dhap    = x(mpars.x_ind('dhap'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Vmax = mpars.vmax;
v    = zeros(mpars.Nv, 1);

% *********************************** %
% v1 : GLYT  Glycerol Transport
% *********************************** %
% glyc_ext <-> glyc
% {Westergaard1998} : saturation kinetics
v1_deltag = 0;                              % ? [kJ/mol]
v1_keq = keq(v1_deltag);                    % []
v1_td = (glyc_ext - glyc/v1_keq);
v1_km = 0.3;                                 % [mM] {Westergaard1998}
v(mpars.v_ind('GLYT')) = Vmax('GLYT')/v1_km * v1_td /(1 + glyc_ext/v1_km + glyc/v1_km);


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

v(mpars.v_ind('GLYK')) = Vmax('GLYK') * glyc/(v2_km_glyc*(1+glyc3p/v2_ki_glyc3p) + glyc) * ...
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
v(mpars.v_ind('GLYDH')) = Vmax('GLYDH') / (v3_k_glyc3p * v3_k_nad) * v3_td / ( (1+nad/v3_k_nad)*(1+glyc3p/v3_k_glyc3p) + (1+dhap/v3_k_dhap) * (1+nadh/v3_k_nadh) - 1);

