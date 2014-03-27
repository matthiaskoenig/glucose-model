function [t, c, v, mpars] = sim_example_single()
%SIM_EXAMPLE_SINGLE Performs simple simulation with model.
%
%   Returns:
%       t:      vector of time points
%       c:      matrix of concentrations for the time points t
%       v:      matrix of fluxes for the time points t
%       mpars : parameter of simulation

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110614
%   version: 0.1

clear all
close all


% Basic parameters
mpars.t_end         = 50;                                % integration time in [min]
mpars.t_stepsize    = 0.1;                               % steps in solution vector (not stepsize of integration !)
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = pars_example_init;                   % initial concentrations
mpars.stoichiometry = model_example_stoichiometry();       % stoichiometry

% Constant concentrations in simulation
mpars.const_in_simulation = {'A_ext'    1};

% changed initial concentrations for simulation
% alternative starting conditions can be speciefied here (for example
% varying glycogen concentrations at the beginning of the simulation). If a
% metabolite is set constant and the initial concentration is changed than
% the changed initial concentration is set as constant value for the
% complete simulation.
mpars.changed_initial = {};

%% Simulate
[t, c, v] = model_example(mpars);

%% Display the results
fig_example_single(t, c, v, mpars);


