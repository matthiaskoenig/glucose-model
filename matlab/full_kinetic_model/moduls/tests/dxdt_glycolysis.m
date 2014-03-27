function [dxdt] = dxdt_glycolysis(t, x, pars)
%DXDT_GLYCOLYSIS Example module definition.
% Every module has to definet the used metabolites in the module, the
% inital concentrations for the module, the reactions and the reaction
% equations for the module.
% 
% Pars structure stores global settings of the simualtions (synchronisation
% of modules and communication between modules).

%   date        110408
%   author      Matthias Koenig
%   version     0.1

% Register the names based on the given name, id mappings in pars


% Generate the metabolite workspace variables 
% Like defined in the module (glc, lac, ...)
for k=1:length(pars.names)
    tmp = genvarname(pars.names{k});
    eval([tmp '= x(pars.indices(k))'])
end

%% ODE definition
% GLY: glc + adp -> lac + adp
GLY_Vmax = 1;           % [mM/s]
GLY_km_adp = 2;         % [mM]
GLY_km_glc = 2;         % [mM]
dxdt.GLY = GLY_Vmax * glc/(glc + GLY_km_glc) * adp/(adp + GLY_km_adp);


% GLCT: glc_ext <-> glc
GLCT_Vmax = 1;          % [mM/s]
GLCT_km_glc = 0.5;      % [mM]
dxdt.GLCT = GLCT_Vmax/GLCT_km_glc * (glc - glc_ext)/(1 + glc_ext/GLCT_km_glc + glc/GLCT_km_glc);


% GLCT: lac <-> lac_ext
LACT_Vmax = 1;          % [mM/s]
LACT_km_lac = 0.5;      % [mM]
dxdt.LACT = LACT_Vmax/LACT_km_lac * (lac - lac_ext)/(1 + lac_ext/LACT_km_lac + lac/LACT_km_lac);


% ATPASE: atp -> adp
ATPASE_Vmax = 1;
ATPASE_km_adp = 1.5;
dxdt.ATPASE = ATPASE_Vmax * adp/(adp + ATPASE_km_adp);


