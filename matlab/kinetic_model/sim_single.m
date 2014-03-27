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
%   Copyright 2011 Matthias Koenig
%   date:   110225  -   v0.1

clear all
close all

% Debug information
mpars.debug         = false;
flux_factor         = 12.5;     % all fluxes in mM/min/P
                                % factor for conversion to µmol/min/kg

% Basic parameters
%mpars.Vmax          = 7* pars_Vmax('pp_pv', -0.3);              % Vmax

mpars.t_end         = 2000;                            % integration time in [min]
mpars.t_stepsize    = 1;                               % steps in solution vector (not stepsize of integration !)
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = pars_Sex2('mean');      % initial concentrations
%mpars.Vmax          = 7* pars_Vmax('pp_pv', -0.3);
%mpars.Vmax          = pars_Vmax('pp_pv', 0);
mpars.Vmax          = pars_Vmax_opt();
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
mpars.const_in_simulation = {'glyglc'        17     };

% changed initial concentrations for simulation
% alternative starting conditions can be speciefied here (for example
% varying glycogen concentrations at the beginning of the simulation). If a
% metabolite is set constant and the initial concentration is changed than
% the changed initial concentration is set as constant value for the
% complete simulation.
mpars.changed_initial = {
    'lac_ext'       33      1.2     % [mM] lactate extern  
    'glc_ext'       32      3.0      % [mM] glucose extern
    'glyglc'        17      250       % [mM] glycogen equivalent
};
[t, c, v] = model(mpars);
mpars1 = mpars;

mpars.changed_initial = {
    'lac_ext'       33      1.2     % [mM] lactate extern  
    'glc_ext'       32      9.0     % [mM] glucose extern
    'glyglc'        17      250     % [mM] glycogen equivalent
};
[t, c2, v2] = model(mpars);
mpars2 = mpars;

%{
mpars.changed_initial = {
    'lac_ext'       33      1.2     % [mM] lactate extern  
    'glc_ext'       32      8.0     % [mM] glucose extern
    'glyglc'        17      250     % [mM] glycogen equivalent
};

[t, c3, v3] = model(mpars);
mpars3 = mpars;

mpars.changed_initial = {
    'lac_ext'       33      1.2     % [mM] lactate extern  
    'glc_ext'       32      12.0     % [mM] glucose extern
    'glyglc'        17      250     % [mM] glycogen equivalent
};
[t, c4, v4] = model(mpars);
mpars4 = mpars;
%}

%% Save the data
%save('test.mat', 't', 'v', 'c', 'mpars', -v7.3');
cnames = names_s();
vnames = names_v();
c_hypo = c(end, :);
c_hyper = c2(end, :);
v_hypo = v(end, :);
v_hyper = v2(end, :);

save('sim1_hypoglycemia_ss_glc3mM','v_hypo','c_hypo', 'cnames', 'vnames', 'mpars');
save('sim2_hyperglycemia_ss_glc9mM', 'v_hyper','c_hyper', 'cnames', 'vnames', 'mpars');

%% Display the results
%sim_single_analysis(t, c, v, mpars);

concentration.c1 = c;
concentration.c2 = c2;
%concentration.c3 = c3;
%concentration.c4 = c4;
fluxes.v1 = flux_factor * v;
fluxes.v2 = flux_factor * v2;
%fluxes.v3 = flux_factor * v3;
%fluxes.v4 = flux_factor * v4;
pars.mpars1 = mpars1;
pars.mpars2 = mpars2;
%pars.mpars3 = mpars3;
%pars.mpars4 = mpars4;
fig_multiple_analysis(t, concentration, fluxes, pars)
fluxes.v1(end,1)

