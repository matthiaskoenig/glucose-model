function [x_names, x_init, x_ind, x_const] = m_opcac_pars_x()
%% Inital metabolite concentrations 
%   
% Returns:
%   x_names:  vector of concentration names
%   x_init: vector of initial substrate concentrations
%   author: Matthias Koenig 
%   date:   1108020


data = {
    'kdrain',	0	0
    'free1',	0	0
    'atp',	3	1
    'adp',	0.8	1
    'nad',	0.075	1
    'nadh',	0.013	1
    'co2',	0.5	1
    'pyr',	0.2	1
    'oxa',	0.01	0
    'isocit',	0	1
    'cit',	0.1	0
    'asp',	2.8	1
    'glu',	4	1
    'mal',	0.3	0
    'akg',	0.1	1
    'coa',	0.17	0
    'acoa',	0	0
    'malcoa',	1	0
    'nad_{mito}',	0.033	0
    'nadh_{mito}',	0.017	0
    'atp_{mito}',	3	1
    'adp_{mito}',	2	1
    'p_{mito}',	8	1
    'gtp_{mito}',	0.3	1
    'gdp_{mito}',	0.2	1
    'co2_{mito}',	0.01	0
    'pyr_{mito}',	0.131	1
    'coa_{mito}',	0.01	0
    'acoa_{mito}',	0.0051	0
    'cit_{mito}',	2.5	0
    'isocit_{mito}',	0.12	0
    'akg_{mito}',	1	0
    'succoa_{mito}',	0.005	0
    'suc_{mito}',	2	0
    'fum_{mito}',	0.4	0
    'mal_{mito}',	1.5	0
    'oxa_{mito}',	0.035	0
    'glu_{mito}',	13.5	1
    'asp_{mito}',	0.3	1
    'car',	0.2	0
    'c16coa',	0.04	0
    'c16car',	0.1	0
    'car_{mito}',	0.1	0
    'c16car_{mito}',	0.1	0
    'c4_coa_{mito}',	2.00E-003	0
    'c6_coa_{mito}',	3.00E-003	0
    'c8_coa_{mito}',	5.50E-004	0
    'c10_coa_{mito}',	3.00E-003	0
    'c12_coa_{mito}',	2.00E-003	0
    'c14_coa_{mito}',	0.013	0
    'c16_coa_{mito}',	0.025	0
    'e_c4_coa_{mito}',	5.00E-006	0
    'e_c6_coa_{mito}',	1.10E-005	0
    'e_c8_coa_{mito}',	9.00E-006	0
    'e_c10_coa_{mito}',	8.00E-006	0
    'e_c12_coa_{mito}',	1.00E-005	0
    'e_c14_coa_{mito}',	1.30E-005	0
    'e_c16_coa_{mito}',	4.00E-003	0
    'l_c4_coa_{mito}',	5.00E-004	0
    'l_c6_coa_{mito}',	4.00E-005	0
    'l_c8_coa_{mito}',	3.00E-004	0
    'l_c10_coa_{mito}',	7.00E-005	0
    'l_c12_coa_{mito}',	7.00E-005	0
    'l_c14_coa_{mito}',	7.00E-005	0
    'l_c16_coa_{mito}',	2.50E-003	0
    'k_c4_coa_{mito}',	3.00E-004	0
    'k_c6_coa_{mito}',	3.00E-004	0
    'k_c8_coa_{mito}',	3.00E-004	0
    'k_c10_coa_{mito}',	3.00E-004	0
    'k_c12_coa_{mito}',	3.00E-004	0
    'k_c14_coa_{mito}',	3.00E-004	0
    'k_c16_coa_{mito}',	3.00E-004	0
    'hmgcoa_{mito}',	0	0
    'acac_{mito}',	0	0
    'bhbut_{mito}',	0	0
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

