function [mca_c, mca_v] = sim_mca_glycolysis(glc_ext, out_folder)
% MCA Metabolic control analysis of glycolysis network
% Calculates the metabolic control coefficients for variations in Vmax.
%
%   author : Matthias Koenig
%   date   : 120311
disp('Calculate MCA - sim_mca_glycolysis');

%% Settings
if nargin==1
    out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110824_data/mca';
end
out_folder
save(strcat(out_folder, '/tmp'))     % test if possible to save to folder


mpars.glc_ext = glc_ext;

% Define gamma function directly (! hormones overwritten)
mpars.gamma = [];

% Constant concentration settings for simulation
mpars.const_in_simulation = {};

% Debug information
mpars.debug         = false;

% Basic parameters
mpars.t_end      = 200;                                 % integration end time in [min]
mpars.t_stepsize = 5;                                   % stepsize of calculated t values
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;

mpars.S_start       = pars_Sex2('mean');                % initial concentrations
mpars.Vmax = pars_Vmax_opt();                           % Vmax values
mpars.stoichiometry = model_stoichiometry();            % stoichiometry
mpars.condition = 'normal'
mpars.dia_strength = '';

% Storage of Steady state values
[c_num, v_num] = size(mpars.stoichiometry);

% Variance in the Vmax values
vmax_effect = 1.001;

Vmax_data = repmat(mpars.Vmax, 1 ,v_num + 1);
for k=1:v_num
   Vmax_data(k, k+1) = vmax_effect * Vmax_data(k, k+1); 
end

% Steady state and MCA storage
ss_c = zeros(c_num, v_num + 1);      % steady state concentrations (first column reference)
ss_v= zeros(v_num, v_num + 1);      % steady state fluxes (first column reference)
mca_c = zeros(c_num, v_num);         % mca concentrations
mca_v = zeros(v_num, v_num);         % mca fluxes

% Select the appropriate hormonal response function for simulation
[mpars.insulin, mpars.glucagon, mpars.epinephrine] = ...
                                    hormone_response(mpars.condition, mpars.dia_strength);

%% Simulation
for v_index=1:v_num + 1
    
    %counter
    v_index/(v_num + 1)                 
    
    % changed initial concentration for simulation
        mpars.changed_initial = {
            'lac_ext'       33      0.8                 % [mM] lactate extern  
            'glc_ext'       32      mpars.glc_ext       % [mM] glucose extern
            'glyglc'        17      250                 % [mM] glycogen equivalent
        }; 
        
        % Change the Vmax for the simulation
        mpars.Vmax = Vmax_data(:, v_index);
    
        % Simulation to steady state with constant glycogen 
        mpars.const_in_simulation = {'glyglc'        17};
        [t, c, v] = model(mpars);

        % correct the data to µmol/min/kg for the fluxes
        v = 12.5 * v;

        % Store steady state concentrations and fluxes
        ss_c(:, v_index) = c(end,:);
        ss_v(:, v_index) = v(end,:);   
end

% Calculate the MCA coefficients old
for k = 1:v_num
   mca_c(:,k) = ss_c(:,k+1)./ss_c(:,1); % / vmax_effect;
   mca_v(:,k) = ss_v(:,k+1)./ss_v(:,1); % / vmax_effect;
end

% Calculate the MCA coefficients new
for k = 1:v_num
   mca_c(:,k) = (log(ss_c(:,k+1)) - log(ss_c(:,1)))/log(vmax_effect); % / vmax_effect;
   mca_v(:,k) = (log(ss_v(:,k+1)) - log(ss_v(:,1)))/log(vmax_effect); % / vmax_effect;
end



% Save the data
mpars.out_file  = strcat(out_folder, '/mca_', num2str(mpars.glc_ext));
save(mpars.out_file, 'mpars', 'mca_c', 'mca_v', '-v7.3')
