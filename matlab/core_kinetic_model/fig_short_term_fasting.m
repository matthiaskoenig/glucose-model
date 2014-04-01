%% FIG_SHORT_TERM_FASTING - Plot short term fasting curves.
% The glucose dependency data has to be calculated first.
%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2014 Matthias Koenig
%   date:   2014-04-01
clear all, close all, format compact;

%% DATA PREPARATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
results_folder = '../../results/glucose_dependency';
res_file = strcat(results_folder, '/', 'glucose_dependency.mat');

% Load the simulation data [c_full, v_full, glc_ext, tspan]
% Matrix dimensions correspond to  v_full = zeros(Nt, Nv, Nsim);
load(res_file);
return

% plot range
% offset for t (very rapid changes in first minute not shown)
t_offset = 1;           
edge_alpha_val = 0;
pcolor_edge_alpha = 0;

% plot boundaries
glc_min = 3.6;
glc_max = 5.0;
t_max = 3900;   % [min] 

% indeces of plot boundaries
tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
tmp = find(tspan>=t_max); t_max_ind = tmp(1);
clear tmp

x1 = glc_ext(glc_min_ind:glc_max_ind);
y1 = tspan(t_offset:t_max_ind)/60;        % time in [h]

% Get the respective fluxes from the flux matrix 
%  -GLUT2 = -v1 => HGP
%  -GPI   = -v4 => GNG
%  +G16PI =  v5 = >GLY
z_hgp = -v_full(t_offset:t_max_ind, 1, glc_min_ind:glc_max_ind); 
z_gng = -v_full(t_offset:t_max_ind, 4, glc_min_ind:glc_max_ind);
z_gly =  v_full(t_offset:t_max_ind, 5, glc_min_ind:glc_max_ind);

% matrix transformations for easier access
z_hgp = squeeze(z_hgp)';
z_gng = squeeze(z_gng)';
z_gly = squeeze(z_gly)';
% calculate the relative contribution
z_frac = z_gng./z_hgp;

%% FIGURES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
color_data = [0 0 1];
fig1 = figure('Name', 'Figure 3 - short term fasting', 'Color', [1 1 1]);

overnight_time = 9

% HGP %
subplot(2,2,1)
psim = plot(y1+overnight_time, z_hgp(2:end-1,:), 'k--'); hold on
psim = plot(y1+overnight_time, z_hgp(1,:), '--', 'Color', [0.9 0.2 0], 'LineWidth', 2.0); hold on
psim = plot(y1+overnight_time, z_hgp(end, :), '--', 'Color', [0 0.5 0], 'LineWidth', 2.0); hold on

hold off
ylabel('HGP [\mumol/kg/min]', 'FontWeight', 'bold')
axis square
% axis([overnight_time 70 0 21])
set(gca,'XTick',10:10:70, 'FontWeight', 'bold')

% GNG %
subplot(2,2,2)
psim = plot(y1+overnight_time, z_gng(2:end-1,:), 'k--'); hold on
psim = plot(y1+overnight_time, z_gng(1,:), '--', 'Color', [0.9 0.2 0],'LineWidth', 2.0); hold on
psim = plot(y1+overnight_time, z_gng(end, :), '--', 'Color', [0 0.5 0], 'LineWidth', 2.0); hold off
ylabel('GNG [\mumol/kg/min]', 'FontWeight', 'bold')
axis square
% axis([overnight_time 70 0 14])
set(gca,'XTick',10:10:70, 'FontWeight', 'bold')

% GLY %
subplot(2,2,3)
psim = plot(y1+overnight_time, z_gly(2:end-1,:), 'k--'); hold on
psim = plot(y1+overnight_time, z_gly(1,:), '--', 'Color', [0.9 0.2 0],'LineWidth', 2.0); hold on
psim = plot(y1+overnight_time, z_gly(end, :), '--', 'Color', [0 0.5 0], 'LineWidth', 2.0); hold off

xlabel('time [h]', 'FontWeight', 'bold')
ylabel('GLY [\mumol/kg/min]', 'FontWeight', 'bold')
axis square
% axis([overnight_time 70 0 14])
set(gca,'XTick',10:10:70, 'FontWeight', 'bold')

% GNG/HGP %
subplot(2,2,4)
psim = plot(y1+overnight_time, z_frac(2:end-1,:)*100, 'k--'); hold on
psim = plot(y1+overnight_time, z_frac(1,:)*100, '--', 'Color', [0.9 0.2 0],'LineWidth', 2.0); hold on
psim = plot(y1+overnight_time, z_frac(end,:)*100, '--', 'Color', [0 0.5 0], 'LineWidth', 2.0); hold on

hold off
xlabel('time [h]', 'FontWeight', 'bold')
ylabel('GNG/HGP [%]', 'FontWeight', 'bold')
axis square
% axis([overnight_time 70 20 100])
set(gca,'XTick',10:10:70, 'FontWeight', 'bold')

% save the figure
% TODO


