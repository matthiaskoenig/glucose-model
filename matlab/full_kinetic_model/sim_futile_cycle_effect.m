% Simulate the glucose model with and without the effect on the hormones of
% certain parts of the metabolsim.
% Example: role of hormonal response to react to change in glucose
% metabolism for example in glycogen metabolism

% 1. Simulate model response to an instantanious change in external glucose
% concentration.
% 2. Simulate model response without the hormonal effects on glycogen
% metabolism
% 3. Compare the model simulations

clear all
close all

load_data = false;
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/fastkinetics/120312';
out_file  = strcat(out_folder, '/fast_kinetics_data');


if ~load_data
    
% Debug information
mpars.debug         = false;
flux_factor         = 12.5;     % all fluxes in mM/min/P
                                % factor for conversion to µmol/min/kg

% Basic parameters
%mpars.Vmax          = 7* pars_Vmax('pp_pv', -0.3);              % Vmax

mpars.S_start       = pars_Sex2('mean');      % initial concentrations
mpars.Vmax          = pars_Vmax_opt();
mpars.stoichiometry = model_stoichiometry();           % stoichiometry

% Hormonal control
% Insulin, glucagon and epinephrine dose response curves
%   {'normal', 'IGT', 'T2DM', 'extreme_T2DM'}
%   can be selected.
mpars.insulin       = hormone_f('insulin', 'normal');               % insulin  dose response curve
mpars.glucagon      = hormone_f('glucagon', 'normal');              % glucagon dose response curve
mpars.epinephrine   = hormone_f('epinephrine', 'normal');           % epinephrine dose response curve
mpars.gamma = [];

% Two cases: with and without enzymatic defect
for k = 1:2
    
    %% Set the hormone defect in glycolysis
    if k==1
        mpars.glycogen_gamma_defect = false;
    else
        mpars.glycogen_gamma_defect = true;
    end

    %% [1] simulation to steady state
    disp('*** Steady state simulation ***')
    mpars.const_in_simulation = {'glyglc'        17     };
    mpars.t_end         = 50;                               
    mpars.t_stepsize    = 1;                            
    mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
    mpars.changed_initial = {
        'lac_ext'       33      1.2     % [mM] lactate extern  
        'glc_ext'       32      5.5     % [mM] glucose extern
        'glyglc'        17      250     % [mM] glycogen equivalent
    };
    [t, c, v] = model(mpars);

        
    %% [2] simulate precondition of disturbtion
    disp('*** Initial state ***')
    mpars.S_start       = c(end, :);
    mpars.const_in_simulation = {};
    mpars.t_end         = 5;                               
    mpars.t_stepsize    = 1/60;                            
    mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
    mpars.changed_initial = {
        'lac_ext'       33      1.2     % [mM] lactate extern  
        'glc_ext'       32      5.0     % [mM] glucose extern
        'glyglc'        17      250     % [mM] glycogen equivalent
    };
    [t c, v] = model(mpars);
    t_total = t;
    c_total = c;
    v_total = v;
    t_end = t_total(end);

    t_change1 = 0.3;
    
    %% [3] simulate perturbation of glucose metabolism
    disp('*** Perturbation 1 : 7.0mM ***')
    % Funktion for Glucoseänderung
    t_vec =    [-5 0 10 20];
    data_vec = [  5 7  7  ];
    mpars.f_glc_ext = smooth_timecourse(t_vec, data_vec, t_change1);
    mpars.S_start       = c(end, :);
    mpars.const_in_simulation = {};
    mpars.t_end         = 10;                               
    mpars.t_stepsize    = 1/60;                            
    mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
    mpars.changed_initial = {
        'lac_ext'       33      1.2     % [mM] lactate extern  
        'glc_ext'       32      7.0     % [mM] glucose extern
         'glyglc'        17     c(end,17)     % [mM] glycogen equivalent
    };
    [t, c, v] = model(mpars);
    t_total = [t_total; t+t_end];
    c_total = [c_total; c];
    v_total = [v_total; v];
    t_end = t_total(end);

    %% [4] simulate second perturbation of glucose metabolism
    disp('*** Perturbation 2 : 3.5mM ***')
    t_vec =    [-5 0 10 20];
    data_vec = [  7 3  3  ];
    mpars.f_glc_ext = smooth_timecourse(t_vec, data_vec, t_change1);
    mpars.S_start       = c(end, :);
    mpars.const_in_simulation = {};
    mpars.t_end         = 10;                               
    mpars.t_stepsize    = 1/60;                            
    mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
    mpars.changed_initial = {
        'lac_ext'       33      1.2     % [mM] lactate extern  
        'glc_ext'       32      3.0     % [mM] glucose extern
        'glyglc'        17     c(end,17)     % [mM] glycogen equivalent
    };
    [t, c, v] = model(mpars);
    t_total = [t_total; t+t_end];
    c_total = [c_total; c];
    v_total = [v_total; v];
    t_end = t_total(end);

    %% [5] back to normal
    disp('*** Initial State ***')
    t_vec =    [-5 0 5 20];
    data_vec = [  3 5  5  ];
    mpars.f_glc_ext = smooth_timecourse(t_vec, data_vec, t_change1);
    mpars.S_start       = c(end, :);
    mpars.const_in_simulation = {};
    mpars.t_end         = 5;                               
    mpars.t_stepsize    = 1/60;                            
    mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
    mpars.changed_initial = {
        'lac_ext'       33      1.2     % [mM] lactate extern  
        'glc_ext'       32      5.0     % [mM] glucose extern
        'glyglc'        17     c(end,17)     % [mM] glycogen equivalent
    };
    [t, c, v] = model(mpars);
    t_total = [t_total; t+t_end];
    c_total = [c_total; c];
    v_total = [v_total; v];
    t_end = t_total(end);

    if k==1
        t1 = t_total;
        c1 = c_total;
        v1 = 12.5*v_total;
    else
        t2 = t_total;
        c2 = c_total;
        v2 = 12.5*v_total;
    end
end

save(out_file, 't1', 'c1', 'v1', 't2', 'c2', 'v2');
end % load data
if load_data
    disp('NOT SIMULATED - DATA LOADED')
   load(out_file);
end


%% Display the results
fig_futile_cycle_effect(t1, c1, v1, t2, c2, v2);
%%
%fig_futile_cycle_effect(t2, c2, v2);
