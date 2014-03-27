function [x_names, x_init, x_ind, x_const] = m_glycerol_pars_x()
%% Inital metabolite concentrations 
%   
% Returns:
%   x_names:  vector of concentration names
%   x_init: vector of initial substrate concentrations
%   author: Matthias Koenig 
%   date:   1108020


data = {
    'atp',      2.8,        1       %	S1
    'adp',      0.8,        1       %	S2
    'nad',      1.22,       1       %   S3
    'nadh',     5.6E-4,     1       %	S4
    'h',        5E-8,       1       %	S5
    'glyc_{ext}', 0.2,        1       %	S6
    'glyc',     0.72,       0       %	S7
    'glyc3p',   0.5,        0       %	S8
    'dhap',     0.03,       1       %	S9
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

