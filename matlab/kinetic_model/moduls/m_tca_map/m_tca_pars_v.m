function [v_names, vmax, v_ind] = m_glycerol_pars_v()
%% M_PPP_PARS_V Definition of the flux names and Vmax values
%
% Returns:
%   v_names: cellarray of names
%   Vmax:    map of vmax values
%
%   author: Matthias Koenig 
%   date:   110820

% scaling factors for glycolysis and pentose phosphate pathway
f_glycerol = 1;  

% flux data
data = {
    'KDRAIN',       1.00E+015   %v1
    'PDH',          12          %v2
    'CS',           40          %v3
    'ACO',          1.00E+007   %v4
    'IDH',          15          %v5
    'KGDH',         15          %v6
    'SCS1',         50          %v7
    'SCS2',         50          %v8
    'SDH',          5           %v9
    'FUMR',         2.00E+007   %v10
    'MDH',          1.00E+005   %v11
    'NADD',         1           %v12
}

v_names = data(:,1);
vmax     = containers.Map(v_names, cell2mat(data(:,2)));
v_ind    = containers.Map(v_names, [1:length(v_names)]);    % necessary if stoichiometric matrix

end