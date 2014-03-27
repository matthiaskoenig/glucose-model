function [x_names, x_init, x_ind, x_const] = m_ppp_pars_x()
%% Inital metabolite concentrations 
%   
% Returns:
%   x_names:  vector of concentration names
%   x_init: vector of initial substrate concentrations
%   author: Matthias Koenig 
%   date:   110523


data = {
    'atp',              2.8,     1
    'adp',              0.8,     1
    'nadp',              0.1,   0
    'nadph',             0.1,   0
    'p',                   5,    1
    'h2o',             55000,    1
    'co2',                 5,    1
    'h',           5.00E-008,    1
    'glc',                 5,    1
    'glc6p',            0.12,   0
    'fru6p',            0.05,   0
    'fru16bp',          0.02,   0
    'fru26bp',         0.004,   0
    'grap',              0.1,   0
    'dhap',             0.03,   0
    'pgl6',              0.1,   0
    'pg6',               0.1,   0
    'ru5p',              0.1,   0
    'x5p',               0.1,   0
    'r5p',               0.1,   0
    's7p',               1.0,   0
    'e4p',               0.1,   0
    'glc_ext',             5,    1
    'amp',              0.16,   0
    'prpp',              0.1,   0
    'gdp',               0.1,   0
};

x_names = data(:,1);
x_init  = containers.Map(x_names, cell2mat(data(:,2)));
x_ind    = containers.Map(x_names, [1:length(x_names)]);
x_const = containers.Map('KeyType', 'int32', 'ValueType', 'logical');
for k=1:length(x_names)
    % only store the constant entries
    if data{k,3}
       x_const(k) = data{k,3};
   end
end

