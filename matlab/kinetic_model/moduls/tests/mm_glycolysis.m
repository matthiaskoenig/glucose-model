function [x, x_init, r, r_dxdt] = mm_glycolysis(t, x, m, r, indeces, pars)
%MM_GLYCOLYSIS Example module definition.
% Every module has to definet the used metabolites in the module, the
% inital concentrations for the module, the reactions and the reaction
% equations for the module.
% 
% A global pars structure is given into the module, so that general global
% settings can be applied to the initial concentrations or to the rate
% equations.

%   date        110326
%   author      Matthias Koenig
%   version     0.1




% assign the correct values to the Module metabolite variables based on the
% indices
% TODO

% Generate the metabolite workspace variables
% can be made at the beginning in the external definition
v = genvarname({'glc', 'h', ...}
eval([v '= data(1:7, 3);']);

names
indeces

for i in M.names
    eval(name(i) '=' x(M.indeces(i)) 
end


% generate the ODEs
v_LDH = 

v_GLCT = 

v_LACT = 




% calculate the differentials based on the reaction names
% controls if the correct Names are used and all defined reactions are
% assigned
dxdt = zeros(length(r))
for i=
    
end