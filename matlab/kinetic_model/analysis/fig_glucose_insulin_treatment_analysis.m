function [] = fig_glucose_insulin_treatment_analysis()
%%FIG_GLUCOSE_INSULIN_TREATMENT_ANALYSIS Creates the figure for the glucose,
% glycogen dependency of the various insulin treatments

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110315  -   v0.1

close all
clear all

% Simulation Settings
in_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110314_data/glucose_insulin_treatment/T2DM'

save_images = 1;    % select if images should be saved
pcolor_edge_alpha = 0;

%% Select range for plot
% plot boundaries (values have to exist)
glc_min = 2;            % glucose minial concentration
glc_max = 14;           % glucose maximal concentration
glycogen_min = 0;       % glycogen minimal concentration
glycogen_max = 500;     % glycogen maximal concentration
t_eval = 100;               % time point of evaluation

axis_range = [glc_min glc_max glycogen_min glycogen_max];

caxis_hgp = [-20 20];
caxis_grc   = [0 10];
clines_hgp = (-20:4:20);
clines_grc = (0:2:10);
ccolor_hgp = [0.2, 0.2, 0.2];
ccolor_grc = [0 0 0];

treatment_types = {'linear_addition', 'constant_addition'}

for tindex =1:length(treatment_types)
    treatment_type = treatment_types{tindex};

treatment_num  = 4 + 2;                      % number of different treatments
in_files = cell(1,treatment_num);
for k=1:treatment_num
    if k==1
        in_files{k} = strcat(in_folder, '/normal_1');
    elseif k==2
        in_files{k} = strcat(in_folder, '/no_treatment_1');
    else
        in_files{k} = strcat(in_folder, '/', treatment_type, '_', num2str(k-2));     
    end
end

%% fig3 - glucose, hgp and hgu (pcolor)
fig3 = figure('Name','glucose glycogen dependency', 'Color',[1 1 1]);
map_rg = colormap_gwr(caxis_hgp(1), caxis_hgp(2));
set(fig3, 'Colormap', map_rg);

for treatment_ind = 1:treatment_num
    % load data
    %in_file  = strcat(in_folder, '/', treatment_type, '_', num2str(treatment_ind));
    in_file = in_files{treatment_ind}
    load(in_file);
    
    glc_ext  = mpars.glc_ext;
    glycogen = mpars.glycogen;
    t_span   = mpars.t_span; 
    
    % indeces of boundaries
    tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
    tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
    tmp = find(glycogen>=glycogen_min); glycogen_min_ind = tmp(1);
    tmp = find(glycogen<=glycogen_max); glycogen_max_ind = tmp(end);
    tmp = find(glycogen>=0.5*glycogen_max); glycogen_250_ind = tmp(end);
    tmp = find(t_span>=t_eval); t_eval_ind = tmp(1);

    % plot vectors
    x = glc_ext(glc_min_ind:glc_max_ind);
    y = glycogen(glycogen_min_ind:glycogen_max_ind);
    
    for p_ind = 1:3
        switch p_ind
            case 1
                % panel 1 - HGP and HGU
                sp = subplot(treatment_num, 3, 3*(treatment_ind-1) + 1);
                z = v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 1);
            case 2
                % panel 2 - glycolysis and gluconeogenesis
                sp = subplot(treatment_num, 3, 3*(treatment_ind-1) + 2);
                z = v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind,  t_eval_ind, 4);            
            case 3
                % panel 3 - glycogenolyis and glycogen synthesis
                sp = subplot(treatment_num, 3, 3*(treatment_ind-1) + 3);
                z = -v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 5);
        end
        
        p1 = pcolor(x, y, z'); hold on;
        set(p1, 'EdgeAlpha', pcolor_edge_alpha);
        [C,h] = contour(x,y,z',clines_hgp, 'k-', 'LineColor', ccolor_hgp); hold off
        text_handle = clabel(C, h, 'LabelSpacing', 350, 'Rotation',90);
        set(text_handle,'Color',ccolor_hgp);

        if treatment_ind == 1
            switch p_ind
                case 1
                    %title({'Flux v_{GLUT2} [µmol/min/kg]', '(HGP[-]/HGU[+])'}, 'FontWeight', 'bold', 'FontSize', 12), 
                case 2
                    % title({'v_{GPI} [µmol/min/kg]', '(gluconeo. [-] / glycolysis [+])'}, 'FontWeight', 'bold', 'FontSize', 12), 
                case 3
                    %title({'- v_{G1P1} [µmol/min/kg]', '(glycogenolysis [-] / glycogen synthesis [+])'}, 'FontWeight', 'bold', 'FontSize', 12), 
            end
        end
        if treatment_ind == 6
           xlabel('glucose [mM]') 
        end
        if p_ind == 1
            ylabel('glycogen [mM]')
        end
        
        caxis(caxis_hgp)
        axis(axis_range);
        axis square
        shading interp
        if p_ind == 3
            colorbar('peer',sp);   
        end
    end
end

% save the image
if save_images==1
    disp('* fig3 saved')
    fig_file = strcat(in_file, '_fig3.png')
    saveas(fig3, fig_file,'png'); 
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% figure4 - MCA (pcolor)
fig4 = figure('Name', 'MCA coefficient', 'Color', [1 1 1]);
map_jet = colormap(jet(1000));
set(fig4, 'Colormap', map_jet);

for treatment_ind = 1:treatment_num
    
    % load data
    in_file = in_files{treatment_ind};
    load(in_file);
    x = glc_ext(glc_min_ind:glc_max_ind-1);
    y = glycogen(glycogen_min_ind:glycogen_max_ind);
    
    % Calculate the MCA Coeffiecient from the matrix (differentiate)
    z_tmp = squeeze(v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 1));
    z = zeros(glc_max_ind-glc_min_ind, glycogen_max_ind-glycogen_min_ind);
    for p=1:(1 + glycogen_max_ind-glycogen_min_ind)
        z(:,p) = ( z_tmp(2:end, p) - z_tmp(1:end-1, p) )' ./ ( glc_ext(glc_min_ind+1:glc_max_ind) - glc_ext(glc_min_ind:glc_max_ind-1 ) );
    end
    
    % panel 1 - GRC
    %subplot(treatment_num,1,2*treatment_ind-1);
    subplot(treatment_num,1,treatment_ind);
    p4 = pcolor(x, y, z'); hold on;
    set(p4, 'EdgeAlpha', pcolor_edge_alpha);
    [C,h] = contour(x,y,z',clines_grc, 'k-', 'LineColor', ccolor_grc); hold off
    text_handle = clabel(C, h, 'LabelSpacing', 350, 'Rotation',90);
    set(text_handle,'Color',ccolor_grc);
    if treatment_ind == 1
        %title('Delta v_{GLUT2} / Delta glc_{ext}', 'FontWeight', 'bold', 'FontSize', 12),
    end
    colorbar('peer', gca);
    caxis(caxis_grc)
    axis(axis_range);
    axis square
    shading interp
    if treatment_ind == 6
        xlabel('glucose [mM]') 
    end

    
    % panel 2 GRC cuts
    %subplot(treatment_num,2,2*treatment_ind);
    %z_250  = z(:,glycogen_250_ind);
    %z_mean = mean(z,2);
    %plot(x, z_250, 'ks-', x, z_mean, 'bs-');
    %axis square
    
end
% save the image
if save_images==1
    disp('* fig4 saved')
    fig_file = strcat(in_file, '_fig4.png')
    saveas(fig4, fig_file,'png'); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end



