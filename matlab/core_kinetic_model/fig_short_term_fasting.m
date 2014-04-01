%% FIG_SHORT_TERM_FASTING - Plot short term fasting curves.
% The glucose dependency data has to be calculated first.
%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2014 Matthias Koenig
%   date:   2014-04-01
clear all, close all, format compact;
results_folder = '../../results/glucose_dependency';
res_file = strcat(results_folder, '/', 'glucose_dependency.mat');

% Load the simulation data
load(res_file);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [1] glycogenolysis
% load simulation data

% plot range
t_offset = 1;           % offset for t (very rapid changes in first minute not shown)
edge_alpha_val = 0;
pcolor_edge_alpha = 0;

% plot boundaries
glc_min = 3.6;
glc_max = 5.0;
t_max = 3900;   % [min] 

% indeces of plot boundaries
glc_ext = mpars.glc_ext;
t_span  = mpars.t_span; 
tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
tmp = find(t_span>=t_max); t_max_ind = tmp(1);

x1 = glc_ext(glc_min_ind:glc_max_ind);
y1 = t_span(t_offset:t_max_ind)/60;  % time in [h]

% Get the respective fluxes from the flux matrix
z_hgp = -v_full(t_offset:t_max_ind, 1, glc_min_ind:glc_max_ind); % v1 - 
z_gng = -v_full(t_offset:t_max_ind, 4, glc_min_ind:glc_max_ind);
z_gly =  v_full(t_offset:t_max_ind, 5, glc_min_ind:glc_max_ind);
z_frac = z_gng./z_hgp;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
color_data = [0 0 1];
figure('Name', 'Figure 3')

test = 9
% [1] HGP
subplot(2,2,1)
psim = plot(y1+test, z_hgp(2:end-1,:), 'k--'); hold on
psim = plot(y1+test, z_hgp(1,:), '--', 'Color', [0.9 0.2 0], 'LineWidth', 2.0); hold on
psim = plot(y1+test, z_hgp(end, :), '--', 'Color', [0 0.5 0], 'LineWidth', 2.0); hold on
psim = plot(y1+test, z_hgp_var(1, :), '--', 'Color', [0 0 1], 'LineWidth', 2.0); hold on

xtmp = data(:, 3);
ytmp = data(:, 4);
pdata = plot(xtmp, ytmp, 's', 'MarkerSize',4.0, 'Color', color_data, ...
                              'MarkerFaceColor', color_data, 'MarkerEdgeColor', [0.2 0.2 0.2]);
%he1 =errorbar(magnusson1992(:,1), magnusson1992(:,2), magnusson1992(:,3),'.k');
%set(he1,'MarkerSize',2.0);
%set(he1,'Color',colororder(8,:));
hold off
%xlabel('time [h]', 'FontWeight', 'bold')
ylabel('HGP [\mumol/kg/min]', 'FontWeight', 'bold')
axis square
axis([test 70 0 21])
set(gca,'XTick',10:10:70, 'FontWeight', 'bold')
%grid on

% [2] GNG
subplot(2,2,2)
psim = plot(y1+test, z_gng(2:end-1,:), 'k--'); hold on
psim = plot(y1+test, z_gng(1,:), '--', 'Color', [0.9 0.2 0],'LineWidth', 2.0); hold on
psim = plot(y1+test, z_gng(end, :), '--', 'Color', [0 0.5 0], 'LineWidth', 2.0); hold on
psim = plot(y1+test, z_gng_var(1, :), '--', 'Color', [0 0 1], 'LineWidth', 2.0); hold on
ytmp = data(:, 5);
pdata = plot(xtmp, ytmp, 's', 'MarkerSize',4.0, 'Color', color_data, ...
                              'MarkerFaceColor', color_data, 'MarkerEdgeColor', [0.2 0.2 0.2]);
hold off
%xlabel('time [h]', 'FontWeight', 'bold')
ylabel('GNG [\mumol/kg/min]', 'FontWeight', 'bold')
axis square
axis([test 70 0 14])
set(gca,'XTick',10:10:70, 'FontWeight', 'bold')
%grid on

% [3] GLY
subplot(2,2,3)
psim = plot(y1+test, z_gly(2:end-1,:), 'k--'), hold on
psim = plot(y1+test, z_gly(1,:), '--', 'Color', [0.9 0.2 0],'LineWidth', 2.0); hold on
psim = plot(y1+test, z_gly(end, :), '--', 'Color', [0 0.5 0], 'LineWidth', 2.0); hold on
psim = plot(y1+test, z_gly_var(1, :), '--', 'Color', [0 0 1], 'LineWidth', 2.0); hold on
ytmp = data(:, 6);
pdata = plot(xtmp, ytmp, 's', 'MarkerSize',4.0, 'Color', color_data, ...
                              'MarkerFaceColor', color_data, 'MarkerEdgeColor', [0.2 0.2 0.2]);
hold off
xlabel('time [h]', 'FontWeight', 'bold')
ylabel('GLY [\mumol/kg/min]', 'FontWeight', 'bold')
axis square
axis([test 70 0 14])
set(gca,'XTick',10:10:70, 'FontWeight', 'bold')
%grid on

% [4] GNG/HGP %
subplot(2,2,4)
psim = plot(y1+test, z_frac(2:end-1,:)*100, 'k--'), hold on
psim = plot(y1+test, z_frac(1,:)*100, '--', 'Color', [0.9 0.2 0],'LineWidth', 2.0); hold on
psim = plot(y1+test, z_frac(end,:)*100, '--', 'Color', [0 0.5 0], 'LineWidth', 2.0); hold on
psim = plot(y1_var+test, z_frac_var(1, :)*100, '--', 'Color', [0 0 1], 'LineWidth', 2.0); hold on
ytmp = data(:, 7);
pdata = plot(xtmp, ytmp, 's', 'MarkerSize',4.0, 'Color', color_data, ...
                              'MarkerFaceColor', color_data, 'MarkerEdgeColor', [0.2 0.2 0.2]);
hold off
xlabel('time [h]', 'FontWeight', 'bold')
ylabel('GNG/HGP [%]', 'FontWeight', 'bold')
axis square
axis([test 70 20 100])
set(gca,'XTick',10:10:70, 'FontWeight', 'bold')
%grid on




