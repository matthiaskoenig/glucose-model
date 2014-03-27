%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation of Dallaman Meal Model       
%       @author Matthias Koenig
%       @contact matthias.koenig@charite.de
%       @data 121129
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all, format compact, close all
[model, modelStruct] = SBmodel('dallaman_meal_normal.txt');

% get all parameters modelStruct
modelPars = modelStruct.parameters;
for k=1:numel(modelPars)
  s = ['pars.' modelPars(k).name '=' num2str(modelPars(k).value) ';'];
  eval(s);
end
clear modelPars

% run simulation
tspan = [0:10:450];
simdata = SBsimulate(model, tspan);

% Generate time, variables and states of the model
t = simdata.time;
for k=1:numel(simdata.states)
    eval([simdata.states{k} '= simdata.statevalues(:,k);']);
end
for k=1:numel(simdata.variables)
    eval([simdata.variables{k} '= simdata.variablevalues(:,k);']);
end