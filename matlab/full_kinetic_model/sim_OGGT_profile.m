function [] = sim_OGGT_profile()
%% SIM_OGGT_PROFILE simulates a given OGGT profile.
%
%   Uses givem OGGT glucose, insulin and glucagon data to simulate the time
%   course of the HGP/HGU.
%   Only the mean liver effect can be calculated.

% Two different simulations:
%   [1] use glucose, insulin and glucagon to calculate the hgp
%   [2] only use the glucose to calculate the insulin, glucagon and hgp
%
%   author:     Matthias Koenig
%   date:       110212
clear all

%% profiles used from Firth1986
data_normal = [
    %time	glucose	glucose SEM	insulin	insulin SEM	glucagon	glucagon SEM	EGP	 EGP-SEM
    %[min]	[mM]	[mM]	[pmol/l]	[pmol/l]	[pmol/l]	[pmol/l]
    %mg/min/kg	mg/min/kg
    -20.00	5.34	0.40	66.95	28.37	38.45	6.48	1.73	0.23
    -10.00	5.27	0.54	66.63	34.04	38.42	7.65	1.99	0.32
    0.00	5.26	0.54	71.98	34.02	37.79	6.49	1.71	0.31
    15.00	6.26	0.48	182.03	65.23	40.40	7.07	1.91	0.19
    30.00	7.60	0.54	343.10	136.10	39.46	7.66	1.39	0.27
    45.00	7.66	0.47	280.22	93.58	34.40	6.77	1.42	0.18
    60.00	7.44	0.54	257.07	62.32	33.75	7.06	1.03	0.24
    90.00	7.49	0.47	244.69	31.18	31.89	7.07	0.82	0.18
    120.00	7.33	0.47	243.68	34.04	30.90	7.65	0.93	0.16
    180.00	5.93	0.68	221.82	96.39	34.22	9.12	0.82	0.14
    240.00	5.40	0.81	123.41	42.52	30.77	5.30	0.82	0.13
    300.00	4.68	0.88	53.37	31.21	35.86	7.65	1.12	0.19
    360.00	4.83	0.88	62.64	53.86	35.65	7.95	1.48	0.24
    420.00	4.65	0.75	60.67	45.31	37.50	11.77	1.53	0.11
];
data_T2DM = [
    %time	glucose	glucose SEM	insulin	insulin SEM	glucagon	glucagon SEM	EGP	EGP SE
    %[min]	[mM]	[mM]	[pmol/l]	[pmol/l]	[pmol/l]	[pmol/l]	mg/min/kg	mg/min/kg
    -20.00	10.35	0.74	103.83	45.38	34.92	3.53	3.14	0.24
    -10.00	10.28	0.81	97.84	36.90	34.59	3.53	2.91	0.39
    0.00	10.20	0.74	91.83	31.18	33.38	3.24	3.03	0.44
    15.00	11.81	0.54	153.70	34.02	44.22	5.59	2.70	0.37
    30.00	12.88	0.81	167.36	28.32	41.81	4.71	2.27	0.27
    45.00	14.02	0.61	169.70	48.19	37.64	4.41	2.43	0.26
    60.00	14.49	0.81	180.50	36.80	34.64	3.23	2.31	0.34
    90.00	14.66	0.95	176.68	36.88	32.18	3.83	1.88	0.24
    120.00	14.37	0.88	181.31	31.18	30.31	4.41	1.68	0.18
    180.00	13.44	0.81	179.29	39.69	28.92	4.12	1.54	0.13
    240.00	11.29	0.88	148.92	31.16	31.95	4.71	1.45	0.23
    300.00	9.42	0.81	112.86	45.33	32.62	4.71	1.23	0.13
    360.00	8.22	0.68	116.50	42.47	35.35	6.18	1.28	0.21
    420.00	7.29	0.75	111.72	42.55	38.97	7.36	1.53	0.14
];

%% single profiles
% time in min
t_profile = data_normal(:,1);

% glucose in mM
glucose_profile      = data_normal(:,2:3);
glucose_profile_T2DM = data_T2DM(:,2:3);

% insulin profile in pmol/l
insulin_profile      = data_normal(:,4:5);
insulin_profile_T2DM = data_T2DM(:,4:5);
    
% glucagon profile in pmol/l
glucagon_profile        = data_normal(:, 6:7);
glucagon_profile_T2DM   = data_T2DM(:, 6:7);
    
% EGP profile
hgp_profile = data_normal(:, 8:9);
hgp_profile_T2DM = data_T2DM(:,8:9);
    

%% Simulate the system for the given data
conditions = {'normal', 'T2DM'};

% Debug information
mpars.debug         = false;

% Basic parameters
mpars.t_end         = 500;                             % integration time in [min]
mpars.t_stepsize    = 250;                             % steps in solution vector (not stepsize of integration !)
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = pars_Sex('overnight_fast');      % initial concentrations
mpars.Vmax          = pars_Vmax('start');              % Vmax values
mpars.stoichiometry = model_stoichiometry();           % stoichiometry

% Hormonal control
% Insulin, glucagon and epinephrine dose response curves
mpars.insulin       = [];              % insulin  dose response curve
mpars.glucagon      = [];              % glucagon dose response curve
mpars.epinephrine   = [];              % epinephrine dose response curve
mpars.gamma   = [];                    % overwritten with constant gamma function later

% Concentration settings for simulation
% additional constant concentrations
mpars.const_in_simulation = {
    'glyglc'        17     
};

[c_num, v_num] = size(mpars.stoichiometry);


%% [1] Simulations using glucose, glucagon and insulin profiles
% calculate the gamma profile
N = length(t_profile);
gamma_profile                        = zeros(N,1);
gamma_profile_T2DM                   = zeros(N,1);
for k=1:N
    gamma_profile(k) = gamma_f( insulin_rel_f(insulin_profile(k,1)), ...
                                glucagon_rel_f(glucagon_profile(k,1)), ...
                                epinephrine_f_normal(glucose_profile(k,1)) );
    
    gamma_profile_T2DM(k) = gamma_f( insulin_rel_f(insulin_profile_T2DM(k,1)), ...
                                glucagon_rel_f(glucagon_profile_T2DM(k,1)), ...
                                epinephrine_f_T2DM(glucose_profile(k,1)) );
end

% store the end points of simulations
c_normal = zeros(c_num, N);
v_normal = zeros(v_num, N);
c_T2DM = zeros(c_num, N);
v_T2DM = zeros(v_num, N);

% simulate
for c_ind=1:length(conditions)
    for k = 1:N
        % get the gamma and glucose values depending on the condition
        condition = conditions{c_ind};
        switch condition
            case 'normal'
                mpars.gamma_val = gamma_profile(k);
                mpars.glc_ext   = glucose_profile(k);
            case 'T2DM'
                mpars.gamma_val = gamma_profile_T2DM(k);
                mpars.glc_ext   = glucose_profile_T2DM(k);
        end
        
        % Use constant gamma function for the gamma values
        % helper function
        mpars.gamma = @gamma_const;
        
        % change initial concentration for simulation
        % glycogen is kept constant to half full
        mpars.changed_initial = {
            'lac_ext'       33      0.8             % [mM] lactate extern
            'glc_ext'       32      mpars.glc_ext   % [mM] glucose extern
            'glyglc'        17      250         % [mM] glycogen equivalent
            %'glyglc'        17      k/N*500         % [mM] glycogen equivalent
            };
        
        % simultate
        [t, c, v] = model(mpars);
        
        % store endpoints of solution
        switch condition
            case 'normal'
                c_normal(:,k) = c(end,:);
                v_normal(:,k) = v(end,:);
            case 'T2DM'
                c_T2DM(:,k) = c(end,:);
                v_T2DM(:,k) = v(end,:);
        end
    end
end

%% the interesting fluxes
hgp_sim_profile                      =   v_normal(1,:);
hgp_sim_profile_T2DM                 =   v_T2DM(1,:);
gluconeogenesis_sim_profile          =   v_normal(4,:);
gluconeogenesis_sim_profile_T2DM     =   v_T2DM(4,:);
glycogenolysis_sim_profile           = - v_normal(5,:);
glycogenolysis_sim_profile_T2DM      = - v_T2DM(5,:);


%% [2] Simulations using only the given glucose profile
% store the end points of simulations
c_normal_glc = zeros(c_num, N);
v_normal_glc = zeros(v_num, N);
c_T2DM_glc = zeros(c_num, N);
v_T2DM_glc = zeros(v_num, N);

% calculate the gamma profile
gamma_profile_glc                        = zeros(N,1);
gamma_profile_T2DM_glc                   = zeros(N,1);
for k=1:N
    
    gamma_profile_glc(k)  = gamma_f(    insulin_f_normal(glucose_profile(k,1)), ...
                                        glucagon_f_normal(glucose_profile(k,1)), ...
                                        epinephrine_f_normal(glucose_profile(k,1)) );
    gamma_profile_T2DM_glc(k) = gamma_f(insulin_f_T2DM(glucose_profile_T2DM(k,1)), ...
                                        glucagon_f_T2DM(glucose_profile_T2DM(k,1)), ...
                                        epinephrine_f_T2DM(glucose_profile_T2DM(k,1)) );
end

% simulate
for c_ind=1:length(conditions)
    for k = 1:N
        % get the gamma and glucose values depending on the condition
        condition = conditions{c_ind};
        switch condition
            case 'normal'
                mpars.glc_ext   = glucose_profile(k);
                mpars.gamma_val = gamma_profile_glc(k)
            case 'T2DM'
                mpars.glc_ext   = glucose_profile_T2DM(k);
                mpars.gamma_val = gamma_profile_T2DM_glc(k);
        end
        
        % Use constant gamma function for the gamma values
        % helper function
        mpars.gamma = @gamma_const;
        
        % change initial concentration for simulation
        % glycogen is kept constant to half full
        mpars.changed_initial = {
            'lac_ext'       33      0.8             % [mM] lactate extern
            'glc_ext'       32      mpars.glc_ext   % [mM] glucose extern
            'glyglc'        17      250         % [mM] glycogen equivalent
            %'glyglc'        17      k/N*500         % [mM] glycogen equivalent
            };
        
        % simultate
        [t, c, v] = model(mpars);
        
        % store endpoints of solution
        switch condition
            case 'normal'
                c_normal_glc(:,k) = c(end,:);
                v_normal_glc(:,k) = v(end,:);
            case 'T2DM'
                c_T2DM_glc(:,k) = c(end,:);
                v_T2DM_glc(:,k) = v(end,:);
        end
    end
end

%% the interesting fluxes
hgp_sim_profile_glc                      =   v_normal_glc(1,:);
hgp_sim_profile_T2DM_glc                 =   v_T2DM_glc(1,:);
gluconeogenesis_sim_profile_glc          =   v_normal_glc(4,:);
gluconeogenesis_sim_profile_T2DM_glc     =   v_T2DM_glc(4,:);
glycogenolysis_sim_profile_glc           = - v_normal_glc(5,:);
glycogenolysis_sim_profile_T2DM_glc      = - v_T2DM_glc(5,:);




%% Plot the results

for tmp =1:1
    close all
    fig1 = figure('Name','Experimental profiles', 'Color',[1 1 1]);
    % Glucose
    subplot(4,1,1)
    errorbar(t_profile, glucose_profile(:,1), glucose_profile(:,2), 'bo-'), hold on
    errorbar(t_profile, glucose_profile_T2DM(:,1), glucose_profile_T2DM(:,2), 'rs-'), hold off
    title('Glucose (t)', 'Fontweight', 'bold')
    ylabel('glucose [mM]')
    xlabel('time [min]')
    legend('normal', 'T2DM')
    % Insulin
    subplot(4,1,2)
    errorbar(t_profile, insulin_profile(:,1), insulin_profile(:,2), 'bo-'), hold on
    errorbar(t_profile, insulin_profile_T2DM(:,1), insulin_profile_T2DM(:,2), 'rs-'), hold off
    title('Insulin (t)', 'Fontweight', 'bold')
    ylabel('insulin [pmol/l]')
    xlabel('time [min]')
    % Glucagon
    subplot(4,1,3)
    errorbar(t_profile, glucagon_profile(:,1), glucagon_profile(:,2), 'bo-'), hold on
    errorbar(t_profile, glucagon_profile_T2DM(:,1), glucagon_profile_T2DM(:,2), 'rs-'), hold off
    title('Glucagon (t)', 'Fontweight', 'bold')
    ylabel('glucagon [pmol/l]')
    xlabel('time [min]')
    % Gamma
    subplot(4,1,4)
    plot(t_profile, gamma_profile, 'bo-'), hold on
    plot(t_profile, gamma_profile_T2DM, 'rs-'), hold on
    plot(t_profile, gamma_profile_glc, 'bo--'), hold on
    plot(t_profile, gamma_profile_T2DM_glc, 'rs--'), hold off
    title('\gamma (t)', 'Fontweight', 'bold')
    ylabel('gamma')
    xlabel('time [min]')
    
    figure('Name','Simulation results', 'Color',[1 1 1]);
    % experimental HGP
    subplot(4,1,1)
    errorbar(t_profile, hgp_profile(:,1), hgp_profile(:,2), 'bo-'), hold on
    errorbar(t_profile, hgp_profile_T2DM(:,1), hgp_profile_T2DM(:,2), 'rs-'), hold on
    plot(t_profile, hgp_profile(:,1)-hgp_profile_T2DM(:,1), 'ks-'), hold off
    title('HGP experimental (t)', 'Fontweight', 'bold')
    xlabel('time [min]')
    % simulated HGP
    subplot(4,1,2)
    plot(t_profile, hgp_sim_profile, 'bo-'), hold on
    plot(t_profile, hgp_sim_profile_T2DM, 'rs-'), hold on
    plot(t_profile, hgp_sim_profile - hgp_sim_profile_T2DM, 'ks-'), hold on
    plot(t_profile, hgp_sim_profile_glc, 'bo--'), hold on
    plot(t_profile, hgp_sim_profile_T2DM_glc, 'rs--'), hold on
    plot(t_profile, hgp_sim_profile_glc - hgp_sim_profile_T2DM_glc, 'ks--'), hold off
    title('HGP simulated (t)', 'Fontweight', 'bold')
    xlabel('time [min]')
    % gluconegenesis
    subplot(4,1,3)
    plot(t_profile, gluconeogenesis_sim_profile, 'bo-'), hold on
    plot(t_profile, gluconeogenesis_sim_profile_T2DM, 'rs-'), hold on
    plot(t_profile, gluconeogenesis_sim_profile_glc, 'bo--'), hold on
    plot(t_profile, gluconeogenesis_sim_profile_T2DM_glc, 'rs--'), hold off
    title('Gluconeogenesis simulation (t)', 'Fontweight', 'bold')
    xlabel('time [min]')
    % glycogenolysis
    subplot(4,1,4)
    plot(t_profile, glycogenolysis_sim_profile, 'bo-'), hold on
    plot(t_profile, glycogenolysis_sim_profile_T2DM, 'rs-'), hold on
    plot(t_profile, glycogenolysis_sim_profile_glc, 'bo--'), hold on
    plot(t_profile, glycogenolysis_sim_profile_T2DM_glc, 'rs--'), hold off
    title('Glycogenolysis simulation (t)', 'Fontweight', 'bold')
    xlabel('time [min]')
    
    fig3 = figure('Name','Difference in output', 'Color',[1 1 1]);
    % experimental HGP
    diff_exp = (hgp_profile(:,1)-hgp_profile_T2DM(:,1));
    diff_exp_error = max(hgp_profile(:,2), hgp_profile_T2DM(:,2));
    
    
    factor = 1; % 0.482
    diff_sim = factor * (hgp_sim_profile - hgp_sim_profile_T2DM);
    diff_sim_glc = factor * (hgp_sim_profile_glc - hgp_sim_profile_T2DM_glc);
    
    errorbar(t_profile, diff_exp, diff_exp_error, 'bs-'), hold on
    plot(t_profile, diff_sim, 'rs-'), hold on
    plot(t_profile, diff_sim_glc, 'rs--'), hold off
    
    title('EGP and HGP (t)', 'Fontweight', 'bold')
    xlabel('time [min]')
    legend('experimental', 'simulated')
    
    factor = mean(diff_exp./diff_sim') 
    
    
end

function g_const = gamma_const(glc)
    %% constant gamma helper function
    % independent of the given glucose concentration the gamma is set to
    % the value specified in mpars.gamma_val
    g_const = mpars.gamma_val;
end



end