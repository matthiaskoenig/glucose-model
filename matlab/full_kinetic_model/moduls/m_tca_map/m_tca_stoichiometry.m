function N = m_tca_stoichiometry()
%% MODEL_TCA_STOICHIOMETRY stoichiometric matrix of the system
%
%   Returns:
%       N:  stoichiometric matrix of the system
%
%   author: Matthias Koenig 
%   date:   110211

% Verhältnisse der Compartments
a = 1;    % V_cyto/V_mito
b = 1;    % V_cyto/V_blood    

% Stoichiometric matrix of the model.
N = [  
0	0	0	0	0	0	1	0	0	0	0	0
0	0	0	0	0	0	-1	0	0	0	0	0
0	0	0	0	0	0	0	1	0	0	0	0
0	0	0	0	0	0	0	-1	0	0	0	0
0	-1	0	0	-1	-1	0	0	0	0	-1	3.6
0	1	0	0	1	1	0	0	0	0	1	-3.6
0	0	0	0	0	0	0	0	-1	0	0	0
0	0	0	0	0	0	0	0	1	0	0	0
0	1	0	0	1	1	0	0	0	0	0	0
0	0	-1	0	0	0	0	0	0	-1	0	0
0	0	0	0	0	0	-1	-1	0	0	0	0
0	-1	1	0	0	-1	1	1	0	0	0	0
0	-1	0	0	0	0	0	0	0	0	0	0
0	1	-1	0	0	0	0	0	0	0	0	0
0	0	1	-1	0	0	0	0	0	0	0	0
0	0	0	1	-1	0	0	0	0	0	0	0
0	0	0	0	1	-1	0	0	0	0	0	0
0	0	0	0	0	1	-1	-1	0	0	0	0
0	0	0	0	0	0	1	1	-1	0	0	0
0	0	0	0	0	0	0	0	1	-1	0	0
0	0	0	0	0	0	0	0	0	1	-1	0
0	0	-1	0	0	0	0	0	0	0	1	0
0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0
1	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0
0	1	0	0	1	1	0	0	0	0	1	-3.6
];


 