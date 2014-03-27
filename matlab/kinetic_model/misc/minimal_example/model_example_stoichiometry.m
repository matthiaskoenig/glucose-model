function N = model_example_stoichiometry()
%% MODEL_STOICHIOMETRY stoichiometric matrix of the system
%
%   Returns:
%       N:  stoichiometric matrix of the system
%
%   author:     Matthias Koenig 
%   date:       110211
%   version:    0.1

% Stoichiometric matrix of the model.
N = [  
%   v1   v2  v3  v4  v5
   -1     0   0   0  0     % A_ext
    1    -1   0   0  0     % A
    0     1   0  -1  0     % B
    0     1  -1   1  0     % C
    0     0   1   0 -1     % C_ext
];


 