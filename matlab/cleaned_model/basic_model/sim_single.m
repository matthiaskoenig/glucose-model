function [t,c,v,mpars] = sim_single()
%SIM_SINGLE Performs simple single simulation with model.
%   function [t,c,v,mpars] = sim_single()
%   Simulation example with the glycolysis, gluconeogenesis model.
%
%   Returns:
%       t:      vector of time points
%       c:      matrix of concentrations for the time points t
%       v:      matrix of fluxes for the time points t
%       mpars : parameter of simulation

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2012 Matthias Koenig
%   date:   121202

clear all, close all, format compact

% Debug information
flux_factor         = 12.5;     % all fluxes in mM/min/P
                                % factor for conversion to µmol/min/kg


mpars.t_end         = 2000;                            % integration time in [min]
mpars.t_stepsize    = 1;                               % steps in solution vector (not stepsize of integration !)
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = pars_S0('mean');      % initial concentrations

mpars.Vmax          = pars_Vmax();
mpars.stoichiometry = model_stoichiometry();           % stoichiometry

% Hormonal control
% Insulin, glucagon and epinephrine dose response curves
%   {'normal', 'IGT', 'T2DM', 'extreme_T2DM'}
%   can be selected.
mpars.insulin       = hormone_f('insulin', 'normal');               % insulin  dose response curve
mpars.glucagon      = hormone_f('glucagon', 'normal');              % glucagon dose response curve
mpars.epinephrine   = hormone_f('epinephrine', 'normal');           % epinephrine dose response curve

% Gamma function 
% Gamma is calculated from the hormone response curves, but can also be
% defined directly, for example to test constant gamma values. If a gamma
% function is specified the hormone functions are not used, but only the
% predefined gamma is taken into account.
mpars.gamma = [];

% Concentration settings for simulation
% additional constant concentrations can be specified here
%mpars.const_in_simulation = {};
mpars.const_in_simulation = {};

% changed initial concentrations for simulation
% alternative starting conditions can be speciefied here (for example
% varying glycogen concentrations at the beginning of the simulation). If a
% metabolite is set constant and the initial concentration is changed than
% the changed initial concentration is set as constant value for the
% complete simulation.
mpars.changed_initial = {
    'lac_ext'       33      1.2     % [mM] lactate extern  
    'glc_ext'       32      3.0     % [mM] glucose extern
    'glyglc'        17      250     % [mM] glycogen equivalent
};
[t, c, v] = model(mpars);
v = flux_factor * v;


res.v = v;
res.c = c;
res.t = t;
save('../results/standard.mat', 'res');

% fig_single(t, c, v);