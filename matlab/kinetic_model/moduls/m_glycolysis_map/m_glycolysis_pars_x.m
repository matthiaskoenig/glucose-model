function [x_names, x_init, x_ind, x_const] = m_glycolysis_pars_x()
%% Inital metabolite concentrations 
%   
% Returns:
%   x_names:  vector of concentration names
%   x_init: vector of initial substrate concentrations
%   author: Matthias Koenig 
%   date:   110820

data = {
'atp',      2.8,        1    % S1 : atp
'adp',      0.8,        1        % S2 : adp
'amp',      0.16,       1        % S3 : amp
'utp',      0.27,       0        % S4 : utp
'udp',      0.09,       0    % S5 : udp
'gtp',      0.29,       0    % S6 : gtp
'gdp',      0.10,       0    % S7 : gdp
'nad',      1.22,       1    % S8 : nad
'nadh',     0.56E-3,    1    % S9 : nadh
'p',        5,          1    % S10 : p
'pp',       0.008,      0    % S11 : pp
'h2o',      55000,      1    % S12 : h2o
'co2',      5,          1    % S13 : co2
'h',        5E-8,       1    % S14 : h
'glc1p',    0.012,      0    % S15 : glc1p
'udpglc',   0.38,       0    % S16 : udpglc
'glyglc',   250,        0    % S17 : glyglc

'glc',      5,          0    % S18 : glc
'glc6p',    0.12,       0    % S19 :  glc6p
'fru6p',    0.05,       0    % S20 :  fru6p
'fru16bp',  0.02,       0    % S21 :  fru16bp
'fru26bp',  0.004,      0    % S22 :  fru26bp
'grap',     0.1,        0    % S23 :  grap
'dhap',     0.03,       0    % S24 :  dhap
'bpg13',    0.3,        0    % S25 :  bpg13
'pg3',      0.27,       0    % S26 :  pg3
'pg2',      0.03,       0    % S27 :  pg2
'pep',      0.15,       0    % S28 :  pep
'pyr',      0.1,        0    % S29 :  pyr
'oaa',      0.01,       0    % S30 :  oaa
'lac',      0.5,        0    % S31 :  lac
 
'glc_{ext}',    5,      1     % S32 :  glc_ext
'lac_{ext}',    1.2,    1     % S33 :  lac_ext
 
'co2_{mito}',   5,      1     % S34 :  co2_mito
'p_{mito}',     5,      1     % S35 :  p_mito
'oaa_{mito}',   0.01,   0    % S36 :  oaa_mito
'pep_{mito}',   0.15,   0    % S37 :  pep_mito
'acoa_{mito}',  0.04,   1    % S38 :  acoa_mito
'pyr_{mito}',   0.1,    0    % S39 :  pyr_mito
'cit_{mito}',   0.32,   1    % S40 :  cit_mito
 
'atp_{mito}',   2.8,    1    % S41 :  atp_mito
'adp_{mito}',   0.8,    1    % S42 :  adp_mito
'gtp_{mito}',   0.29,   0    % S43 :  gtp_mito
'gdp_{mito}',   0.10,   0    % S44 :  gdp_mito

'coa_{mito}',   0.055,  1    % S45 : coa_mito
'nadh_{mito}',  0.24,   1    % S46 : nadh_mito
'nad_{mito}',   0.98,   1    % S47 : nad_mito
'h_{mito}',     1E-8,   1    % S48 : h_mito
'h2o_{mito}',   55000,  1    % S49 : h2o_mito
}

x_names = data(:,1);
x_init  = containers.Map(x_names, cell2mat(data(:,2)));
x_ind    = containers.Map(x_names, (1:length(x_names)) );

x_const = containers.Map('KeyType', 'int32', 'ValueType', 'logical');
for k=1:length(x_names)
    % only store the constant entries
    if data{k,3}
       x_const(k) = data{k,3};
   end
end

