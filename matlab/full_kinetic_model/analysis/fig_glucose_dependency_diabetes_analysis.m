function [] = fig_glucose_dependency_diabetes_analysis()
%FIG_GLUCOSE_DEPENDENCY_DIABETES Creates figures depending on glucose and glycogen
% comparing normal state with T2DM, insulin restored and glycogen restored.
% loads the data from the normal case and creates the following plots
% - v_GLUT2 (glucose, time)
% - c_glycogen (glucose, time)
% - v_HPG_HPU (glucose, time)  -> v_GPI
% - v_glycogen_synthesis_glycogenolysis -> v_G1PI
%

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110315  -   v0.2

close all
clear all

%% settings
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110314_data/glucose_dependency/T2DM'
save_images = 1;    % select if images should be saved
t_offset = 2;       % ! First datapoint is fast steady state approach (don't use it)
pcolor_edge_alpha = 0;

glc_min = 2;
glc_max = 16;
t_max = 1200; 

conditions = {'normal', 'diabetes', 'insulin_restored', 'glucagon_restored'}
clines_hgp = (-20:4:20);
caxis_range = [-20 20];
ccolor_hgp = [0.2, 0.2, 0.2];
ccolor_glycogen = [0 0 0];

%% fig1 - hgp/hgu, glycolysis/gluconeogenesis, glycogenolysis/glycogen syn. (pcolor)
fig1 = figure('Name','HGP/HGU, glycogen, glycolysis & glycogen metabolism', 'Color',[1 1 1]);
map_rg = colormap_gwr(caxis_range(1), caxis_range(2));
set(fig1, 'Colormap', map_rg);

for condition_index = 1:length(conditions)
    
    % load data
    condition = conditions{condition_index};
    in_file = strcat(out_folder, '/glucose_dependency_', condition);
    load(in_file);
    
    % indeces of boundaries
    glc_ext = mpars.glc_ext;
    t_span  = mpars.t_span;
    tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
    tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
    tmp = find(t_span>=t_max); t_max_ind = tmp(1);
    t_min = 0;

    x = glc_ext(glc_min_ind:glc_max_ind);   % glucose vector in defined range
    y = t_span(t_offset:t_max_ind)/60;      % t [h]
    axis_range = [glc_min glc_max t_min/60 t_max/60];
    
    for p_ind = 1:3
        switch p_ind
            case 1
                % panel 1 - HGP and HGU
                subplot(length(conditions), 3, 3*(condition_index-1) + 1);
                z = v_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 1);
                
            case 2
                % panel 2 - glycolysis and gluconeogenesis
                subplot(length(conditions), 3, 3*(condition_index-1) + 2);
                z = v_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 4);
            case 3
                % panel 3 - glycogenolyis and glycogen synthesis
                subplot(length(conditions), 3, 3*(condition_index-1) + 3);
                z = -v_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 5);
                z(abs(z)<10E-5) = 0;
        end
    
        p1 = pcolor(x, y, z'); hold on
        set(p1, 'EdgeAlpha', pcolor_edge_alpha);
        [C,h] = contour(x,y,z', clines_hgp, 'k-', 'LineColor', ccolor_hgp); hold off
        %clabel(C, h, 0)
        text_handle = clabel(C, h, 'LabelSpacing', 350, 'Rotation',90);
        set(text_handle,'Color',ccolor_hgp);
        caxis(caxis_range)
        axis(axis_range);
        axis square
        shading interp
        if condition_index == 4
           xlabel('glucose [mM]'); 
        end
        if p_ind == 1
            ylabel('time [h]')
        end
        if p_ind == 3
            colorbar('peer', gca);
        end

    end
end

% save the image
if save_images==1
    disp('* fig3a saved')
    fig_file = strcat(in_file, '_fig3a.png')
    saveas(fig1, fig_file,'png'); 
end


%% fig2 - glycogen [mM] (pcolor)
fig2 = figure('Name', 'glycogen pcolor', 'Color', [1 1 1]);
map_jet = colormap(jet(1000));
set(fig2, 'Colormap', map_jet)

caxis_range = [0 500];

for condition_index = 1:length(conditions)
    % load data
    condition = conditions{condition_index};
    in_file = strcat(out_folder, '/glucose_dependency_', condition);
    load(in_file);
    
    % panel 4 - glycogen metabolism 
    subplot(4,1,condition_index);
    z = c_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 17);
    
    p1 = pcolor(x, y, z'); hold on
    set(p1, 'EdgeAlpha', pcolor_edge_alpha);
    [C,h] = contour(x,y,z',0:50:500, 'k-', 'LineColor', ccolor_glycogen); hold off
    text_handle = clabel(C, h, [0 100 200 300 400 500]);
    set(text_handle,'Color',ccolor_glycogen);
    
    colorbar('peer', gca);
    caxis(caxis_range)
    axis(axis_range);
    axis square
    shading interp
    
    if condition_index == 4
        xlabel('glucose [mM]'); 
    end
    
end
% save the image
if save_images==1
    disp('* fig4 saved')
    fig_file = strcat(in_file, '_fig4.png')
    saveas(fig2, fig_file,'png'); 
end

