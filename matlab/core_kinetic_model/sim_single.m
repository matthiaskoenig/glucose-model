function [t, c, v] = sim_single()
%SIM_SINGLE Simulation with hepatic glucose model.
%   Returns:
%       t:      vector of time points
%       c:      matrix of concentrations for the time points t
%       v:      matrix of fluxes for the time points t
%
%   What are the units ?
%   time [min]
%   
%
%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2014 Matthias Koenig
%   date:   2014-03-27

% # SBML TODO #
% TODO: put the initial concentrations in the ODE definition
% TODO: time units -> convert to seconds
% TODO: volumes of cytosol and mito
% TODO: 

clear all, close all, format compact
results_folder = '../../results';


% Initial concentrations
x0 = initial_concentrations();

% which model to integrate for comparison
% name = 'core'
name = 'core_sbml'
%name = 'core'
switch (name)
    case 'core'
        dydt_fun = @(t,y) dydt_model_glucose(t,y);
    case 'core_sbml'
        dydt_fun = @(t,y) dydt_model_glucose_sbml(t,y);
end
func2str(dydt_fun)

% Integration
tspan = 0:1:2000;
[t,c] = ode15s(dydt_fun, tspan , x0, odeset('RelTol', 1e-8));

% Calculate fluxes
[~, vtmp, ~] = dydt_fun(0, x0);
Nv = numel(vtmp);
Nt = numel(t);
v  = zeros(Nt, Nv);
for k=1:Nt
    [~, v(k, :), ~] = dydt_fun(t(k), c(k, :));
end

% Save data for comparison
res.v = v;
res.c = c;
res.t = t;
sim_fname = strcat(results_folder, '/', name, '.mat')
save(sim_fname, 'res');

%% Compare the results to reference implementation from
ref_fname = strcat(results_folder, '/', 'standard.mat')
compare_timecourses(sim_fname, ref_fname) 

%% Create figure
fig_single(t, c, v);