function [ ] = sim_glucose_gamma_dependency(out_folder)
%SIM_GLUCOSE_GAMMA_DEPENDENCY Simulate varying glycogen and glucose.
%   Glucose and gamma are varied for some glycogen concentrations.
%
%   The cases normal, diabetes, insulin_restored and glucagon_restored are
%   calculated.
%   See also SIM_GLUCOSE, SIM_GLUCOSE_LACTATE

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110225  -   v0.1


%%  Settings
if nargin == 0
    out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110225_data/glucose_gamma_dependency'
end
save(strcat(out_folder, '/tmp'))     % test if possible to save to folder

mpars.glc_ext     = 2:0.05:20;              % variance in glucose
mpars.gamma_values = 0:0.02:1;            % variance in gamma

mpars.glycogen    = 50:200:450;              % variance in glycogen
mpars.t_end       = 200;                    % integration end time in [min]
mpars.t_stepsize  = 100;                     % stepsize of calculated t values

% Debug information
mpars.debug         = false;

% Basic parameters
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = pars_Sex2('mean');                % initial concentrations
mpars.Vmax = pars_Vmax_opt();                           % Vmax values
mpars.stoichiometry = model_stoichiometry();            % stoichiometry

% Hormonal control (gamma function is externally given)
mpars.insulin       = [];
mpars.glucagon      = [];
mpars.epinephrine   = [];

% Gamma function directly (! if function is specified insulin, glucagon and
% epinephrine are not used ! -> overwrites the hormones)
mpars.gamma = @gamma_const;

% Concentration settings for simulation
% additional constant concentrations
mpars.const_in_simulation = {
        'glyglc'        17     
};

%% Defining simulation conditions and files
% for the conditions defined here calculate the data and store it in the
% corresponding files
mpars.out_file  = strcat(out_folder, '/glucose_gamma');

%% Simulation
% Simulate for all conditions
% Matrices of fluxes and concentrations
[c_num, v_num] = size(mpars.stoichiometry);
c_full = zeros(length(mpars.glc_ext), length(mpars.gamma), length(mpars.glycogen),  length(mpars.t_span), c_num);
v_full = zeros(length(mpars.glc_ext), length(mpars.gamma), length(mpars.glycogen),  length(mpars.t_span), v_num);

for glycogen_ind=1:length(mpars.glycogen)
    
    % Simulate for all glucose and glycogen concentrations
    fprintf('\n'), mpars, fprintf('\n')
    count = 1; 
    tic;
    count_max = length(mpars.glc_ext)*length(mpars.gamma_values);
    for k=1:length(mpars.glc_ext)
        for q = 1:length(mpars.gamma_values)
            gamma_value = mpars.gamma_values(q);

            % information about the loops
            if (mod(count, 20) == 1)
                fprintf('%3.2f %%  \t [%6.2f\t->\t%6.2f ] min\n', count/count_max*100, toc/60,  toc/60/count*(count_max-count) );
            end
            count = count + 1; 

            % changed initial concentration for simulation
            mpars.changed_initial = {
                'lac_ext'       33      0.8                 % [mM] lactate extern  
                'glc_ext'       32      mpars.glc_ext(k)    % [mM] glucose extern
                'glyglc'        17      mpars.glycogen(glycogen_ind)   % [mM] glycogen equivalent
            }; 

            % Simulate the model with the given settings
            [t, c, v] = model(mpars);

            % Save concentrations and fluxes
            c_full(k, q, glycogen_ind, :, :) = c;
            v_full(k, q, glycogen_ind, :, :) = v;
        end
    end

   % Save the data
   v_full = 12.5 * v_full;
    save(mpars.out_file, 'mpars', 'c_full', 'v_full', '-v7.3')
end

%% linear addition treatment
function g = gamma_const(glucose_ext)
    % returns the constant gamma value
    g = gamma_value;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end