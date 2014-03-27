function [ ] = sim_glucose_insulin_treatment(out_folder, dia_strength)
%SIM_GLUCOSE_INSULIN_TREATMENT Simulate insulin treatment regimes
% Analyises of model under varing insulin treatment regimes (linear and
% constant addition.
%
% Glycogen and external glucose concentrations are set to different values
% and the response of the system after a certain time is store.
% The insulin and gamma curves are changed by the treatments (see function
% defintions at the end of the file).
%  Constant addition and linear addition treatments are tested.
% To visualize the results use glucose_glycogen_dependency_analysis.
%
% Usage:
% - [1] select out_folder for simulation (in this folder results are
%       stored)
% - [2] select glucose range glycogen range and timespan for simulation 
%       (defines the resolution of the simulation)
% - [3] select type of treatment  

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110225  -   v0.1

fprintf('\n*********************************************************\n');
fprintf('     Glucose-Glycogen dependency for insulin treatments      ');
fprintf('\n*********************************************************\n');

%% Settings
if nargin == 0
    out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110225_data/glucose_insulin_treatment'
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


% Construct glycogen vector
log_tmp = logspace(0, 1, 8)-1;
glycogen_vec =  [log_tmp linspace(10, 490, 20)   500-log_tmp(end:-1:1)];

treatment_types = {'normal', 'no_treatment', 'constant_addition', 'linear_addition'}
constant_factors = linspace(0, 600, 5);              % [pmol/l] insulin : constant addition of insulin over full glucose range
linear_factors   = linspace(0, 1000/16, 5);           % [(pmol/l)/mM] : slope of linear treatment in insulin(glc) plot 
constant_factors = constant_factors(2:end);          % 0 case is untreated diabetes
linear_factors = linear_factors(2:end);              % 0 case is untreated diabetes

mpars.glc_ext    = 2:0.05:20;              % [mM] variance in glucose
%mpars.glycogen   = 0:25:500;             % [mM] variance in glycogen
mpars.glycogen   = glycogen_vec;
mpars.lactate    = 0.8;                   % [mM] lactate
mpars.t_end      = 200;                   % [min] integration end time in 
mpars.t_stepsize = 100;                   % [min] stepsize of calculated t values

% Debug information
mpars.debug         = false;

% Basic parameters
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = pars_Sex2('mean');                % initial concentrations
mpars.Vmax          = pars_Vmax_opt();                  % Vmax values
mpars.stoichiometry = model_stoichiometry();            % stoichiometry

% Gamma function directly
mpars.gamma = [];

% Additional constant concentrations 
mpars.const_in_simulation = {
        'glyglc'        17         
};

%% Simulation
for treatment_index=1:length(treatment_types)
    fprintf('\n*********************************************************\n');
    % Current treatment
    treatment_type = treatment_types{treatment_index}
    
    % Parameters for the treatment
    switch treatment_type
       case 'normal'
            % [0] normal case for comparison (no diabetes)
            t_num = 1;
       case 'no_treatment'
            % [0] untreated diabetes type for comparison (diabetes)
            t_num = 1;
        case 'constant_addition'
            % [1] Constant addition of insulin
            t_num = length(constant_factors);
        case 'linear_addition'
            % [2] Linear addition of insulin
            t_num = length(linear_factors);
    end

    % Simulate for all conditions in the selected treatment
    for t_index=1:t_num

        % Generate out_file depending on the treatment and t_index
        mpars.out_file  = strcat(out_folder, '/', treatment_type, '_', num2str(t_index));
        
        % Matrices of fluxes and concentrations
        [c_num, v_num] = size(mpars.stoichiometry);
        c_full = zeros(length(mpars.glc_ext), length(mpars.glycogen), length(mpars.t_span), c_num);
        v_full = zeros(length(mpars.glc_ext), length(mpars.glycogen), length(mpars.t_span), v_num);

        % Select the appropriate hormonal response function
        switch treatment_type
            case 'normal'        
                insulin     = hormone_f('insulin', 'normal');
                glucagon    = hormone_f('glucagon', 'normal');
                epinephrine = hormone_f('epinephrine', 'normal');
                
            case 'no_treatment'
                switch mpars.dia_strength
                    case 'T2DM'
                        insulin  = hormone_f('insulin', 'T2DM');
                        glucagon = hormone_f('glucagon', 'T2DM');
                        epinephrine = hormone_f('epinephrine', 'T2DM');
                    case 'extreme_T2DM'
                        insulin  = hormone_f('insulin', 'extreme_T2DM');
                        glucagon = hormone_f('glucagon', 'extreme_T2DM');
                        epinephrine = hormone_f('epinephrine', 'extreme_T2DM');
                    case 'no_epi_extreme_T2DM'
                        insulin  = hormone_f('insulin', 'extreme_T2DM');
                        glucagon = hormone_f('glucagon', 'extreme_T2DM');
                        epinephrine = [];
                    case 'sleep_epi_extreme_T2DM'
                        insulin  = hormone_f('insulin', 'extreme_T2DM');
                        glucagon = hormone_f('glucagon', 'extreme_T2DM');
                        epinephrine = hormone_f('epinephrine', 'sleep');
                    otherwise
                        warning('Unknown dia_strength')
                end
  
            case 'constant_addition'
                constant_factor = constant_factors(t_index);
                insulin  = treatment_insulin_constant_f(constant_factor, mpars.dia_strength)
                switch mpars.dia_strength
                    case 'T2DM'
                        glucagon = hormone_f('glucagon', 'T2DM');
                        epinephrine = hormone_f('epinephrine', 'T2DM');
                    case 'extreme_T2DM'
                        glucagon = hormone_f('glucagon', 'T2DM');
                        epinephrine = hormone_f('epinephrine', 'T2DM');
                    case 'no_epi_extreme_T2DM'
                        glucagon = hormone_f('glucagon', 'T2DM');
                        epinephrine = [];
                    case 'sleep_epi_extreme_T2DM'
                        glucagon = hormone_f('glucagon', 'T2DM');
                        epinephrine = hormone_f('epinephrine', 'sleep');
                    otherwise
                        warning('Unknown dia_strength')
                end    
                mpars.constant_factor = constant_factor;
                
            case 'linear_addition'
                linear_factor = linear_factors(t_index);
                insulin  = treatment_insulin_linear_f(linear_factor, mpars.dia_strength);
                switch mpars.dia_strength
                    case 'T2DM'
                        glucagon = hormone_f('glucagon', 'T2DM');
                        epinephrine = hormone_f('epinephrine', 'T2DM');
                    case 'extreme_T2DM'
                        glucagon = hormone_f('glucagon', 'T2DM');
                        epinephrine = hormone_f('epinephrine', 'T2DM');
                    case 'no_epi_extreme_T2DM'
                        glucagon = hormone_f('glucagon', 'T2DM');
                        epinephrine = [];
                    case 'sleep_epi_extreme_T2DM'
                        glucagon = hormone_f('glucagon', 'T2DM');
                        epinephrine = hormone_f('epinephrine', 'sleep');
                    otherwise
                        warning('Unknown dia_strength')
                end    
                mpars.linear_factor = linear_factor;
        end
        mpars.treatment_type = treatment_type
        mpars.insulin     = insulin;
        mpars.glucagon    = glucagon;
        mpars.epinephrine = epinephrine;

        % Simulate for all glucose and glycogen concentrations
        count = 1;
        count_max = length(mpars.glc_ext)*length(mpars.glycogen);
        tic
        for k=1:length(mpars.glc_ext)
            for q = 1:length(mpars.glycogen)

                % information about the loops
                if (mod(count, 20) == 1)
                    fprintf('%3.2f %%  \t [%6.2f\t->\t%6.2f ] min\n', count/count_max*100, toc/60,  toc/60/count*(count_max-count) );
                end
                count = count + 1; 

                % changed initial concentration for simulation
                mpars.changed_initial = {
                    'lac_ext'       33      mpars.lactate       % [mM] lactate extern  
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
end

end