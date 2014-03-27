function dydt = model_ode_options(t, y, options)
%% MODEL_ODE_OPTIONS Build ODE System from stoichiometric matrix and flux vector V
%   Build ODE System from stoichiometric matrix N and flux vector V.
%
%   V = model_glycolysis(y, options)
%   N = options.stoichiometry
%   dydt = N * V;
%
%   Returns:
%       dydt:   ODE system
%
%   author: Matthias Koenig 
%   date:   110211

dydt = options.stoichiometry * model_glycolysis(y, options);