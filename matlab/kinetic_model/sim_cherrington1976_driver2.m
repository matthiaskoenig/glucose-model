function [t,c,v,mpars] = sim_cherrington1976_driver2()
% SIM_SINGLE Simulation of the Cherrington1976 insulin and glucagon clamp
% experiments
%
%   Returns:
%       t:      vector of time points
%       c:      matrix of concentrations for the time points t
%       v:      matrix of fluxes for the time points t
%       mpars : parameter of simulation
%
%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2012 Matthias Koenig
%   date:   120222  -   v0.2

clear all
close all

% Iterative solution with given stepsize
t_start = 0;
t_step  = 5;
t_end   = 270;
t_data = t_start:t_step:t_end;

% Settings for the calculation of GU which is constant in simulation
% necessary for calculating the changes in blood glucose
%gu = 8.37;     % [µmol/kg/min]  whole body glucose utilization
gu = 9;     % [µmol/kg/min]  whole body glucose utilization

bw = 75;        % [kg] body weight
bv = 5;         % [l] blood volume
f_gpgu = 21.5/1.5;  % Conversion factor from Cherrington1976 (which relates the 
                % changes in HGP and HGU to actual changes in glucose)

% switch of insulin and glucagon profile
% preinfusion from 80 to 135 min
% infusion between 135 and 200 min
% takes ~20 mins for hormones to reach basal levels, with basal
% levels being around 30% of initial values
insulin_f       = hormone_f('insulin', 'normal');          
glucagon_f      = hormone_f('glucagon', 'normal');

base_f = 0.3;
base_t = 20;
inf_t_start = 135;
inf_t_end   = 200;

ins_max = insulin_f(4.5);
ins_min = base_f * ins_max;
glu_max = glucagon_f(4.5);
glu_min = base_f * glu_max;

ins_max = 100;
glu_max = 80;

glc_start = 5.7;    % [mM]

% Performed simulations
simulations = { 'saline'
                'somatostatin' 
                'insulin_replacement'
                'glucagon_replacement'
                'somatostatin_replacement'
              };

        
% Simulation results
fdata = struct;
fdata_sx = struct;

% Perform simulations
for k_sim = 1:length(simulations)    
    sim = simulations{k_sim}
        
    % [A] Simulation with defined profile
    % Storage of simulation time courses
    % Initial concentrations for simulation
    c_init = pars_Sex2('mean');
    c_init(33) = 1.2;             % [mM] lactate extern
    c_init(17) = 250;             % [mM] glycogen equivalent    
    c_init(32) = glc_start;       % [mM] glucose extern
    data.glc   = glc_start;
    
    data.ins_sim = zeros(size(t_data));
    data.glu_sim = zeros(size(t_data));
    data.glc_sim = zeros(size(t_data));
    data.gu_sim  = zeros(size(t_data));
    data.gp_sim  = zeros(size(t_data));
    
    data.t_sim = [];
    data.hgp_sim = [];
    data.glycogen_sim = [];
    
    [f_gp, f_gu, f_glc] = sim_cherrington1976_gugp_f(sim);
    
    % Perform Simulation to steady state with clamped glycogen store
    [data.ins data.glu] = sim_cherrington1976_hormones(0, sim, base_t, ...
           inf_t_start, inf_t_end, ins_max, ins_min, glu_max, glu_min);
    [t,c,v,mpars] = sim_cherrington1976_single(0, 200, 10, c_init, data);
    c_init = c(end,:);
    gu = -v(end,1);
    
    % Perform all the single timesteps of the simulations
    for kt = 2:length(t_data)
        
       % get the current information for the integration
       t_instart = t_data(kt-1)
       t_inend = t_data(kt);
       t_instep = 1;          % stepsize of integration   
       
       % get the current hormone concentrations based on given profile
       [data.ins data.glu] = sim_cherrington1976_hormones(t_instart, sim, base_t, ...
           inf_t_start, inf_t_end, ins_max, ins_min, glu_max, glu_min);
       [t,c,v,mpars] = sim_cherrington1976_single(t_instart, t_inend, t_instep, c_init, data);
       
       % store the information for the simulated values
       % depending on the simulation some are given and others are
       % calculated
       data.t_sim = [data.t_sim t'];
       data.hgp_sim = [data.hgp_sim -v(:,1)'];
       data.glycogen_sim = [data.glycogen_sim c(:,17)'];
       
       data.ins_sim(kt-1) = data.ins;
       data.glu_sim(kt-1) = data.glu;
       data.glc_sim(kt-1) = data.glc;
       data.gu_sim(kt-1)  = gu;
       data.gp_sim(kt-1)  = -v(end,1);
       
       % Update the initial concentration for next step
       c_init = c(end,:);
       
       % Update glucose concentration for next step       
       % Delta glc without time delay
       delta_glc = (-data.gu_sim(kt-1) + data.gp_sim(kt-1) )*10E-3 * t_step * bw/bv/f_gpgu;
       data.glc = data.glc + delta_glc;
       c_init(32) = data.glc;  
    end
    % store the data for the simulation
    fdata = setfield(fdata, sim, data);
    
    
    % [B] Simulation with relative profile changes from experimentell data
    % Storage of simulation with exp data time courses
    c_init = pars_Sex2('mean');
    c_init(33) = 1.2;             % [mM] lactate extern
    c_init(17) = 250;             % [mM] glycogen equivalent    
    c_init(32) = glc_start;       % [mM] glucose extern
    data = struct;
    data.glc   = glc_start;
    
    data.ins_sx = zeros(size(t_data));
    data.glu_sx = zeros(size(t_data));
    data.glc_sx = zeros(size(t_data));
    data.gu_sx  = zeros(size(t_data));
    data.gp_sx  = zeros(size(t_data));
    
    data.t_sx = [];
    data.hgp_sx = [];
    data.glycogen_sx = [];
    [f_gp, f_gu, f_glc] = sim_cherrington1976_gugp_f(sim);
    
    % Perform all the single timesteps of the simulations
    for kt = 2:length(t_data)
        
       % get the current information for the integration
       t_instart = t_data(kt-1)
       t_inend = t_data(kt);
       t_instep = 1;          % stepsize of integration   
       
       % get the current hormone concentrations based on given profile
       [data.ins data.glu data.gu] = sim_cherrington1976_hormones_sx(t_instart, sim, ...
                                                    ins_max, glu_max, gu);
       
       [t,c,v,mpars] = sim_cherrington1976_single(t_instart, t_inend, t_instep, c_init, data);
       
       % store the information for the simulated values
       % depending on the simulation some are given and others are
       % calculated
       data.t_sx = [data.t_sx t'];
       data.hgp_sx = [data.hgp_sx -v(:,1)'];
       data.glycogen_sx = [data.glycogen_sx c(:,17)'];
       
       data.ins_sx(kt-1) = data.ins;
       data.glu_sx(kt-1) = data.glu;
       data.glc_sx(kt-1) = data.glc;
       data.gu_sx(kt-1)  = data.gu;
       data.gp_sx(kt-1)  = -v(end,1);
       
       % Update the initial concentration for next step
       c_init = c(end,:);
       
       % Update glucose concentration for next step       
       % Delta glc without time delay
       delta_glc = (-data.gu_sx(kt-1) + data.gp_sx(kt-1) )*10E-3 * t_step * bw/bv/f_gpgu;

       % Update the blood glucose concentration
       data.glc = data.glc + delta_glc;
       c_init(32) = data.glc;  
    end
    
    % store the data for the simulation
    fdata_sx = setfield(fdata_sx, sim, data);
    
end

% store the complete data
file = 'Cherrington1976_v2.mat' 
save(file, 'fdata', 'fdata_sx', 'ins_max', 'ins_min', 'glu_max', 'glu_min', 't_data', ...
           'inf_t_start', 'inf_t_end');

% plot the data
sim_cherrington1976_figs(file);

end
         
          

