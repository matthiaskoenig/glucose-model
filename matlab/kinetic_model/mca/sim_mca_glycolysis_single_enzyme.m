function [mca_c, mca_v] = sim_mca_glycolysis_single_enzyme(glc_ext, out_file)
% Change single enzyme Vmax in steps and save changes insteady state
% concentrations and fluxes for given constant external glucose
% concentration
% Used for simulation of effects of glucose-6-phosphatase deficiency.
%
%   author : Matthias Koenig
%   date : 110810

% folder for data storage
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110824_data/mca';
save(strcat(out_folder, '/tmp'))     % test if possible to save to folder

mpars.debug         = false;        % debug information

mpars.glc_ext = glc_ext;    
mpars.gamma = [];                   % use of standard gamma
        

% Basic parameters
mpars.t_end      = 200;                                 % integration end time in [min]
mpars.t_stepsize = 5;                                   % stepsize of calculated t values
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;

mpars.S_start       = pars_Sex2('mean');                % initial concentrations
mpars.Vmax = pars_Vmax_opt();                           % Vmax values
mpars.stoichiometry = model_stoichiometry();            % stoichiometry
mpars.condition = 'normal'
mpars.dia_strength = '';

% Variance in the Vmax values
% Select index of enzyme to vary
mpars.vmax_enzyme = 3;          % glucose-6 phosphatase
%mpars.vmax_enzyme = 8;         % glycogen synthase

mpars.vmax_changes = [1 linspace(1,0,11)];      % changes in Vmax
mpars.vmax_N = length(mpars.vmax_changes);
Vmax_data = repmat(mpars.Vmax, 1 ,mpars.vmax_N);
for k=1:mpars.vmax_N
   Vmax_data(mpars.vmax_enzyme, k) =  mpars.vmax_changes(k)* Vmax_data(mpars.vmax_enzyme, k); 
end

% Steady state and MCA storage
[c_num, v_num] = size(mpars.stoichiometry);
ss_c = zeros(c_num, mpars.vmax_N);      % steady state concentrations (first column reference)
ss_v= zeros(v_num, mpars.vmax_N);       % steady state fluxes (first column reference)
mca_c = zeros(c_num, mpars.vmax_N-1);         % mca concentrations
mca_v = zeros(v_num, mpars.vmax_N-1);         % mca fluxes

% Select the appropriate hormonal response function for simulation
[mpars.insulin, mpars.glucagon, mpars.epinephrine] = ...
                     hormone_response(mpars.condition, mpars.dia_strength);

%% Simulation
for v_index=1:mpars.vmax_N
    
    %counter
    v_index/mpars.vmax_N               
    
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

% Calculate the MCA coefficients
for k = 1:mpars.vmax_N-1
   mca_c(:,k) = ss_c(:,k+1)./ss_c(:,1); % / vmax_effect;
   mca_v(:,k) = ss_v(:,k+1)./ss_v(:,1); % / vmax_effect;
end

% Save the data
if nargin == 1
    mpars.out_file  = strcat(out_folder, '/mca_', num2str(mpars.glc_ext));
else
    mpars.out_file = out_file
end
save(mpars.out_file, 'mpars', 'mca_c', 'mca_v', '-v7.3')
