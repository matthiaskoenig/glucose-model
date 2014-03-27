function [v_names, vmax, v_ind] = m_opcac_pars_v()
%% M_OPCAC_PARS_V Definition of the flux names and Vmax values
%
% Returns:
%   v_names: cellarray of names
%   Vmax:    map of vmax values
%
%   author: Matthias Koenig 
%   date:   110821


% flux data
data = {
'PDH',	20
'CS',	40
'ACO',	1.00E+007
'IDH',	20
'KGDH',	50
'SCS1',	50
'SCS2',	50
'SDH',	14
'FUMR',	2.00E+007
'MDH',	1.00E+005
'MDH2',	1.00E+010
'CPT1',	2.3
'CACT',	11.5
'CPT2',	2.3
'HMGCOAS',	1.00E-003
'HMGCOAL',	1.00E-003
'HBDH',	1
'ACACME',	10
'BHBUTME',	10
'CITMAL',	1.00E+001
'ATPCL',	1.00E-003
'ACC',	0.1
'MCOADC',	0
'MCOAUSE',	0.1
'KDRAIN',	1.00E+015
'FREE1',	5.00E-003
'ATP',	1
'ADP',	1
'NAD',	1
'NADH',	1
'CO2', 	1
'PYR',	1
'OXA',	1
'ISOCIT',	1
'CIT',	1
'ASP',	1
'GLU',	1
'MAL',	1
'AKG',	1
'COA',	1
'ACOA',	1
'MALCOA',	1
'NAD_{MITO}',	1
'NADH_{MITO}',	1
'ATP_{MITO}',	1
'ADP_{MITO}',	1
'P_{MITO}',	1
'GTP_{MITO}',	1
'GDP_{MITO}',	1
'CO2_{MITO}',	1
'PYR_{MITO}',	1
'COA_{MITO}',	1
'ACOA_{MITO}',	1
'CIT_{MITO}',	1
'ISOCIT_{MITO}',	1
'AKG_{MITO}',	1
'SUCCOA_{MITO}',	1
'SUC_{MITO}',	1
'FUM_{MITO}',	1
'MAL_{MITO}',	1
'OXA_{MITO}',	1
'GLU_{MITO}',	1
'ASP_{MITO}',	1
'CAR',	1
'C16COA',	1
'C16CAR',	1
'CAR_{MITO}',	1
'C16CAR_{MITO}',	1
'C4_COA_{MITO}',	1
'C6_COA_{MITO}',	1
'C8_COA_{MITO}',	1
'C10_COA_{MITO}',	1
'C12_COA_{MITO}',	1
'C14_COA_{MITO}',	1
'C16_COA_{MITO}',	1
'E_C4_COA_{MITO}',	1
'E_C6_COA_{MITO}',	1
'E_C8_COA_{MITO}',	1
'E_C10_COA_{MITO}',	1
'E_C12_COA_{MITO}',	1
'E_C14_COA_{MITO}',	1
'E_C16_COA_{MITO}',	1
'L_C4_COA_{MITO}',	1
'L_C6_COA_{MITO}',	1
'L_C8_COA_{MITO}',	1
'L_C10_COA_{MITO}',	1
'L_C12_COA_{MITO}',	1
'L_C14_COA_{MITO}',	1
'L_C16_COA_{MITO}',	1
'K_C4_COA_{MITO}',	1
'K_C6_COA_{MITO}',	1
'K_C8_COA_{MITO}',	1
'K_C10_COA_{MITO}',	1
'K_C12_COA_{MITO}',	1
'K_C14_COA_{MITO}',	1
'K_C16_COA_{MITO}',	1
'HMGCOA_{MITO}',	1
'ACAC_{MITO}',	1
'BHBUT_{MITO}',	1
}

v_names = data(:,1);
vmax     = containers.Map(v_names, cell2mat(data(:,2)));
v_ind    = containers.Map(v_names, [1:length(v_names)]);    % necessary if stoichiometric matrix

end