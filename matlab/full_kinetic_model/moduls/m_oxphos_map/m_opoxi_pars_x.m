function [x_names, x_init, x_ind, x_const] = m_opoxi_pars_x()
%% Inital metabolite concentrations 
%   
% Returns:
%   x_names:  vector of concentration names
%   x_init: vector of initial substrate concentrations
%   author: Matthias Koenig 
%   date:   1108020

data = {
'h_{cyto}',     1.00E-004,   1
'na_{cyto}',	10,          1
'k_{cyto}',     140,         1
'cl_{cyto}',	8,           1
'ca_{cyto}',	0.003,       1
'h_{mito}', 	3.00E-005,	  0
'na_{mito}',   	10,           0
'k_{mito}', 	140,          0
'cl_{mito}',	10,           0
'ca_{mito}',	2,            0
'vmm',      	-155,         0
'o2_{ext}', 	0.4,         1
'o2',       	0.2,          0
'q_{mm}',   	2.50E-004,	  0
'qh2_{mm}', 	7.50E-004,	  0
'cytcox_{mm}',	9.00E-004,	  0
'cytcred_{mm}',	1.00E-004,	  0
'atp',      	2,            0
'adp',      	1,            0
'p',        	3,           1
'atp_{mito}',	2.5,          0
'adp_{mito}',	2.5,          0
'p_{mito}',   	8,            0
'nad_{mito}',	0.033,        0
'nadh_{mito}',	0.017,        0
'suc_{mito}',	2,            0
'fum_{mito}',	0.4,          0
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

