function [x_names, x_init, x_ind, x_const] = m_tca_pars_x()
%% Inital metabolite concentrations 
%   
% Returns:
%   x_names:  vector of concentration names
%   x_init: vector of initial substrate concentrations
%   author: Matthias Koenig 
%   date:   1108020


data = {
'atp_{mito}',   2,                  1   %S1
'adp_{mito}',   3,                  1   %S2
'gtp_{mito}',   0.3,                1   %S3
'gdp_{mito}',   0.2,                1   %S4
'nad_{mito}',   0.033,               0   %S5
'nadh_{mito}',  0.017,               0   %S6
'fad_{mm}',     0,                  1   %S7
'fadh2_{mm}',   0,                  1   %S8
'co2_{mito}',   0.5,                1   %S9
'h2o_{mito}',   55000,              1   %S10
'p_{mito}',     8,                  1   %S11
'coa_{mito}',   0.01,                0   %S12
'pyr_{mito}',   0.131,              1   %S13
'acoa_{mito}',  0.0051,              0   %S14
'cit_{mito}',   2.5,                 0   %S15
'isocit_{mito}',    0.12,            0   %S16
'akg_{mito}',       1,               0   %S17
'succoa_{mito}',    0.005,           0   %S18
'suc_{mito}',       2,               0   %S19
'fum_{mito}',       0.4,             0   %S20
'mal_{mito}',       1.5,             0   %S21
'oa_{mito}',        0.035,           0  %S22
'pyr',              0.2,            1   %S23
'glu_{mito}',       13.5,            0   %S24
'ca_{mito}',        0.05,            0   %S25
'k_{drain}',        0,               0   %S26
'h',                1.0E-4,         1   %S27
'h_{mito}',         4.0E-5,         1   %S28
}

x_names = data(:,1);
x_init  = containers.Map(x_names, cell2mat(data(:,2)));
x_ind    = containers.Map(x_names, [1:length(x_names)]);

% store the constant entries
x_const = containers.Map('KeyType', 'int32', 'ValueType', 'logical');
for k=1:length(x_names)
    if data{k,3}
       x_const(k) = data{k,3};
   end
end

