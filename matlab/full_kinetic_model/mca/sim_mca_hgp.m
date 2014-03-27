function [R_hgp, R_glu, R_gly] = sim_mca_hgp(glc_ext, glycogen)
% MCA of the Control quantities in the system

% X1 = HGP/HGU = v(1) = glut transporter
% X2 = gluconeogenesis/glycolysis = v() = GPI
% X3 = glycogenolysis/gluconeogenesis = v() = GPI

% Calculation of the response coefficients
% R^Xi_p = (ln(X2) - ln(X1) ) / (ln(p2) - ln(p1))

% Calculate for various combinations of glucose and glycogen

% calculate the ref
disp('***Calculate the Response Coefficient(glc, glycogen) ***');
fprintf('glc_ext = %fmM \t glycogen = %fmM')
mpars.glc_ext = glc_ext;
mpars.glycogen = glycogen;

% Define gamma function directly (! hormones overwritten)
mpars.gamma = [];
mpars.const_in_simulation = {};
mpars.debug      = false;
mpars.t_end      = 400;                                 % integration end time in [min]
mpars.t_stepsize = 20;                                   % stepsize of calculated t values
mpars.t_span     = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = pars_Sex2('mean');                % initial concentrations
mpars.Vmax = pars_Vmax_opt();                           % Vmax values
mpars.stoichiometry = model_stoichiometry();            % stoichiometry
mpars.condition = 'normal'
mpars.dia_strength = '';

% Storage of Steady state values
[c_num, v_num] = size(mpars.stoichiometry);

% Variance in the Vmax values
vmax_effect = 1.01;

% Storage of the Results
R_hgp = zeros(v_num,1);
R_glu = zeros(v_num,1);
R_gly = zeros(v_num,1);

% Create the Variance in Vmax
Vmax_data = repmat(mpars.Vmax, 1 ,v_num + 1);
for k=1:v_num
   Vmax_data(k, k+1) = vmax_effect * Vmax_data(k, k+1); 
end

% Steady state and MCA storage
ss_c = zeros(c_num, v_num + 1);      % steady state concentrations (first column reference)
ss_v = zeros(v_num, v_num + 1);      % steady state fluxes (first column reference)
%mca_c = zeros(c_num, v_num);         % mca concentrations
%mca_v = zeros(v_num, v_num);         % mca fluxes

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
            'glyglc'        17      mpars.glycogen      % [mM] glycogen equivalent
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

% Calculate the MCA coefficients new
%for k = 1:v_num
%   mca_c(:,k) = (log(ss_c(:,k+1)) - log(ss_c(:,1)))/log(vmax_effect); % / vmax_effect;
%   mca_v(:,k) = (log(ss_v(:,k+1)) - log(ss_v(:,1)))/log(vmax_effect); % / vmax_effect;
%end
for k = 1:v_num
    %R_hgp(k,1)  = (log(ss_v(1,k+1)) - log(ss_v(1,1)))/log(vmax_effect); 
    %R_glu(k,1)  = (log(ss_v(4,k+1)) - log(ss_v(4,1)))/log(vmax_effect); 
    %R_gly(k,1)  = (log(-ss_v(5,k+1)) - log(-ss_v(5,1)))/log(vmax_effect); 
    tmp  = (ss_v(1,k+1) - ss_v(1,1))/ss_v(1,1); 
    R_hgp(k,1)  = tmp/(vmax_effect-1); 
    
    tmp =  (ss_v(4,k+1) - ss_v(4,1))/ss_v(4,1); 
    R_glu(k,1)  = tmp/(vmax_effect-1); 
    
    tmp = (ss_v(5,k+1) - ss_v(5,1))/ss_v(5,1); 
    R_gly(k,1)  = tmp/(vmax_effect-1);
end




