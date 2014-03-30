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
S0 = [
    2.8000  % S1 atp
    0.8000  % S2 adp
    0.1600  % S3 amp
    0.2700  % S4 utp
    0.0900  % S5 udp
    0.2900  % S6 gtp
    0.1000  % S7 gdp
    1.2200  % S8 nad
    0.56E-3  % S9 nadh
    5.0000  % S10 phos
    0.0080  % S11 pp
         0  % S12 h20
    5.0000  % S13 co2
         0  % S14 h
    0.0120  % S15 glc1p
    0.3800  % S16 udpglc
  250.0000  % S17 glyglc
    5.0000  % S18 glc
    0.1200  % S19 glc6p
    0.0500  % S20 fru6p
    0.0200  % S21 fru16bp
    0.0040  % S22 fru26bp
    0.1000  % S23 grap
    0.0300  % S24 dhap
    0.3000  % S25 bpg13
    0.2700  % S26 pg3
    0.0300  % S27 pg2
    0.1500  % S28 pep
    0.1000  % S29 pyr
    0.0100  % S30 oaa
    0.5000  % S31 lac
    3.0000  % S32 glc_ext
    1.2000  % S33 lac_ext
    5.0000  % S34 co2_mito
    5.0000  % S35 p_mito
    0.0100  % S36 oaa_mito
    0.1500  % S37 pep_mito
    0.0400  % S38 acoa_mito
    0.1000  % S39 pyr_mito
    0.3200  % S40 cit_mito
    2.8000  % S41 atp_mito
    0.8000  % S42 adp_mito
    0.2900  % S43 gtp_mito
    0.1000  % S44 gdp_mito
    0.0550  % S45 coa_mito
    0.2400  % S46 nadh_mito
    0.9800  % S47 nad_mito
    0
    0
];  

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
[t,c] = ode15s(dydt_fun, tspan , S0, odeset('RelTol', 1e-8));

% Calculate fluxes
[~, vtmp] = dydt_fun(0, S0);
Nv = numel(vtmp);
Nt = numel(t);
v  = zeros(Nt, Nv);
for k=1:Nt
    [~, v(k, :)] = dydt_fun(t(k), c(k, :));
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