function [] = sim_krssak2004_figs(file)
% Figures for the evaluation of the Krssak2004 simulations

close all
if (nargin~=1)
    file = 'Krssak2004_v1.mat'
end
load(file);

sims = { 
    'mixed_meal_normal'
    'mixed_meal_t2dm'
    'clamp_normal'
    'clamp_t2dm'
};

N_sims = length(sims);
width = 500;
height = 1600;
xlim_data = [-50 920];
xlim_data2 = [-20 300];

show_sim1 = true;
show_sim2 = true;
show_t2dm = false;

lwidth = 2;

% errorbars -> have to be calculated from the dose response curves
ins_e = 100;
glu_e = 25;


fig1 = figure('Name', 'Krssak2004', 'Position', [0 height width height]);
for k_sim=1:N_sims
    sim = sims{k_sim};
    disp(sim)
    
    % Experimental data
    expdata = sim_krssak2004_data(sim);
    disp('... data loaded ...')
    
    % Simulation data
    data = getfield(fdata, sim);
    data_sx = getfield(fdata_sx, sim);
    
    
    %% glucose %%
    if (k_sim <= 2)
        subplot(5,2,1)
    else
        subplot(5,2,2)
    end
    if (k_sim==1) || (k_sim==3)
        errorbar(expdata.glc_t, expdata.glc_data, expdata.glc_sem, 'ks-', 'MarkerFaceColor', 'k')
        hold on
        if show_sim1
            plot(t_data, data.glc_sim, 'ro-', 'MarkerSize', 1, 'MarkerFaceColor', 'r', 'LineWidth', lwidth)
            
            hold on
        end
        if show_sim2
            plot(t_data, data_sx.glc_sx, 'bo-', 'MarkerSize', 1, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
        end
        hold on
    else
        % T2DM
        if show_t2dm
        errorbar(expdata.glc_t, expdata.glc_data, expdata.glc_sem, 'bs-', 'MarkerFaceColor', [0.5 0.5 0.5])
            if k_sim == 2
                plot(t_data, data.glc_sim, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            elseif k_sim == 4
                plot(t_data, data_sx.glc_sx, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            end
            hold off
        end
    end
    if (k_sim <= 2)
        title('Mixed Meal Test')
    else
        title('Clamp Test')
    end
    ylabel('glucose [mM]')
    if (k_sim == 1)
       xlim(xlim_data)
    elseif (k_sim == 3)
       xlim(xlim_data2)
    end
    ylim([2 15])
    axis square
    
    %% insulin %%
    if (k_sim <= 2)
        subplot(5,2,3)
    else
        subplot(5,2,4)
    end
    if (k_sim==1) || (k_sim==3)
        errorbar(expdata.insulin_t, expdata.insulin_data, expdata.insulin_sem, 'ks-', 'MarkerFaceColor', 'k')
        hold on
        if show_sim1
            y_high = data.ins_sim + ins_e;
            y_low = data.ins_sim - ins_e;
            X = [t_data fliplr(t_data)];
            Y = [y_high, fliplr(y_low)];
            %plot(t_data, y_high, 'r-')
            %hold on
            %plot(t_data, y_low, 'r-')
            %hold on
            fill(X, Y,[0.8 0.8 0.8], 'EdgeColor', [1 1 1]);
            hold on
            plot(t_data, data.ins_sim, 'ro-', 'MarkerSize', 1, 'MarkerFaceColor', 'r', 'LineWidth', lwidth)
            hold on
        end
        if show_sim2
            plot(t_data, data_sx.ins_sx, 'bo-', 'MarkerSize', 1, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            hold on
        end

    else
        %T2DM
        if show_t2dm
            errorbar(expdata.insulin_t, expdata.insulin_data, expdata.insulin_sem, 's-', 'MarkerFaceColor', [0.5 0.5 0.5])
            if k_sim == 2
                plot(t_data, data.ins_sim, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            elseif k_sim == 4
                plot(t_data, data_sx.ins_sx, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            end
            hold off
        end
    end
    ylabel('insulin [pmol/l]')
    if (k_sim == 1)
       xlim(xlim_data)
    elseif (k_sim == 3)
       xlim(xlim_data2)
    end
    ylim([0 900])
    axis square
    
    %% glucagon %%
    if (k_sim <= 2)
        subplot(5,2,5)
    else
        subplot(5,2,6)
    end
    if (k_sim==1) || (k_sim==3)
        errorbar(expdata.glucagon_t, expdata.glucagon_data, expdata.glucagon_sem, 'ks-', 'MarkerFaceColor', 'k')
        hold on
        if show_sim1
            y_high = data.glu_sim + glu_e;
            y_low = data.glu_sim - glu_e;
            X = [t_data fliplr(t_data)];
            Y = [y_high, fliplr(y_low)];
            plot(t_data, y_high, 'r-')
            hold on
            plot(t_data, y_low, 'r-')
            hold on
            fill(X, Y,[0.8 0.8 0.8], 'EdgeColor', [1 1 1]);
            hold on
            plot(t_data, data.glu_sim, 'ro-', 'MarkerSize', 1, 'MarkerFaceColor', 'r', 'LineWidth', lwidth)
            hold on
        end
        if show_sim2
            plot(t_data, data_sx.glu_sx, 'bo-', 'MarkerSize', 1, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            hold on
        end

        
    else
        % T2DM
        if show_t2dm
            errorbar(expdata.glucagon_t, expdata.glucagon_data, expdata.glucagon_sem, 's-', 'MarkerFaceColor', [0.5 0.5 0.5])
            if k_sim == 2
                plot(t_data, data.glu_sim, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            elseif k_sim == 4
                plot(t_data, data_sx.glu_sx, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            end
            hold off
        end
    end
    ylabel('glucagon [pmol/l]')
    if (k_sim == 1)
       xlim(xlim_data)
    elseif (k_sim == 3)
       xlim(xlim_data2)
    end
    ylim([0 100])
    axis square
    
    
    %% glycogen %%
    if (k_sim <= 2)
        subplot(5,2,7)
    else
        subplot(5,2,8)
    end
    if (k_sim==1) || (k_sim==3)
        % normal data
        errorbar(expdata.glycogen_t, expdata.glycogen_data, expdata.glycogen_sem, 'ks-', 'MarkerFaceColor', 'k')
        hold on
        if show_sim1
            plot(t_data, data.glycogen_sim, 'ro-', 'MarkerSize', 1, 'MarkerFaceColor', 'r', 'LineWidth', lwidth)
            hold on
        end
        if show_sim2
            plot(t_data, data_sx.glycogen_sx, 'bo-', 'MarkerSize', 1, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
        end
        hold on
    else
        % t2dm
        if show_t2dm
            errorbar(expdata.glycogen_t, expdata.glycogen_data, expdata.glycogen_sem, 's-', 'MarkerFaceColor', [0.5 0.5 0.5])
            if k_sim == 2
                plot(t_data, data.glycogen_sim, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            elseif k_sim == 4
                plot(t_data, data_sx.glycogen_sx, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            end
            hold on
        end
    end
    ylabel('glycogen [mM]')
    if (k_sim == 1)
       xlim(xlim_data)
    elseif (k_sim == 3)
       xlim(xlim_data2)
    end
    ylim([150 450])
    axis square
    
    
    %% egp %%
    if (k_sim <= 2)
        subplot(5,2,9)
    else
        subplot(5,2,10)
    end
    if (k_sim==1) || (k_sim==3)
        errorbar(expdata.egp_t, expdata.egp_data, expdata.egp_sem, 'ks-', 'MarkerFaceColor', 'k')
        hold on
        if show_sim1
            plot(t_data, data.gp_sim, 'ro-', 'MarkerSize', 1, 'MarkerFaceColor', 'r', 'LineWidth', lwidth)
            hold on
        end
        if show_sim2
            plot(t_data, data_sx.gp_sx, 'bo-', 'MarkerSize', 1, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            hold on
        end
    else
        % T2DM
            if show_t2dm
            errorbar(expdata.egp_t, expdata.egp_data, expdata.egp_sem, 's-', 'MarkerFaceColor', [0.5 0.5 0.5])
            if k_sim == 2
                plot(t_data, data.gp_sim, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            elseif k_sim == 4
                plot(t_data, data_sx.gp_sx, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'LineWidth', lwidth)
            end
            %legend('normal', 'glucose simulation')
            hold on
        end
    end
    xlabel('time [min]')
    ylabel('EGP [µmol/kg/min]')
    if (k_sim == 1)
       xlim(xlim_data)
       plot(xlim_data, [0 0], 'k:')
    elseif (k_sim == 3)
       xlim(xlim_data2)
       plot(xlim_data2, [0 0], 'k:')
    end
    ylim([-20 20])
    axis square
    
end

% Make the subplots bigger
scale_subplots(1.12);
bold_subplots();
saveas(fig1, 'Krssak2004_fig1.tif')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analysis of possible zonation 
fig2 = figure('Name', 'EGP zonation', 'Position', [600 1200 600 600]);

% Experimental data
for k_sim=1:N_sims
    sim = sims{k_sim};
    disp(sim)
    
    % Experimental data
    expdata = sim_krssak2004_data(sim);
    disp('... data loaded ...')
    
    % Simulation data
    data = getfield(fdata, sim);
    data_sx = getfield(fdata_sx, sim);
    %% egp %%
    if (k_sim <= 2)
        subplot(2,2,1)
    else
        subplot(2,2,2)
    end
    if (k_sim==1) || (k_sim==3)
        errorbar(expdata.egp_t, expdata.egp_data, expdata.egp_sem, 'rs-', 'MarkerFaceColor', 'k')
        hold on
        plot(t_data, data.gp_sim, 'ro-', 'MarkerSize', 2, 'MarkerFaceColor', 'r')
        plot(t_data, data_sx.gp_sx, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b')
        hold on
    else
        % T2DM
            if show_t2dm
            errorbar(expdata.egp_t, expdata.egp_data, expdata.egp_sem, 's-', 'MarkerFaceColor', [0.5 0.5 0.5])
            if k_sim == 2
                plot(t_data, data.gp_sim, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b')
            elseif k_sim == 4
                plot(t_data, data_sx.gp_sx, 'bo-', 'MarkerSize', 2, 'MarkerFaceColor', 'b')
            end
            %legend('normal', 'glucose simulation')
            hold on
        end
    end
    xlabel('time [min]')
    ylabel('EGP [µmol/kg/min]')
    if (k_sim == 1)
       xlim(xlim_data)
       plot(xlim_data, [0 0], 'k:')
    elseif (k_sim == 3)
       xlim(xlim_data2)
       plot(xlim_data2, [0 0], 'k:')
    end
    ylim([-20 20])
    axis square
end

% Effect of zonation on data
N_cells = 4;   % number of adjacent cells

% Mixed meal data
data_mix = zeros(2*N_cells+1, length(t_data));
data_mix_sx = zeros(2*N_cells+1, length(t_data));
% Clamp data
data_clamp = zeros(2*N_cells+1, length(t_data));
data_clamp_sx = zeros(2*N_cells+1, length(t_data));

% Delta HGP
delta = 3;  % [µmol/kg/min]

% Mixed meal
data = getfield(fdata, 'mixed_meal_normal');
data_sx = getfield(fdata_sx, 'mixed_meal_normal');
expdata = sim_krssak2004_data('mixed_meal_normal');

for k=1:2*N_cells + 1
    data_mix(k,:) = data.gp_sim' + (k-N_cells-1)*delta + delta;
    data_mix_sx(k,:) = data_sx.gp_sx' + (k-N_cells-1)*delta + delta;
end
subplot(2,2,3)
errorbar(expdata.egp_t, expdata.egp_data, expdata.egp_sem, 'rs-', 'MarkerFaceColor', 'k')
hold on
plot(t_data, data_mix, 'k--', 'MarkerSize', 1, 'MarkerFaceColor', 'k')
hold on
plot(t_data, data.gp_sim, 'ro-', 'MarkerSize', 2, 'MarkerFaceColor', 'r')
hold on
plot(t_data, sum(data_mix>0, 1), 'o-', 'MarkerSize', 2, 'MarkerFaceColor', [0 0.5 0], 'MarkerEdgeColor', [0 0.5 0])
hold on
%plot(t_data, sum(data_mix_sx>0, 1), 's--', 'MarkerSize', 2, 'MarkerFaceColor', [0 0.5 0], 'MarkerEdgeColor', [0 0.5 0])

xlabel('time [min]')
ylabel('EGP [µmol/kg/min]')
if (k_sim == 1)
   xlim(xlim_data)
   plot(xlim_data, [0 0], 'k:')
elseif (k_sim == 3)
   xlim(xlim_data2)
   plot(xlim_data2, [0 0], 'k:')
end
%ylim([-20 20])
axis square
xlim(xlim_data)
ylim([-20 30]);
plot(xlim_data, [0 0], 'k-')
    
    
data = getfield(fdata, 'clamp_normal');
data_sx = getfield(fdata_sx, 'clamp_normal');
expdata = sim_krssak2004_data('clamp_normal');
for k=1:2*N_cells + 1
    data_clamp(k,:) = data.gp_sim' + (k-N_cells-1)*delta + delta;
    data_clamp_sx(k,:) = data_sx.gp_sx' + (k-N_cells-1)*delta + delta;
end
subplot(2,2,4)
errorbar(expdata.egp_t, expdata.egp_data, expdata.egp_sem, 'rs-', 'MarkerFaceColor', 'k')
hold on
plot(t_data, data_clamp, 'k--', 'MarkerSize', 1, 'MarkerFaceColor', 'k')
hold on
plot(t_data, data.gp_sim, 'ro-', 'MarkerSize', 2, 'MarkerFaceColor', 'r')
hold on
plot(t_data, sum(data_clamp>0, 1), 'o-', 'MarkerSize', 2, 'MarkerFaceColor', [0 0.5 0], 'MarkerEdgeColor', [0 0.5 0])
%hold on
%plot(t_data, sum(data_clamp_sx>0, 1), 's--', 'MarkerSize', 2, 'MarkerFaceColor', [0 0.5 0], 'MarkerEdgeColor', [0 0.5 0])

xlabel('time [min]')
ylabel('EGP [µmol/kg/min]')
if (k_sim == 1)
   xlim(xlim_data)
   plot(xlim_data, [0 0], 'k:')
elseif (k_sim == 3)
   xlim(xlim_data2)
   plot(xlim_data2, [0 0], 'k:')
end
%ylim([-20 20])
axis square
xlim(xlim_data)
ylim([-20 30]);
plot(xlim_data, [0 0], 'k-')



% Make the subplots bigger
scale_subplots(1.12);
bold_subplots();
saveas(fig2, 'Krssak2004_fig2.tif')

end


