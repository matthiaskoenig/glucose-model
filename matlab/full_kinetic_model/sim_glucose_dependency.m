function [ ] = sim_glucose_dependency(out_folder, dia_strength)
%% SIM_GLUCOSE_DEPENDENCY Simulate varying external glucose concentrations
% External glucose concentrations are set to different values and the 
% time dependent response of the system is stored.
% To visualize the results use glucose_dependency_analysis.
%
% The cases normal, diabetes, insulin_restored and glucagon_restored are
% calculated.
%
% Usage:
% - [1] select out_folder for simulation (in this folder results are
%       stored)
% - [2] select glucose range and time span for simulation (defines the
%       resolution of the simulation)
%

%   Matthias König (matthias.koenig@charite.de)
%   110225

%% Settings
if nargin == 0
    out_folder = '/home/mkoenig/Desktop/results/120222_data';
end
save(strcat(out_folder, '/tmp'))     % test if possible to save to folder

if nargin == 2
    mpars.dia_strength = dia_strength;
elseif (nargin <=2)
    % strength of diabetes
    mpars.dia_strength = 'T2DM';               
    %mpars.dia_strength = 'extreme_T2DM';
    %mpars.dia_strength = 'no_epi_extreme_T2DM';
    %mpars.dia_strength = 'sleep_epi_extreme_T2DM';
end

mpars.glc_ext    = 0:0.5:20;     % variance in glucose

% Define gamma function directly (! hormones overwritten)
mpars.gamma = [];

% Constant concentration settings for simulation
mpars.const_in_simulation = {};

% Debug information
mpars.debug         = false;

% Basic parameters
mpars.t_end      = 3900;                                % integration end time in [min]
mpars.t_stepsize = 10;                                   % stepsize of calculated t values
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
%mpars.Vmax          = pars_Vmax('start');              % Vmax values
%mpars.S_start       = pars_Sex('overnight fast');                 % initial concentrations
%mpars.Vmax = 7 * pars_Vmax('pp_pv', -0.3);             % Vmax values

mpars.S_start       = pars_Sex2('mean');                % initial concentrations
mpars.Vmax = pars_Vmax_opt();                           % Vmax values
mpars.stoichiometry = model_stoichiometry();            % stoichiometry


%% Simulation
% Simulation conditions
conditions = cellstr({'normal'              % all hormone DRC normal
                      'diabetes'            % all hormone DRC T2DM
                      'insulin_restored'    % insulin normal, rest T2DM
                      'glucagon_restored'   % glucagon normal, rest T2DM
              });

for c_index=1:length(conditions)
    fprintf('\n*********************************************************\n');
    
    % condition and out file
    mpars.condition = conditions{c_index};
    mpars.out_file  = strcat(out_folder, '/glucose_dependency_', mpars.condition);

    % Matrices of fluxes and concentrations
    [c_num, v_num] = size(mpars.stoichiometry);
    c_full = zeros(length(mpars.glc_ext), length(mpars.t_span), c_num);
    v_full = zeros(length(mpars.glc_ext), length(mpars.t_span), v_num);
    
    % Select the appropriate hormonal response function for simulation
    [mpars.insulin, mpars.glucagon, mpars.epinephrine] = ...
                                    hormone_response(mpars.condition, mpars.dia_strength);
        
    % Simulate for all glucose concentrations
    fprintf('\n'), mpars, fprintf('\n');
    tic
    count_max = length(mpars.glc_ext);
    for k=1:length(mpars.glc_ext)
        
        % Show progress
        if (mod(k, 20) == 1)
            fprintf('%3.2f %%  \t [%6.2f\t->\t%6.2f ] min\n', k/count_max*100, toc/60,  toc/60/k*(count_max-k) );
        end
        
        % changed initial concentration for simulation
        mpars.changed_initial = {
            'lac_ext'       33      0.8                 % [mM] lactate extern  
            'glc_ext'       32      mpars.glc_ext(k)    % [mM] glucose extern
            'glyglc'        17      200                 % [mM] glycogen equivalent
        }; 
        
        % Simulation to steady state with constant glycogen 
        mpars.const_in_simulation = {'glyglc'        17};
        mpars.t_span        = [0 50];
        [t_ss, c_ss, v_ss] = model(mpars);
        
        % Simulate the model with the given settings
        mpars.const_in_simulation = {};
        mpars.S_start = c_ss(end,:);
        mpars.t_span  = 0:mpars.t_stepsize:mpars.t_end;
        [t, c, v] = model(mpars);
        
        % Save concentrations and fluxes
        c_full(k, :, :) = c;
        v_full(k, :, :) = v;
    end
    
   % Save the data
   % mpars, condition, outfile, t, c_full, v_full
   
   % correct the data to µmol/min/kg for the fluxes
   v_full = 12.5 * v_full;
   save(mpars.out_file, 'mpars', 'c_full', 'v_full', '-v7.3')
   
end
