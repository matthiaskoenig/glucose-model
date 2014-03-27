function N = m_glycerol_stoichiometry()
%% M_MODUL_STOICHIOMETRY Returns the stoichiometric matrix of the system.
%
%   Returns:
%       N:  stoichiometric matrix of the system
%
%   author: Matthias Koenig 
%   date:   110815

% Verhältnisse der Compartments
b = 1;    % V_cyto/V_blood    

% Stoichiometric matrix of the model.
N = [
    0	-1	0	%	1	atp
    0	1	0	%	2	adp
    0	0	-1	%	3	nad
    0	0	1	%	4	nadh
    0	0	1	%	5	h
    -b	0	0	%	6	glyc_ext
    1	-1	0	%	7	glyc
    0	1	-1	%	8	glyc3p
    0	0	1	%	9	dhap
];