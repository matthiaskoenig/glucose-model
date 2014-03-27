function N = m_ppp_stoichiometry()
%% MODEL_STOICHIOMETRY stoichiometric matrix of the system
%
%   Returns:
%       N:  stoichiometric matrix of the system
%
%   author: Matthias Koenig 
%   date:   110211

% Verhältnisse der Compartments
a = 5;    % V_cyto/V_mito
b = 1;    % V_cyto/V_blood    

% Stoichiometric matrix of the model.
N = [  
  
0	-1	0	0	-1	0	-1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-1	-1	0
0	1	0	0	1	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	-1	0	-1	0	0	0	0	0	0	1	0	0	0	0
0	0	0	0	0	0	0	0	0	0	1	0	1	0	0	0	0	0	0	-1	0	0	0	0
0	0	1	0	0	1	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	-1	0	0	-1	0	-1	0	0	0	-1	0	0	0	0	0	0	0	0	0	0	0	-1
0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	1	0	1	0	0	0	0	0	0	-1	0	0	0	0
1	-1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	1	-1	-1	0	0	0	0	0	0	-1	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	1	-1	1	-1	1	0	0	0	0	0	0	0	1	0	-1	0	0	0	0	0	0
0	0	0	0	0	0	1	-1	-1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	1	-1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	1	1	0	0	0	0	0	-1	-1	-1	0	0	-1	0	0	0
0	0	0	0	0	0	0	0	1	-1	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	1	-1	0	0	0	0	0	0	0	0	0	0	0	-1
0	0	0	0	0	0	0	0	0	0	0	1	-1	0	0	0	0	0	0	0	0	0	0	1
0	0	0	0	0	0	0	0	0	0	0	0	1	-1	1	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	1	1	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	-1	0	1	0	-1	0	0	-1	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-1	-1	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	1	0	0	0	0	0	0
-1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	-1	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0


  
     ];


 