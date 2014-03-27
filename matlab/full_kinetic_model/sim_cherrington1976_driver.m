function [t,c,v,mpars] = sim_cherrington1976_driver()
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
%   date:   120220  -   v0.1

clear all
close all

% Iterative solution of the clamp
t_data = 0:10:270;                  % stepsize for the iterative solution

simulations = { 'saline'
                'somatostatin' 
                'insulin_replacement'
                'glucagon_replacement'
                'somatostatin_replacement'
              };
          
% Perform simulations
for k_sim = 1:length(simulations)
    
    % Load the experimental data for the current simulation
    sim = simulations{k_sim}
    data = sim_cherrington1976_data(sim);

    % Initial concentrations for simulation
    c_init = pars_Sex2('mean');
    c_init(33) = 1.2;       % [mM] lactate extern
    c_init(32) = 4.0;       % [mM] glucose extern
    c_init(17) = 250;       % [mM] glycogen equivalent    
    
    % Storage of simulation time courses
    data.t_sim = [];
    data.ins_sim = [];
    data.glu_sim = [];
    data.glc_sim = [];
    data.hgp_sim = [];
    data.glycogen_sim = [];
        
    % Perform all the single timesteps of the simulations
    for kt = 2:length(t_data)
       
       % get the current information for the integration
       t_start = t_data(kt-1)
       t_end = t_data(kt);
       t_step = 1;          % stepsize of integration       
       
       [t,c,v,mpars] = sim_cherrington1976_single(t_start, t_end, t_step, c_init, data);
       
       % store the information for the simulated values
       % depending on the simulation some are given and others are
       % calculated
       
       data.t_sim = [data.t_sim t'];
       
       for i=1:numel(t)
           data.ins_sim(end+1) = lin_interp_value(t(i), data.ins_t, data.ins_data);
           data.glu_sim(end+1) = lin_interp_value(t(i), data.glu_t, data.glu_data);    
           data.glc_sim(end+1) = lin_interp_value(t(i), data.glc_t, data.glc_data);
       end
       
       data.hgp_sim = [data.hgp_sim v(:,1)'];
       data.glycogen_sim = [data.glycogen_sim c(:,17)'];
       
       c_init = c(end,:);
       
    end
    
    % store the data for teh simulation
    % TODO, sim_data.
    
    % plot the important information
    switch sim
        case 'saline'
            fig1 = figure('Name', 'Cherrington1976 - Saline');
        case 'somatostatin'
            fig2 = figure('Name', 'Cherrington1976 - Somatostatin');
        case 'insulin_replacement'
            fig3 = figure('Name', 'Cherrington1976 - Insulin Replacement');
        case 'glucagon_replacement'
            fig4 = figure('Name', 'Cherrington1976 - Glucagon Replacement');
        case 'somatostatin_replacement'
            fig5 = figure('Name', 'Cherrington1976 - Somatostatin Replacement');
    end
    
    xlim_data = [60 240];
    % Insulin
    subplot(3,3,1)
    plot(data.ins_t, data.ins_data, 'ks', data.t_sim, data.ins_sim, 'b-');
    title('insulin')
    xlabel('time [min]')
    xlim(xlim_data);
    
    % Glucagon
    subplot(3,3,2)
    plot(data.glu_t, data.glu_data, 'ks', data.t_sim, data.glu_sim, 'b-');
    title('glucagon')
    xlabel('time [min]')
    xlim(xlim_data);
    
    % Glucose extern
    subplot(3,3,3)
    plot(data.glc_t, data.glc_data, 'ks', data.t_sim, data.glc_sim, 'b-');
    title('glucose extern')
    xlabel('time [min]')
    xlim(xlim_data);
    
    % HGP extern
    subplot(3,3,4)
    plot(data.gp_t, data.gp_data, 'ks', data.t_sim, data.hgp_sim, 'b-');
    title('GP and HGP')
    xlabel('time [min]')
    xlim(xlim_data);
    
    % Glycogen
    subplot(3,3,5)
    plot(data.t_sim, data.glycogen_sim, 'b-');
    title('GP and HGP')
    xlabel('time [min]')     
    xlim(xlim_data);
    drawnow
        
end
    
end
         
          

