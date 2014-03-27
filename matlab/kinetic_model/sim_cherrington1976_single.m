function [t,c,v,mpars] = sim_cherrington1976_single(t_start, t_end, t_step, c_init, data)
% SIM_SINGLE Simulation of the Cherrington1976 insulin and glucagon clamp
% experiments
%
%   Returns:
%       t:      vector of time points
%       c:      matrix of concentrations for the time points t
%       v:      matrix of fluxes for the time points t
%       mpars : parameter of simulation
%
%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2012 Matthias Koenig
%   date:   120220  -   v0.1

% Debug information
mpars.debug         = false;
flux_factor         = 12.5;     % all fluxes in mM/min/P
                                % factor for conversion to µmol/min/kg
                                
mpars.t_end         = t_end;                             % integration time in [min]
mpars.t_stepsize    = t_step;                               % steps in solution vector (not stepsize of integration !)
mpars.t_span        = t_start:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = c_init;
mpars.Vmax          = pars_Vmax_opt();
mpars.stoichiometry = model_stoichiometry();           % stoichiometry

mpars.data = data;

mpars.const_in_simulation = {};
mpars.changed_initial = {};
mpars.cherrington1976 = true;

[t, c, v] = model(mpars);
v = flux_factor * v;
