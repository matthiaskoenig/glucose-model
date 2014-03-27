function [] = sim_simple_zonation()
%%SIMPLE_ZONATTION Simulation of zonated hepatocyte layout.
% Generates the outer blood compartments and the blood flow model from pp
% to pv hepatocytes.
%
% The internal hepatocyte reaction to the external changes are based on ODE
% integration. 
% Stepwise iteration between fluxes between compartments and integration of
% the reaction to the changed conditions within the sinosoid.
%   
%
%   author: Matthias Koenig
%   date:   110410
%   version:    0.1


% Simple layout of identical number of cell and blood compartments
pars.N_cells = 20;                  % number of cells in the sinosoid
pars.k_layout = 1;                  % layout parameter relating blood to hepatocytes
pars.N_blood = pars.k_layout * pars.N_cells;   % Number of blood compartments

% blood compartment parameters
pars.L_sin  = 1E-3;                     % [m]       Length sinosoid
pars.d_hep  = pars.L_sin/pars.N_cells;  % [m]   ~50µm
pars.d_sin = 5.7E-6;                    % [m]       diameter of sinosoid
pars.n_sin = 5.23E9;                    % Number of sinosoids
pars.V_blood = pars.n_sin * pars.d_hep * pars.d_sin^2;   % [m^3] Volume of blood compartment

% blood flux parameters (flux rate based on estimated time for sonosoid
% passage
pars.v_blood = 180E-6;                   % [m/s]  blood flux
pars.t_pas   = pars.d_hep/pars.v_blood;  % [s] time for passing one compartment

% timesteps for integration
pars.t_start = 0;                           % [s]   start of simulation
pars.t_end  =  2*pars.t_pas*pars.N_cells;   % [s]   end of simulation
pars.t_step  = pars.t_pas;

pars

% Initial blood glucose and lactate concentrations
init.glc_ext = 9 * ones(pars.N_blood,1);
init.glc_ext(1,1) = 9;    %[mM]
init.lac_ext = 5 * ones(pars.N_blood,1);
init.lac_ext(1,1) = 5;     %[mM]

% Actual blood glucose and lactate concentrations
%disp('initial glucose and lactate concentrations')
glc_ext = init.glc_ext;
lac_ext = init.lac_ext;

% Definition of the hormones
init.ins = initial_hormone('insulin', init.glc_ext(1) );
init.glu = initial_hormone('glucagon', init.glc_ext(1));
init.epi = initial_hormone('epinephrine', init.glc_ext(1));

% Integrate the ODE system with the given distribution
t_all = pars.t_start:pars.t_step:pars.t_end;
glc_ext_all = zeros(pars.N_blood, length(t_all));
lac_ext_all = zeros(pars.N_blood, length(t_all));
stoichiometry = model_stoichiometry();
x_all = zeros(size(stoichiometry,1), pars.N_blood, length(t_all));
v_all = zeros(size(stoichiometry,2), pars.N_blood, length(t_all));

glc_ext_all(:,1) = glc_ext;
lac_ext_all(:,1) = lac_ext;

% zonated hepatocyte metabolism
zonated = true;
zonated_c = linspace(-0.2, 0.7, pars.N_cells); 

count = 0;
count_max = (length(t_all))* pars.N_cells;
for t_ind = 2:length(t_all)
    
    for k=1:pars.N_cells
        count/count_max
        count = count +1;
        % Set the hormone concentration for the given hepatocyte (simple if the
        % external compartments are identical to the number of the hepatocytes.
        % Otherwise the hormone concentrations have to be meaned.
        hormones.insulin = init.ins(k);
        hormones.glucagon = init.glu(k);
        hormones.epinephrine = init.epi(k);

        % Initial concentrations for the simulations (this values have to be
        % the end values of the privios integration step)
        S_start = pars_Sex2('mean');   % start concentrations for the given time and hepatocyte
        if zonated == false
            V_max = pars_Vmax_opt();       % Vmax of hepatocyte for the given hepatocyte in sinosoid
        else
            c = zonated_c(k);
            V_max = pars_Vmax_opt(c);
        end
        
        t_final = 100;
        [tsim,csim,vsim,mparssim] = sim_single_zonation(t_final, S_start, V_max, hormones, lac_ext(k), glc_ext(k));
        v_ss = vsim(end, :);
        c_ss = csim(end, :);
        v_all(:, k, t_ind) = v_ss;
        x_all(:, k, t_ind) = c_ss;

        % Calculate the changes in the external compartments based on the ODE
        % of the hepatocytes
        lac_ext(k) = lac_ext(k) - v_ss(28)*1E-6/pars.N_cells* 80/60 *pars.t_step /pars.V_blood;
        glc_ext(k) = glc_ext(k) - v_ss(1)*1E-6/pars.N_cells * 80/60 *pars.t_step /pars.V_blood;
    end

    % Move the blood compartments further
    lac_ext(2:end) = lac_ext(1:end-1);
    lac_ext(1) = init.lac_ext(1);
    glc_ext(2:end) = glc_ext(1:end-1);
    glc_ext(1) = init.glc_ext(1);
    
    % Store the results (only caculate fluxes for the last, but don't move)
    glc_ext_all(:, t_ind) = glc_ext;
    lac_ext_all(:, t_ind) = lac_ext;
    
end




% store the solution of the ODE integration in appropriate vectors
save('test.mat', 't_all', 'glc_ext_all', 'lac_ext_all', 'x_all', 'v_all', 'pars', 'init', '-v7.3');

% Display the simulation result
fig_simple_zonation(t_all, glc_ext_all, lac_ext_all, x_all, v_all, pars, init);


    function h = initial_hormone(hormone, glc)
    %INITIAL_HORMONE calculates the given initial hormone concentration
    %for the blood compartments. the concentration is only based on the
    %given hormone and the clearance over the sinosoid. All hepatocytes
    %are assumed to have the same amount of receptors and the clearance is
    %identical for all the hepatocytes.

        % number of compartments
        N = pars.N_blood;   
        
        % definition of clearance parameters
        h_type = 'linear';      % type of the hormone profile (linear or exp)
        %h_type = 'exp';
        
        % calculate the value in the blood compartments
        h = zeros(N,1);
        % inital value for first compartment
        switch hormone
            case 'insulin'
                hf = hormone_f('insulin', 'normal');
                clearance = 0.5;
            case 'glucagon'
                hf = hormone_f('glucagon', 'normal');
                clearance = 0.5;
            case 'epinephrine'
                hf = hormone_f('epinephrine', 'normal');
                clearance = 0.5;
        end
        h1 = hf(glc);
        hend = h1 * clearance;
        % glucagon can only fall to basal levels, otherwise problems
        if strcmp(hormone, 'glucagon')
           hend = max(hend, 37.9);
        end
        
        
        
        % values for all the compartments depending on type
        m = (h1-hend)/(N-1);
        switch h_type
            case 'linear'
                h = h1*ones(N,1) - m * (0:1:N-1)';
            case 'exp'
                h = [];
                disp('not implemented');
                return
        end
    end

end

