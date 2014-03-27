function [t,c,v,mpars] = sim_single_zonation(t_end, S_start, V_max, hormones, lac_ext, glc_ext)
%SIM_SINGLE Performs simple single simulation with model.
%   function [t,c,v,mpars] = sim_single()
%   Simulation example with the glycolysis, gluconeogenesis model.
%   In the zonation context performs simulation of single hepatocyte within
%   this context with given Vmax values and external hormone concentrations
%
%   Returns:
%       t:      vector of time points
%       c:      matrix of concentrations for the time points t
%       v:      matrix of fluxes for the time points t
%       mpars : parameter of simulation

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110410  -   v0.1

% Debug information
mpars.debug         = false;
flux_factor         = 12.5;     % all fluxes in mM/min/P
                                % factor for conversion to µmol/min/kg

% Basic parameters
%mpars.Vmax          = 7* pars_Vmax('pp_pv', -0.3);              % Vmax

mpars.t_end         = t_end;                            % integration time in [min]
mpars.t_stepsize    = 1;                                % steps in solution vector (not stepsize of integration !)
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = S_start;                          % initial concentrations
mpars.Vmax          = V_max;                            % Vmax of hepatocyte in sinosoid
mpars.stoichiometry = model_stoichiometry();            % stoichiometry

% Hormonal control
% Insulin, glucagon and epinephrine dose response curves
%   {'normal', 'IGT', 'T2DM', 'extreme_T2DM'}
%   can be selected.
mpars.insulin       = hormone_constant_f(hormones.insulin);
mpars.glucagon      = hormone_constant_f(hormones.glucagon);
mpars.epinephrine   = hormone_constant_f(hormones.epinephrine);

% Gamma function 
% Gamma is calculated from the hormone response curves, but can also be
% defined directly, for example to test constant gamma values. If a gamma
% function is specified the hormone functions are not used, but only the
% predefined gamma is taken into account.
mpars.gamma = [];

% Concentration settings for simulation
% additional constant concentrations can be specified here
% For the sinosoid simulations the glycogen is kept constant.
%mpars.const_in_simulation = {};
mpars.const_in_simulation = {'glyglc'        17     };

% changed initial concentrations for simulation
% alternative starting conditions can be speciefied here (for example
% varying glycogen concentrations at the beginning of the simulation). If a
% metabolite is set constant and the initial concentration is changed than
% the changed initial concentration is set as constant value for the
% complete simulation.

mpars.changed_initial = {
    'lac_ext'       33      lac_ext     % [mM] lactate extern  
    'glc_ext'       32      glc_ext     % [mM] glucose extern
    'glyglc'        17      250         % [mM] glycogen equivalent
};
[t, c, v] = model(mpars);
v =  flux_factor * v;
