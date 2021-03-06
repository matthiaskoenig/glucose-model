function [v_names, vmax, v_ind] = m_opoxi_pars_v()
%% M_OPOXI_PARS_V Definition of the flux names and Vmax values
%
% Returns:
%   v_names: cellarray of names
%   Vmax:    map of vmax values
%
%   author: Matthias Koenig 
%   date:   110821

% flux data
data = {
    'C1'        	3.30E-004
    'C2'        	0.55
    'C3'        	5.10E-004
    'C4'        	1.50E+007
    'ATPS'      	6.00E-009
    'ATPEX'     	1.06E-009
    'PTM'       	1.73E-003
    'ATPUSE'    	6.80E-005 
    'H_{CYTO}',     1
    'NA_{CYTO}',	1
    'K_{CYTO}',     1
    'CL_{CYTO}',	1
    'CA_{CYTO}',	1
    'H_{MITO}',     1
    'NA_{MITO}',	1
    'K_{MITO}',     1
    'CL_{MITO}',	1
    'CA_{MITO}',	1
    'VMM',          1
    'O2_{EXT}',     1
    'O2',           1
    'Q_{MM}',       1
    'QH2_{MM}',     1
    'CYTCOX_{MM}',	1
    'CYTCRED_{MM}',	1
    'ATP',        1
    'ADP',          1
    'P',            1
    'ATP_{MITO}',	1
    'ADP_{MITO}',	1
    'P_{MITO}',	1
    'NAD_{MITO}',	1
    'NADH_{MITO}',	1
    'SUC_{MITO}',	1
    'FUM_{MITO}',	1
}

v_names = data(:,1);
vmax     = containers.Map(v_names, cell2mat(data(:,2)));
v_ind    = containers.Map(v_names, [1:length(v_names)]);    % necessary if stoichiometric matrix

end