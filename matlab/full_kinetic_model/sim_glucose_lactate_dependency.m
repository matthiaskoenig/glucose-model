function [ ] = sim_glucose_lactate_dependency(out_folder)
%% SIM_GLUCOSE_LACTATE_DEPENDENCY Simulate varying lactate and glucose
%% concentrations.

% External lactate and glucose concentrations are set to different values
% and the response of the system after a certain time is store.
% To visualize the results use glucose_lactate_dependency_analysis.
%
% The cases normal, diabetes, insulin_restored and glucagon_restored are
% calculated.
%
% Usage:
% - [1] select out_folder for simulation (in this folder results are
%       stored)
% - [2] select glucose range glycogen range and timespan for simulation 
%       (defines the resolution of the simulation)
%
%   author: Matthias König (matthias.koenig@charite.de)
%   date:   110225

if nargin == 0
    close all
    clear all
end

fprintf('\n*********************************************************\n');
fprintf('\n    Glucose - Lactate - Dependency                       \n');
fprintf('\n*********************************************************\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Simulation Settings
if nargin == 0
    out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110215_data/glucose_lactate_dependency'
    save(strcat(out_folder, '/tmp'))     % test if possible to save to folder
end

% Construct logarithmic lactate vector
log_lac = (logspace(0, 1, 50)-1)*4.1;

mpars.dia_strength = 'T2DM';
%mpars.dia_strength = 'extreme_T2DM'
%mpars.dia_strength = 'no_epi_extreme_T2DM'
%mpars.dia_strength = 'sleep_epi_extreme_T2DM';

mpars.glc_ext     = 2:0.2:16                  % [mM] variance in glucose 
%mpars.lac_ext     = 0.01:0.5:4.1;            % [mM] variance in lactate
mpars.lac_ext = log_lac;

mpars.glycogen    = 250;                      % [mM] glycogen equivalent
mpars.t_end       = 500;                      % [min] integration end time in [min]
mpars.t_stepsize  = 100;                      % stepsize of calculated t values

% Debug information
mpars.debug         = false;

% Basic parameters
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = pars_Sex('overnight_fast');      % initial concentrations
mpars.Vmax          = pars_Vmax('start');              % Vmax values
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
conditions = cellstr({'normal', 'diabetes', 'insulin_restored', 'glucagon_restored'});

%% Simulation
% Simulate for all conditions
for c_index=1:length(conditions)
    fprintf('\n*********************************************************\n');

    % condition and out_file
    mpars.condition = conditions{c_index}
    mpars.out_file  = strcat(out_folder, '/glucose_lactate_dependency_', mpars.condition);

    % Matrices of fluxes and concentrations
    [c_num, v_num] = size(mpars.stoichiometry);
    c_full = zeros(length(mpars.glc_ext), length(mpars.lac_ext), length(mpars.t_span), c_num);
    v_full = zeros(length(mpars.glc_ext), length(mpars.lac_ext), length(mpars.t_span), v_num);
    
    % Select the appropriate hormonal response function
    % Select the appropriate hormonal response function
    [mpars.insulin, mpars.glucagon, mpars.epinephrine] = ...
                                    hormone_response(mpars.condition, mpars.dia_strength);

    
    % Simulate for all glucose and lactate concentrations
    fprintf('\n'), mpars, fprintf('\n')
    count = 1; 
    count_max = length(mpars.glc_ext)*length(mpars.lac_ext);
    tic
    for k=1:length(mpars.glc_ext)
        for q = 1:length(mpars.lac_ext)
            
            % information about the loops
            if (mod(count, 20) == 1)
                fprintf('%3.2f %%  \t [%6.2f\t->\t%6.2f ] min\n', count/count_max*100, toc/60,  toc/60/count*(count_max-count) );
            end
            count = count + 1; 
            
            % changed initial concentration for simulation
            mpars.changed_initial = {
                'lac_ext'       33      mpars.lac_ext(q)    % [mM] lactate extern  
                'glc_ext'       32      mpars.glc_ext(k)    % [mM] glucose extern
                'glyglc'        17      mpars.glycogen      % [mM] glycogen equivalent
            }; 

            % Simulate the model with the given settings
            [t, c, v] = model(mpars);

            % Save concentrations and fluxes
            c_full(k, q, :, :) = c;
            v_full(k, q, :, :) = v;
        end
    end

   % Save the data
   save(mpars.out_file, 'mpars', 'c_full', 'v_full', '-v7.3')
   
end