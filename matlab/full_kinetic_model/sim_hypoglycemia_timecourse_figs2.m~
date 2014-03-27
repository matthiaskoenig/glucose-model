%function [] = sim_hypoglycemia_timecourse_figs(file)
close all

if (nargin~=1)
    %file = 'Hypoglycemia_v02.mat'
    file = '/home/mkoenig/Desktop/kinetic_model_results/simulations/120507_data/Hypoglycemia/hypoglycemia_i30_a5.mat'
end
load(file);

x_lim = [-20 130];
y_lim_gu = [0 6];
t_data = t_data - sim.t_add_start;

fig1 = figure('Name', 'Hypoglycemia', 'Position', [0 0 300 300], 'Color', [1 1 1])
conditions = {  'normal'
                'diabetes'};
for k = 1:length(conditions)
    condition = conditions{k}
    data = getfield(fdata, condition);
    % GU and HGP normal
    if (k==1)
        %gu = data.gu_sim - data.gu_sim(1);
        gp = data.gp_sim - data.gp_sim(1);
        fill([-2 sim.t_add_interval sim.t_add_interval -2], [0 0 sim.gu_add sim.gu_add],[0.95 0.95 0.95], 'EdgeColor', [0 0 0]);
        hold on;
        ptmp = plot(t_data, gp, 'k')
        set(ptmp, 'LineWidth', 1);
        hold on;
    end
    % GU and HGP T2DM
    if (k==2)
        gp = data.gp_sim - data.gp_sim(1);
        ptmp = plot(t_data, gp, 'b') 
        set(ptmp, 'LineWidth', 1);
        hold on
    end
    axis square
    xlabel('time [min]')
    ylabel({'\Delta HGP & \Delta GU', '[µmol/kg/min]'})
    xlim(x_lim);
    ylim(y_lim_gu);
end

bold_subplots();
name = 'Figure_7A';
file_tmp = strcat('/home/mkoenig/Desktop/figures/', name, '.tif');
set(gcf,'PaperPositionMode','auto')
print(fig1, file_tmp, '-dtiff', '-r600')

y_lim_glc = [2.75 4.1];
fig2 = figure('Name', 'Hypoglycemia', 'Position', [0 0 300 300], 'Color', [1 1 1])
fill([x_lim(1) x_lim(2) x_lim(2) x_lim(1)], [0 0 3 3],[1 0.9 0.9], 'EdgeColor', [1 1 1]);
hold on
for k = 1:length(conditions)
    condition = conditions{k}
    data = getfield(fdata, condition);
    % glc normal
    if (k==1)
        ptmp = plot(t_data, data.glc_sim, 'k')
        set(ptmp, 'LineWidth', 1);
        hold on;
    end
    % glc T2DM
    if (k==2)
        ptmp = plot(t_data, data.glc_sim, 'b') 
        set(ptmp, 'LineWidth', 1);
        hold on
    end
    axis square
    xlabel('time [min]')
    ylabel('glucose [mM]')
    xlim(x_lim);
    ylim(y_lim_glc);
end
bold_subplots();
name = 'Figure_7B';
file_tmp = strcat('/home/mkoenig/Desktop/figures/', name, '.tif');
set(gcf,'PaperPositionMode','auto')
print(fig2, file_tmp, '-dtiff', '-r600')


%% Linear treatments (green)
conditions = {  'normal'
                'diabetes'
                'linear_insulin_1'
                'linear_insulin_2'
                'linear_insulin_3'
                'linear_insulin_4'
                }
fig3 = figure('Name', 'Hypoglycemia', 'Position', [0 0 300 300], 'Color', [1 1 1])
fill([x_lim(1) x_lim(2) x_lim(2) x_lim(1)], [0 0 3 3],[1 0.9 0.9], 'EdgeColor', [1 1 1]);
hold on
for k = 1:length(conditions)
    condition = conditions{k}
    data = getfield(fdata, condition);
    % glc normal
    if (k==1)
        ptmp = plot(t_data, data.glc_sim, 'k')
        set(ptmp, 'LineWidth', 1);
        hold on;
    end
    % glc T2DM
    if (k==2)
        ptmp = plot(t_data, data.glc_sim, 'b') 
        set(ptmp, 'LineWidth', 1);
        hold on
    end
    if (k>2)
        ptmp = plot(t_data, data.glc_sim) 
        set(ptmp, 'LineWidth', 1);
        hold on
        if (k==3)
            set(ptmp,'Color',[0 0.4 0]);
        end
        if (k==4)
            set(ptmp,'Color',[0 0.53 0]);
        end
        if (k==5)
            set(ptmp,'Color',[0 0.66 0]);
        end
        if (k==6)
            set(ptmp,'Color',[0 0.8 0]);
        end
    end
    axis square
    xlabel('time [min]')
    ylabel('glucose [mM]')
    xlim(x_lim);
    ylim(y_lim_glc);
end
bold_subplots();
name = 'Figure_7C';
file_tmp = strcat('/home/mkoenig/Desktop/figures/', name, '.tif');
set(gcf,'PaperPositionMode','auto')
print(fig3, file_tmp, '-dtiff', '-r600')

%% Addititve treatments (violett)
conditions = {  'normal'
                'diabetes'
                'additive_insulin_1'
                'additive_insulin_2'
                'additive_insulin_3'
                'additive_insulin_4'
                }
fig4 = figure('Name', 'Hypoglycemia', 'Position', [0 0 300 300], 'Color', [1 1 1])
fill([x_lim(1) x_lim(2) x_lim(2) x_lim(1)], [0 0 3 3],[1 0.9 0.9], 'EdgeColor', [1 1 1]);
hold on
for k = 1:length(conditions)
    condition = conditions{k}
    data = getfield(fdata, condition);
    % glc normal
    if (k==1)
        ptmp = plot(t_data, data.glc_sim, 'k')
        set(ptmp, 'LineWidth', 1);
        hold on;
    end
    % glc T2DM
    if (k==2)
        ptmp = plot(t_data, data.glc_sim, 'b') 
        set(ptmp, 'LineWidth', 1);
        hold on
    end
    % additive treatment
    if (k>2)
        ptmp = plot(t_data, data.glc_sim, 'b') 
        set(ptmp, 'LineWidth', 1);
        hold on
        if (k==3)
            set(ptmp,'Color',[0.5 0 0.5]);
        end
        if (k==4)
            set(ptmp,'Color',[0.6 0 0.6]);
        end
        if (k==5)
            set(ptmp,'Color',[0.7 0 0.7]);
        end
        if (k==6)
            set(ptmp,'Color',[0.8 0 0.8]);
        end
    end
    axis square
    xlabel('time [min]')
    ylabel('glucose [mM]')
    xlim(x_lim);
    ylim(y_lim_glc);
end
bold_subplots();
name = 'Figure_7D';
file_tmp = strcat('/home/mkoenig/Desktop/figures/', name, '.tif');
set(gcf,'PaperPositionMode','auto')
print(fig4, file_tmp, '-dtiff', '-r600')
