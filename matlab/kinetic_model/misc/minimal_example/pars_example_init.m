function [S] = pars_example_init()
%% PARS_EXAMPLE_INIT Inital metabolite concentrations
%  Returns the concentration vector in [mM] of initial concentration with
%  which the model simulation is started.
%   
% Returns:
%   S:    vector of substrate concentrations for given modus
%
%   author:     Matthias Koenig 
%   date:       110615
%   version:    0.1

S = [
    5     %	A_ext (1)
    0     %	A (2)
    0     %	B (3)
    0     % C (4)
    0     % C_ext (5)
];