%% fig_glucose_glycogen_dependency - Generate heatmaps of steady state fluxes.
% Necessary for Figure 5.
%
%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2014 Matthias Koenig
%   date:   2014-04-01


close all
clear all

%% settings
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110314_data/glucose_glycogen_dependency/T2DM'

conditions = {'normal', 'diabetes', 'insulin_restored', 'glucagon_restored'}
save_images = 1;    % select if images should be saved
pcolor_edge_alpha = 0;

%% Select range for plot
glc_min = 2;            % glucose minial concentration
glc_max = 14.2;           % glucose maximal concentration
glycogen_min = 0;       % glycogen minimal concentration
glycogen_max = 500;     % glycogen maximal concentration
t_eval = 100;           % time point of evaluation

axis_range = [glc_min glc_max-0.1 glycogen_min glycogen_max];
caxis_flux = [-26 26];
caxis_rc   = [0 10];
ccolor_hgp = [0.2, 0.2, 0.2];
ccolor_grc = [0.2, 0.2, 0.2];
clines_hgp = -32:4:32;
clines_grc = 0:2:12;
xticks = [2 4 6 8 10 12 14 16 18];


%% figure3 - glucose, hgp and hgu (pcolor)
fig3 = figure('Name','glucose glycogen dependency', 'Color',[1 1 1]);
map_x_min = caxis_flux(1); map_x_max = caxis_flux(2);
map_rg = colormap_gwr(map_x_min, map_x_max);
set(fig3, 'Colormap', map_rg);

%set(fig3, 'Colormap', map_jet);

for condition_index = 1:length(conditions)
    condition = conditions{condition_index};
    % load data
    in_file = strcat(out_folder,  '/glucose_glycogen_dependency_', condition);
    load(in_file);
    
    glc_ext  = mpars.glc_ext;
    glycogen = mpars.glycogen;
    t_span   = mpars.t_span;
    
    % indeces of boundaries
    tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
    tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
    tmp = find(glycogen>=glycogen_min); glycogen_min_ind = tmp(1);
    tmp = find(glycogen<=glycogen_max); glycogen_max_ind = tmp(end);
    tmp = find(glycogen>=250); glycogen_250_ind = tmp(1);
    tmp = find(t_span>=t_eval); t_eval_ind = tmp(1);

    x = glc_ext(glc_min_ind:glc_max_ind);
    y = glycogen(glycogen_min_ind:glycogen_max_ind);

    for p_ind = 1:3
        switch p_ind
            case 1
                % panel 1 - HGP and HGU
                sp = subplot(length(conditions), 3, 3*(condition_index-1) + 1);
                z = v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 1);
            case 2    
                % panel 2 - glycolysis and gluconeogenesis
                sp = subplot(length(conditions), 3, 3*(condition_index-1) + 2);
                z = v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind,  t_eval_ind, 4);
            case 3
                % panel 3 - glycogenolyis and glycogen synthesis
                sp = subplot(length(conditions), 3, 3*(condition_index-1) + 3);
                z = -v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 5);
                
        end
        ptmp = pcolor(x, y, z'); hold on;
        [C,h] = contour(x,y,z',clines_hgp, 'k-', 'LineColor', ccolor_hgp); hold off
        text_handle = clabel(C, h, clines_hgp, 'Rotation', 90, 'LabelSpacing', 500);
        set(text_handle,'Color',ccolor_hgp);
        set(ptmp, 'EdgeAlpha', pcolor_edge_alpha);
        
        % first row
        if condition_index == 1
            switch p_ind
                case 1
                    %title({'Flux v_{GLUT2} [µmol/min/kg]', '(HGP[-]/HGU[+])'}, 'FontWeight', 'bold', 'FontSize', 12),         
                case 2
                    %title({'v_{GPI} [µmol/min/kg]', '(gluconeo. [-] /glycolysis [+])'}, 'FontWeight', 'bold', 'FontSize', 12), 
                case 3
                    %title({'- v_{G1P1} [µmol/min/kg]', '(glycogenolysis[-] / glycogen synthesis [+])'}, 'FontWeight', 'bold', 'FontSize', 12), 
            end
        end
        % second row
        if condition_index == 2
            %xlabel('glucose [mM]')
        end
        
        % last row
        if condition_index == 4
            xlabel('glucose [mM]')
            set(gca,'xTick', xticks)
        end
        
        % first column
        if p_ind == 1
            %ylabel('glycogen [mM]', 'FontWeight', 'bold')
            set(gca,'yTick', 0:250:500)
            ylabel('glycogen [mM]')
        else
           %set(gca,'yTick', []) 
           set(gca,'yTick', 0:250:500)
           
        end
        
        % third column
        if p_ind == 3
         colorbar('peer',sp);
        end
       
        caxis(caxis_flux)
        axis(axis_range);
        axis square
        shading interp
    end
end


% save the image
if save_images==1
    disp('* fig3 saved')
    fig_file = strcat(in_file, '_fig3.png')
    saveas(fig3, fig_file,'png'); 
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% figure4 - RC (pcolor)
fig4 = figure('Name', 'MCA coefficient', 'Color', [1 1 1]);
map_jet = colormap(jet(1000));
set(fig4, 'Colormap', map_jet)

for condition_index = 1:length(conditions)
    
    % load data
    condition = conditions{condition_index};
    in_file = strcat(out_folder,  '/glucose_glycogen_dependency_', condition);
    load(in_file);
    
    % x and y
    x = glc_ext(glc_min_ind:glc_max_ind-1);
    y = glycogen(glycogen_min_ind:glycogen_max_ind);
    
    % Calculate the MCA Coeffiecient from the matrix (differentiate)
    z_tmp = squeeze(v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 1));
    
    z = zeros(glc_max_ind-glc_min_ind, glycogen_max_ind-glycogen_min_ind);
    for p=1:(1 + glycogen_max_ind-glycogen_min_ind)
        z(:,p) = ( z_tmp(2:end, p) - z_tmp(1:end-1, p) )' ./ ( glc_ext(glc_min_ind+1:glc_max_ind) - glc_ext(1:glc_max_ind-1 ) );
    end
    
    % panel 1 - MCA
    subplot(4,2,2*condition_index-1);
    p4 = pcolor(x, y, z'); hold on
    
    % contour
    [C,h] = contour(x,y,z',clines_grc, 'k-', 'LineColor', ccolor_grc); 
    text_handle = clabel(C, h, clines_grc, 'Rotation', 90);
    set(text_handle,'Color', ccolor_grc);
    set(p4, 'EdgeAlpha', pcolor_edge_alpha);
    
    % 250 line
    y_line = 250 * ones(length(x),1);
    z_line = -1 * ones(length(x),length(y_line));
    plot3(x, y_line, z_line, 'k-'), hold off
    
    if condition_index == 1
        %title('Delta v_{GLUT2} / Delta glc_{ext}', 'FontWeight', 'bold', 'FontSize', 12),
    end
    if condition_index == 2
        %xlabel('glucose [mM]')
        
    end
    
    if condition_index == 2
        xlabel('glucose [mM]')
        set(gca,'xTick', xticks)
    else
        set(gca,'xTick', xticks)
    end
    %ylabel('glycogen [mM]', 'FontWeight', 'bold', 'FontSize', 11),

    colorbar('peer', gca);
    caxis(caxis_rc)
    axis(axis_range);
    axis square
    shading interp
    %set(gca,'yTick', 0:250:500)
    %set(gca,'yTick', [])
    set(gca,'yTick', 0:250:500)
    
    
    % MCA mean and glycogen 250
    subplot(4,2,2*condition_index);
    z_250  = z(:,glycogen_250_ind);
    z_mean = mean(z,2);
    plot(x, z_250, 'k-', x, z_mean, 'b-');
    axis square

end
% save the image
if save_images==1
    disp('* fig4 saved')
    fig_file = strcat(in_file, '_fig4.png')
    saveas(fig4, fig_file,'png'); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



