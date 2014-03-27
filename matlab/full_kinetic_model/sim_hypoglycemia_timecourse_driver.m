function [] = sim_hypoglycemia_timecourse_driver(gu_addition, add_interval)
% SIM_SINGLE Simulation of hypoglycemic events as a consequence of changes
% in glucose utilization
%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2012 Matthias Koenig
%   date:   120504  -   v0.1
% Set point of glucose at the beginning

sim.glc_start = 4;          % [mM]
if (nargin == 0)
    sim.gu_add = 5;             % [µmol/kg/min] additional GU 
    sim.t_add_interval = 30;    % [min] interval of additional GU
else
   sim.gu_add = gu_addition;
   sim.t_add_interval = add_interval;
end

% Iterative solution with given stepsize
t_start = 0;
t_step  = 2;
t_end   = 250;
t_data = t_start:t_step:t_end;

% Simple model for blood glucose changes depending on HGP and HGU
bw = 75;        % [kg] body weight
bv = 5;         % [l] blood volume
f_gpgu = 21.5/1.5;  % Conversion factor from Cherrington1976 (which relates the 
                    % changes in HGP and HGU to actual changes in glucose)
sim.t_add_start = 60;
sim.t_add_end   = sim.t_add_start + sim.t_add_interval;

% Initial concentrations for all simulations
c_init = pars_Sex2('mean');
c_init(33) = 1.2;             % [mM] lactate extern
c_init(17) = 200;             % [mM] glycogen equivalent    
c_init(32) = sim.glc_start;       % [mM] glucose extern

% Conditions for the simulations (different simulated cases)
conditions = {  'normal'
                'diabetes'
                'insulin_restored'
                'glucagon_restored'
                'linear_insulin_1'
                'linear_insulin_2'
                'linear_insulin_3'
                'linear_insulin_4'
                'additive_insulin_1'
                'additive_insulin_2'
                'additive_insulin_3'
                'additive_insulin_4'
              };
          
conditions = {  'normal'
                'diabetes'
              };
          
% Simulation results
fdata = struct;

% Perform simulations
mpars.debug         = false;
flux_factor         = 12.5;     % all fluxes in mM/min/P - % factor for conversion to µmol/min/kg
for k_sim = 1:length(conditions)    
    
    % Hormone profile for current condition
    mpars.condition = conditions{k_sim};
    disp(mpars.condition);
    mpars.gamma = [];
    [mpars.insulin, mpars.glucagon, mpars.epinephrine] = ...
        get_hormone_f_from_condition(mpars.condition);

    % Steady state simulation to get the ss hgp and gu values for the
    % selected glucose concentration
    mpars.const_in_simulation = {'glyglc'        17};            
    mpars.changed_initial = {};
    mpars.t_start = 0;
    mpars.t_end  = 700;
    mpars.t_stepsize = 10;
    mpars.t_span        = mpars.t_start:mpars.t_stepsize:mpars.t_end;
    mpars.S_start       = c_init;
    mpars.Vmax          = pars_Vmax_opt();
    mpars.stoichiometry = model_stoichiometry();           % stoichiometry

    [t, c, v] = model(mpars);
    v = flux_factor * v;
    gu_base =  -v(end,1);
    gu_exercise = gu_base + sim.gu_add;
    mpars.S_start = c(end,:);
    
    % Initialize data structures for storage of results
    data.glc_sim = zeros(size(t_data));
    data.gu_sim  = zeros(size(t_data));
    data.gp_sim  = zeros(size(t_data));    
    data.t_sim = [];
    data.hgp_sim = [];
    
    data.tAll = [];
    data.cAll = [];
    data.vAll = [];
    
    % Perform all the single timesteps of the simulations
    glc = sim.glc_start;
    for kt = 2:length(t_data)
       
       % time interval for inner integration
       mpars.t_start = t_data(kt-1);
       mpars.t_end  = t_data(kt);
       mpars.t_stepsize = t_step;
       mpars.t_span     = mpars.t_start:mpars.t_stepsize:mpars.t_end;
       
       % update the glucose concentration for the interval
       mpars.S_start(32) = glc; 
       % settings for inner integration
       mpars.changed_initial = {};
       mpars.const_in_simulation = {};
    
       % inner integration
       [t, c, v] = model(mpars);
       v = flux_factor * v;
       
       % Save the endpoints of simulation
       data.tAll = [data.tAll t(end)];
       data.cAll = [data.cAll c(end,:)'];
       data.vAll = [data.vAll v(end,:)'];
       
       % store the results for the step
       data.t_sim = [data.t_sim t'];
       data.hgp_sim = [data.hgp_sim -v(:,1)'];
       
       % Switch to additional glucose usage at t=100;
       if ((t<sim.t_add_start) | (t>=sim.t_add_end))
           gu = gu_base;
       else
           gu = gu_exercise;
       end
       data.glc_sim(kt-1) = glc;
       data.gu_sim(kt-1)  = gu;
       data.gp_sim(kt-1)  = -v(end,1);
              
       % Update glucose concentration for next step
       delta_glc = (-data.gu_sim(kt-1) + data.gp_sim(kt-1) )*10E-3 * t_step * bw/bv/f_gpgu;
       glc = glc + delta_glc;
    end
    % store the data for the condition
    fdata = setfield(fdata, mpars.condition, data);    
end

% store the complete data
name = strcat('hypoglycemia_i', num2str(sim.t_add_interval), ...
                          '_a', num2str(sim.gu_add));
file = strcat('/home/mkoenig/Desktop/kinetic_model_results/simulations/120629_data/Hypoglycemia/', name);
save(file, 'fdata', 't_data', 'sim');

% plot the data
sim_hypoglycemia_timecourse_figs(file);
drawnow
end
         