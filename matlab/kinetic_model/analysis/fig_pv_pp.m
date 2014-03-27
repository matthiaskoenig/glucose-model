%% Creates the figure for perivenious - periportal simulations

format compact
close all
clear all

%% load the simulation data
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110215_data/pp_pv/pv'


in_files  = cellstr({strcat(out_folder, '/pp_pv_1')
                      strcat(out_folder, '/pp_pv_2')
                      strcat(out_folder, '/pp_pv_3')
                      strcat(out_folder, '/pp_pv_4')
                      strcat(out_folder, '/pp_pv_5')
              });
in_file = in_files{1}
load(in_file);

save_images = 1;    % select if images should be saved
t_offset = 2;
edge_alpha_val = 0;
pcolor_edge_alpha = 0;

%% Select range for plot
% plot boundaries (values have to exist)
glc_min = 2;
glc_max = 16;
t_max = 1000; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% figure3 - glucose, hgp and hgu (pcolor)

conditions = mpars.conditions

fig3 = figure('Name','HGP/HGU, glycogen, glycolysis & glycogen metabolism', 'Color',[1 1 1]);
set(fig3, 'Colormap',[0.200000002980232 0 0;0.280882358551025 0.0200980398803949 0;0.361764699220657 0.0401960797607899 0;0.442647069692612 0.06029412150383 0;0.523529410362244 0.0803921595215797 0;0.604411780834198 0.10049019753933 0;0.685294151306152 0.12058824300766 0;0.766176462173462 0.140686273574829 0;0.847058832645416 0.160784319043159 0;0.864052295684814 0.254030495882034 0.111111111938953;0.881045758724213 0.34727668762207 0.222222223877907;0.898039221763611 0.440522879362106 0.333333343267441;0.915032684803009 0.533769071102142 0.444444447755814;0.932026147842407 0.627015233039856 0.555555582046509;0.949019610881805 0.720261454582214 0.666666686534882;0.966013073921204 0.813507616519928 0.777777791023254;0.983006536960602 0.906753838062286 0.888888895511627;1 1 1;0 0 0;1 1 1;0.927272737026215 1 0.927272737026215;0.854545474052429 1 0.854545474052429;0.781818211078644 1 0.781818211078644;0.709090888500214 1 0.709090888500214;0.636363625526428 1 0.636363625526428;0.563636362552643 1 0.563636362552643;0.490909099578857 1 0.490909099578857;0.41818180680275 1 0.41818180680275;0.345454543828964 1 0.345454543828964;0.272727280855179 1 0.272727280855179;0.200000002980232 1 0.200000002980232;0.177777782082558 0.944226562976837 0.177777782082558;0.155555561184883 0.888453185558319 0.155555561184883;0.133333340287209 0.832679748535156 0.133333340287209;0.111111111938953 0.776906311511993 0.111111111938953;0.0888888910412788 0.721132874488831 0.0888888910412788;0.0666666701436043 0.665359497070312 0.0666666701436043;0.0444444455206394 0.60958606004715 0.0444444455206394;0.0222222227603197 0.553812623023987 0.0222222227603197;0 0.498039215803146 0;0 0.48562091588974 0;0 0.473202615976334 0;0 0.460784316062927 0;0 0.448366016149521 0;0 0.435947716236115 0;0 0.423529416322708 0;0 0.411111116409302 0;0 0.398692816495895 0;0 0.386274516582489 0;0 0.373856216669083 0;0 0.361437916755676 0;0 0.34901961684227 0;0 0.336601316928864 0;0 0.324183017015457 0;0 0.311764717102051 0;0 0.299346417188644 0;0 0.286928117275238 0;0 0.274509817361832 0;0 0.262091517448425 0;0 0.249673202633858 0;0 0.237254902720451 0;0 0.224836602807045 0;0 0.212418302893639 0;0 0.200000002980232 0]);

for condition_index = 1:length(conditions)
    condition = conditions(condition_index);
    
    % load data
    in_file = in_files{condition_index}
    load(in_file);
    
    % indeces of boundaries
    glc_ext = mpars.glc_ext;
    t_span  = mpars.t_span;
    tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
    tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
    tmp = find(t_span>=t_max); t_max_ind = tmp(1);
    t_min_ind = t_offset;
    t_min = 0;

    % panel 1 - HGP and HGU
    length(conditions)*(condition_index-1) + 1
    subplot2_1 = subplot(length(conditions), 3, 3*(condition_index-1) + 1);
    y = v_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 1);
    p1 = pcolor(t_span(t_offset:t_max_ind), glc_ext(glc_min_ind:glc_max_ind), y);
    set(p1, 'EdgeAlpha', pcolor_edge_alpha);

    if condition_index == 1
        title({'Flux v_{GLUT2} [µmol/min/kg]', '(HGP[-]/HGU[+])'}, 'FontWeight', 'bold', 'FontSize', 12), 
    end
    if condition_index == length(conditions)
        xlabel('t [min]', 'FontWeight', 'bold', 'FontSize', 11),
    end
    ylabel('glucose_{ext} [mM]', 'FontWeight', 'bold', 'FontSize', 11),

    %colorbar('peer',subplot2_1);
    caxis([-1.6 4.2])
    axis([t_min, t_max, glc_min, glc_max]);
    axis square


    % panel 2 - glycolysis and gluconeogenesis
    length(conditions)*(condition_index-1) + 2
    subplot2_2 = subplot(length(conditions), 3, 3*(condition_index-1) + 2);
    y = v_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 4);
    p2 = pcolor(t_span(t_offset:t_max_ind), glc_ext(glc_min_ind:glc_max_ind), y);
    set(p2, 'EdgeAlpha', pcolor_edge_alpha);
    
    if condition_index == 1
        %title({'v_{GPI} [µmol/min/kg]', '(gluconeo. [-] / glycolysis [+])'}, 'FontWeight', 'bold', 'FontSize', 12), 
        title({'v_{GPI} [µmol/min/kg]'}, 'FontWeight', 'bold', 'FontSize', 12), 
    end
    if condition_index == length(conditions)
        xlabel('t [min]', 'FontWeight', 'bold', 'FontSize', 11),
    end
    % ylabel('glucose_{ext} [mM]', 'FontWeight', 'bold', 'FontSize', 11),

    %colorbar('peer',subplot2_2);
    caxis([-1.6 4.2])
    axis([t_min, t_max, glc_min, glc_max])
    axis square


    % panel 3 - glycogenolyis and glycogen synthesis
    length(conditions)*(condition_index-1) + 3
    subplot2_3 = subplot(length(conditions), 3, 3*(condition_index-1) + 3);
    y = -v_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 5);
    p3 = pcolor(t_span(t_offset:t_max_ind), glc_ext(glc_min_ind:glc_max_ind), y);
    set(p3, 'EdgeAlpha', pcolor_edge_alpha);
    if condition_index == 1
        %title({'- v_{G1P1} [µmol/min/kg]', '(glycogenolysis [-] / glycogen synthesis [+])'}, 'FontWeight', 'bold', 'FontSize', 12), 
        title({'- v_{G1P1} [µmol/min/kg]'}, 'FontWeight', 'bold', 'FontSize', 12), 
    end
    if condition_index == length(conditions)
        xlabel('t [min]', 'FontWeight', 'bold', 'FontSize', 11),
    end
    %ylabel('glucose_{ext} [mM]', 'FontWeight', 'bold', 'FontSize', 11),

    %colorbar('peer',subplot2_3);
    caxis([-1.6 4.2])
    axis([t_min, t_max, glc_min, glc_max])
    axis square
end


% save the image
if save_images==1
    disp('* fig3 saved')
    fig_file = strcat(in_file, '_fig3.png')
    saveas(fig3, fig_file,'png'); 
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% figure4 - glycogen (pcolor)
fig4 = figure('Name', 'glycogen pcolor', 'Color', [1 1 1]);
for condition_index = 1:length(conditions)
    condition = conditions(condition_index);
    
    % load data
    in_file = in_files{condition_index}
    load(in_file);
    
    % indeces of boundaries
    tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
    tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
    tmp = find(t_span>=t_max); t_max_ind = tmp(1);
    t_min_ind = t_offset;
    t_min = 0;
    
    subplot(length(mpars.conditions),1,condition_index);
    % panel 4 - glycogen metabolism 
    y = c_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 17);
    p1 = pcolor(t_span(t_offset:t_max_ind), glc_ext(glc_min_ind:glc_max_ind), y);
    set(p1, 'EdgeAlpha', pcolor_edge_alpha);

    if condition_index == 1
        title('glycogen [mM]', 'FontWeight', 'bold', 'FontSize', 12),
    end
    if condition_index == length(conditions)
        xlabel('t [min]', 'FontWeight', 'bold', 'FontSize', 11),
    end
    %ylabel('glucose_{ext} [mM]', 'FontWeight', 'bold', 'FontSize', 11),

    colorbar('peer', gca);
    caxis([0 500])
    axis([t_min, t_max, glc_min, glc_max]);
    axis square

end
% save the image
if save_images==1
    disp('* fig4 saved')
    fig_file = strcat(in_file, '_fig4.png')
    saveas(fig4, fig_file,'png'); 
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





