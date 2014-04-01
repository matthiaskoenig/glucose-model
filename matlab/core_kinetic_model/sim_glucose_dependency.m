function [t, c_full, v_full, glc_ext] = sim_glucose_dependency()
%% SIM_GLUCOSE_DEPENDENCY Set varying external glucose concentrations and
% simulate the time courses.
%
%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2014 Matthias Koenig
%   date:   2014-04-01
clear all, close all, format compact;
results_folder = '../../results/glucose_dependency';
res_file = strcat(results_folder, '/', 'glucose_dependency.mat');

% Variation in external glucose concentration
glc_ext = 2.0:0.2:12; % [mM]

% Model to integrate: core is the classic implentation used for the
% publication whereas the sbml version gives the same results but is
% rewritten to represent the model properly in SBML.
tspan = 0:10:70*60;   % [min] 70h
% name = 'core'
name = 'core_sbml'
switch (name)
    case 'core'
        % core model time in [min]
        dydt_fun = @(t,y) dydt_model_glucose(t,y);
    case 'core_sbml'
        % sbml model time in [s]
        dydt_fun = @(t,y) dydt_model_glucose_sbml(t,y);
        tspan = 60 * tspan;
end
func2str(dydt_fun)

% Get the dimensions of the system
x0 = initial_concentrations();
[ctmp, vtmp, ~] = dydt_fun(0, x0);   % get the flux names
Nsim = numel(glc_ext);
Nt = numel(tspan);
Nc = numel(ctmp); 
Nv = numel(vtmp);
clear vtmp ctmp
c_full = zeros(Nt, Nc, Nsim);
v_full = zeros(Nt, Nv, Nsim);

% Simulate for all glucose concentrations
for k=1:Nsim
    fprintf('%3.2f \n', k/Nsim*100);
    % set external glucose concentration
    x0(32) = glc_ext(k); % [mM]
    % set initial glycogen
    x0(17) = 350; % [mM]
    
    % integrate
    [t,c] = ode15s(dydt_fun, tspan , x0, odeset('RelTol', 1e-9, 'AbsTol', 1e-9));
    
    % Calculate fluxes from the ODE system
    v  = zeros(Nt, Nv);
    for k=1:Nt
        [~, v(k, :), ~] = dydt_fun(t(k), c(k, :));
    end
    % Save concentrations and fluxes
    c_full(:, :, k) = c;
    v_full(:, :, k) = v;
end

save(res_file, 'c_full', 'v_full', 'glc_ext', 'tspan', '-v7.3')

