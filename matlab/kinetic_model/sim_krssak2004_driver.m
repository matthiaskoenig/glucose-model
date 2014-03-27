function [t,c,v,mpars] = sim_krssak2004_driver()
% SIM_KRSSAK2004_DRIVER Simulation of the Krssak2004 mixed meal and clamp
% experiments
%
%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2012 Matthias Koenig
%   date:   120224  -   v0.1

clear all 
close all

% Iterative solution with given stepsize
t_start = -50;
t_step  = 5;
t_end   = 1000;
t_data = t_start:t_step:t_end;


insulin_f_normal       = hormone_f('insulin', 'normal');          
glucagon_f_normal      = hormone_f('glucagon', 'normal');
insulin_f_t2dm       = hormone_f('insulin', 'T2DM');          
glucagon_f_t2dm      = hormone_f('glucagon', 'T2DM');



sims = { 
        'mixed_meal_normal'
        'mixed_meal_t2dm'
        'clamp_normal'
        'clamp_t2dm'
        };
N_sims = length(sims);

% [A] Simulation with given glucose concentration
fdata = struct;     % [A] data
fdata_sx = struct;  % [B] data
for k_sim = 1:N_sims    
    % load data functions for the simulations
    sim = sims{k_sim}
    if (k_sim == 1 || k_sim == 3)
        insulin_f = insulin_f_normal
        glucagon_f = glucagon_f_normal
    elseif (k_sim == 2 || k_sim == 4)
         insulin_f = insulin_f_t2dm
        glucagon_f = glucagon_f_t2dm
    end
    
    dexp = sim_krssak2004_data(sim);
    
    glc      = lin_interp_value(t_data, dexp.glc_t, dexp.glc_data);
    insulin  = lin_interp_value(t_data, dexp.insulin_t, dexp.insulin_data);
    glucagon = lin_interp_value(t_data, dexp.glucagon_t, dexp.glucagon_data);
    
    % Storage of simulation time courses
    % Initial concentrations for simulation
    c_init = pars_Sex2('mean');
    c_init(33) = 1.2;             % [mM] lactate extern
    c_init(32) = glc(1);       % [mM] glucose extern
    data.glc   = glc(1);
    switch k_sim
        case 1
            c_init(17) = 275;
        case 2
            c_init(17) = 220;
        case 3
            c_init(17) = 220;
        case 4
            c_init(17) = 200;
    end
       
    data.glc_sim = glc;
    data.ins_sim = zeros(size(t_data));
    data.glu_sim = zeros(size(t_data));
    data.gp_sim  = zeros(size(t_data));
    data.glycogen_sim = zeros(size(t_data));
    
    %data.t_sim = [];
    %data.hgp_sim = [];
    %data.glycogen_sim = [];
        
    % Perform all the single timesteps of the simulations
    for kt = 2:length(t_data)
        
       % get the current information for the integration
       t_instart = t_data(kt-1)
       t_inend = t_data(kt);
       t_instep = 1;          % stepsize of integration   
       
       % get hormones based on dose response curves
       
       data.ins = insulin_f(data.glc);
       data.glu = glucagon_f(data.glc);
       [t,c,v,mpars] = sim_cherrington1976_single(t_instart, t_inend, t_instep, c_init, data);
       
       % store the information for the simulated values
       % depending on the simulation some are given and others are
       % calculated
       %data.t_sim = [data.t_sim t'];
       %data.hgp_sim = [data.hgp_sim -v(:,1)'];
       %data.glycogen_sim = [data.glycogen_sim c(:,17)'];
       data.ins_sim(kt-1) = data.ins;
       data.glu_sim(kt-1) = data.glu;
       data.glc_sim(kt-1) = data.glc;
       data.gp_sim(kt-1)  = -v(end,1);
       data.glycogen_sim(kt-1)  = c(end,17);
       
       % Update the initial concentration for next step
       c_init = c(end,:);
       
       % Update glucose concentration for next step       
       data.glc = glc(kt);
       c_init(32) = data.glc;  
    end
    % store the data for the simulation
    fdata = setfield(fdata, sim, data);
    
    
    % [B] Simulation with given glucose, insulin and glucagon
    % concentrations
    % Storage of simulation time courses
    % Initial concentrations for simulation
    c_init = pars_Sex2('mean');
    c_init(33) = 1.2;             % [mM] lactate extern
    switch k_sim
        case 1
            c_init(17) = 275;
        case 2
            c_init(17) = 220;
        case 3
            c_init(17) = 220;
        case 4
            c_init(17) = 200;
    end
    c_init(32) = glc(1);       % [mM] glucose extern
    data = struct;
    data.glc   = glc(1);
    
    data.glc_sx = glc;
    data.ins_sx = zeros(size(t_data));
    data.glu_sx = zeros(size(t_data));
    data.gp_sx  = zeros(size(t_data));
    data.glycogen_sx = zeros(size(t_data));
        
    % Perform all the single timesteps of the simulations
    for kt = 2:length(t_data)
        
       % get the current information for the integration
       t_instart = t_data(kt-1)
       t_inend = t_data(kt);
       t_instep = 1;          % stepsize of integration   
       
       % get hormones based on dose response curves
       % TODO: use the given hormone concentrations
       data.ins = insulin(kt-1);
       data.glu = glucagon(kt-1);
       if t_data(kt) > 480
           data.ins = insulin_f(data.glc);
           data.glu = glucagon_f(data.glc);
       end
       [t,c,v,mpars] = sim_cherrington1976_single(t_instart, t_inend, t_instep, c_init, data);
       
       % store the information for the simulated values
       % depending on the simulation some are given and others are
       % calculated
       data.ins_sx(kt-1) = data.ins;
       data.glu_sx(kt-1) = data.glu;
       data.glc_sx(kt-1) = data.glc;
       data.gp_sx(kt-1)  = -v(end,1);
       data.glycogen_sx(kt-1)  = c(end,17);
       
       % Update the initial concentration for next step
       c_init = c(end,:);
       
       % Update glucose concentration for next step       
       data.glc = glc(kt);
       c_init(32) = data.glc;  
    end
    % store the data for the simulation
    fdata_sx = setfield(fdata_sx, sim, data);   
end

% store the complete data
file = 'Krssak2004_v1.mat' 
save(file, 'fdata', 'fdata_sx', 't_data');

% plot the data [TODO]
sim_krssak2004_figs(file);
end
