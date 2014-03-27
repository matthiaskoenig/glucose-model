function [ ] = sim_pv_pp(out_folder)
%% SIM_PV_PP Simulate perivenious and periportal hepatocytes
% External glucose concentrations are set to different values and the 
% time dependent response of the system is simulated.
%
% The Vmax values are changed according to the given conditions for peri
%
% Usage:
% - [1] select out_folder for simulation (in this folder results are
%       stored)
% - [2] select glucose range and time span for simulation (defines the
%       resolution of the simulation)
%
%   author: Matthias König (matthias.koenig@charite.de)
%   date:   110211


%% General initialization
format compact
if nargin == 0
    close all
    clear all
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Simulation Settings

if nargin == 0
    out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110214_data/pp_pv';
    save(strcat(out_folder, '/tmp'))     % test if possible to save to folder
    %!rm tmp.mat
end

mpars.glc_ext    = 0:0.2:20;                 % variance in glucose
mpars.t_end      = 2000;                   % integration end time in [min]
mpars.t_stepsize = 1;                      % stepsize of calculated t values

% Debug information
mpars.debug         = false;

% Basic parameters
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = pars_Sex('overnight_fast');      % initial concentrations
mpars.stoichiometry = model_stoichiometry();            % stoichiometry

% Hormonal control
% Insulin, glucagon and epinephrine dose response curves
mpars.insulin       = @insulin_f_normal;              % insulin  dose response curve
mpars.glucagon      = @glucagon_f_normal;             % glucagon dose response curve
mpars.epinephrine   = @epinephrine_f_normal;          % epinephrine dose response curve

% Gamma function directly (! if function is specified insulin, glucagon and
% epinephrine are not used ! -> overwrites the hormones)
mpars.gamma = [];

% Concentration settings for simulation
% additional constant concentrations
mpars.const_in_simulation = {};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Defining simulation conditions and files
% for the conditions defined here calculate the data and store it in the
% corresponding files

mpars.conditions = [ 0.5 0.3 0.2 0.1 0];
out_files = cell(1,length(mpars.conditions));
for k=1:length(mpars.conditions)
   out_files{k} =  strcat(out_folder, '/pp_pv_', num2str(k));
end
          
%% Simulation
for c_index=1:length(mpars.conditions)
    fprintf('\n*********************************************************\n');
    condition = mpars.conditions(c_index)
    out_file  = out_files{c_index}
    
    % Set the Vmax according to the data
    mpars.Vmax = pars_Vmax('pp_pv', condition);              % Vmax values
    mpars.Vmax
    % Matrices of fluxes and concentrations
    [c_num, v_num] = size(mpars.stoichiometry);
    c_full = zeros(length(mpars.glc_ext), length(mpars.t_span), c_num);
    v_full = zeros(length(mpars.glc_ext), length(mpars.t_span), v_num);
    
    % Select the appropriate hormonal response function for simulation

    mpars.insulin        = @insulin_f_normal;
    mpars.glucagon       = @glucagon_f_normal;
    mpars.epinephrine    = @epinephrine_f_normal;
        
    % Simulate for all glucose concentrations
    fprintf('\n');
    mpars
    fprintf('\n');
    count_max = length(mpars.glc_ext);
    tic
    for k=1:length(mpars.glc_ext)
        
        % Show progress
        fprintf('%3.2f %%  \t [%6.2f\t->\t%6.2f ] min\n', k/count_max*100, toc/60,  toc/60/k*(count_max-k) );
        
        % changed initial concentration for simulation
        mpars.changed_initial = {
            'lac_ext'       33      0.8                 % [mM] lactate extern  
            'glc_ext'       32      mpars.glc_ext(k)    % [mM] glucose extern
            'glyglc'        17      250                 % [mM] glycogen equivalent
        }; 
        
        % Simulate the model with the given settings
        [t, c, v] = model(mpars);
        
        % Save concentrations and fluxes
        c_full(k, :, :) = c;
        v_full(k, :, :) = v;
    end
    
   % Save the data
   % mpars, condition, outfile, t, c_full, v_full
   save(out_file, 'mpars', 'condition', 'out_file', 'c_full', 'v_full', '-v7.3')
   
end
