function [ ] = sim_glucose_glycogen_dependency(out_folder, dia_strength)
%% SIM_GLUCOSE_GLYCOGEN_DEPENDENCY Simulate varying glycogen and glucose

% Glycogen and external glucose concentrations are set to different values
% and the response of the system after a certain time is store.
% To visualize the results use glucose_glycogen_dependency_analysis.
%
% The cases normal, diabetes, insulin_restored and glucagon_restored are
% calculated.
%
% Usage:
% - [1] select out_folder for simulation (in this folder results are
%       stored)
% - [2] select glucose range glycogen range and timespan for simulation 
%       (defines the resolution of the simulation)

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110225  -   v0.1


%% Settings
if nargin == 0
    out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/120307_data/glucose_glycogen_dependency';
end
save(strcat(out_folder, '/tmp'))     % test if possible to save to folder

if nargin == 2
    mpars.dia_strength = dia_strength;
elseif (nargin <=2)
    % strength of diabetes 
    mpars.dia_strength = 'T2DM';            
    %mpars.dia_strength = 'extreme_T2DM'
    %mpars.dia_strength = 'no_epi_extreme_T2DM'
    %mpars.dia_strength = 'sleep_epi_extreme_T2DM';
end

mpars.glc_ext     = 2:0.5:20;              % variance in glucose
%mpars.glycogen    = 0:500:500;               % variance in glycogen
log_tmp = logspace(0, 1, 8)-1;
mpars.glycogen =  [log_tmp linspace(10, 490, 40)  500-log_tmp(end:-1:1)];

% Debug information
mpars.debug         = false;

% Basic parameters
mpars.t_end       = 200;                    % integration end time in [min]
mpars.t_stepsize  = 100;                     % stepsize of calculated t values
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = pars_Sex2('mean');                % initial concentrations
mpars.Vmax          = pars_Vmax_opt();                  % Vmax values
mpars.stoichiometry = model_stoichiometry();            % stoichiometry

% Define gamma function directly (! hormones overwritten)
mpars.gamma = [];

% Constant concentration settings for simulation
mpars.const_in_simulation = {
        'glyglc'        17     
};

%% Defining simulation conditions and files
% for the conditions defined here calculate the data and store it in the
% corresponding files
conditions = cellstr({'normal'
                      'diabetes'
                      'insulin_restored'
                      'glucagon_restored'
              });

%% Simulation
% Simulate for all conditions
for c_index=1:length(conditions)
    fprintf('\n*********************************************************\n');
    
    % condition and out_file
    mpars.condition = conditions{c_index};
    mpars.out_file  = strcat(out_folder, '/glucose_glycogen_dependency_', mpars.condition);

    % Matrices of fluxes and concentrations
    [c_num, v_num] = size(mpars.stoichiometry);
    c_full = zeros(length(mpars.glc_ext), length(mpars.glycogen), length(mpars.t_span), c_num);
    v_full = zeros(length(mpars.glc_ext), length(mpars.glycogen), length(mpars.t_span), v_num);
    
    % Select the appropriate hormonal response function
    [mpars.insulin, mpars.glucagon, mpars.epinephrine] = ...
                                    hormone_response(mpars.condition, mpars.dia_strength);

    % Simulate for all glucose and glycogen concentrations
    fprintf('\n'), mpars, fprintf('\n')
    count = 1; count_max = length(mpars.glc_ext)*length(mpars.glycogen);
    tic;
    for k=1:length(mpars.glc_ext)
        for q = 1:length(mpars.glycogen)
            
            % information about the loops
            if (mod(count, 20) == 1)
                fprintf('%3.2f %%  \t [%6.2f\t->\t%6.2f ] min\n', count/count_max*100, toc/60,  toc/60/count*(count_max-count) );
            end
            count = count + 1; 

            % changed initial concentration for simulation
            mpars.changed_initial = {
                'lac_ext'       33      0.8                 % [mM] lactate extern  
                'glc_ext'       32      mpars.glc_ext(k)    % [mM] glucose extern
                'glyglc'        17      mpars.glycogen(q)   % [mM] glycogen equivalent
            }; 

            % Simulate the model with the given settings
            [t, c, v] = model(mpars);

            % Save concentrations and fluxes
            c_full(k, q, :, :) = c;
            v_full(k, q, :, :) = v;
            
        end
    end

   % Save the data
    v_full = 12.5 * v_full;
    save(mpars.out_file, 'mpars', 'c_full', 'v_full', '-v7.3')
end