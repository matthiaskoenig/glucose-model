function [] = fig_glucose_glycogen_dependency_nullklines()
%% Plots Nullklines for the various insulin treatments.

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110315  -   v0.1

close all
clear all

% Simulation Settings
in_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110314_data/glucose_insulin_treatment/T2DM'
in_ins_restored = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110314_data/glucose_glycogen_dependency/T2DM/glucose_glycogen_dependency_insulin_restored'
in_glu_restored = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110314_data/glucose_glycogen_dependency/T2DM/glucose_glycogen_dependency_glucagon_restored'

%% Select range for plot
% plot boundaries (values have to exist)
glc_min = 2;            % glucose minial concentration
glc_max = 19.5;           % glucose maximal concentration
glycogen_min = 0;       % glycogen minimal concentration
glycogen_max = 500;     % glycogen maximal concentration
t_eval = 100;               % time point of evaluation

axis_range = [2 18 0 500];

% Colors for therapies
constant_color = [  0  0  0
                    0  0  1
                    0.5 0 0.5
                    0.6 0 0.6
                    0.7 0 0.7
                    0.8 0 0.8
                 ];
linear_color = [    0  0  0
                    0  0  1
                    0 0.4 0
                    0 0.53 0
                    0 0.66 0
                    0 0.8 0
                    ];
                
fig5 = figure('Name','nullklines HGP/HGU', 'Color',[1 1 1]);
treatment_num  = 4 + 2;                      % number of different treatments
treatment_types = {'linear_addition', 'constant_addition'}
for tindex =1:length(treatment_types)
    treatment_type = treatment_types{tindex};
    

    
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

    % nullklines
    in_file = in_files{1}
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
    
    x = glc_ext(glc_min_ind:glc_max_ind);
    y = glycogen(glycogen_min_ind:glycogen_max_ind);
    ccolor_grey = [1.0 0 0];
    clines = [-50 0 50];
    
    % panel 1 - HGP and HGU
    subplot(1, 3, 1);
    % Normal, diabetes and treatments
    for treatment_ind = 1:treatment_num
        % load data
        in_file = in_files{treatment_ind}
        load(in_file);

        % panel 1 - HGP and HGU
        z = v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 1);
        switch treatment_type
            case 'linear_addition'
                contour_color = linear_color(treatment_ind, :);
            case 'constant_addition'
                contour_color = constant_color(treatment_ind, :);
        end
        if treatment_ind == 1 || treatment_ind == 2
            c = contour(x,y,z', clines, 'k-', 'LineColor', contour_color, 'LineWidth', 2.0); hold on
        else
            c = contour(x,y,z', clines, 'k-', 'LineColor', contour_color, 'LineWidth', 2.0); hold on
        end
    end

    % Insulin and glucagon restored
    for k = 1:2
        % load data
        if k==1
            in_file = in_ins_restored;
        elseif k==2
            in_file = in_glu_restored;
        end
        load(in_file);
        z = v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 1);
        if k==1
            c = contour(x,y,z',clines, '-', 'LineColor', ccolor_grey, 'LineWidth', 2.0); hold on
        elseif k==2
            c = contour(x,y,z',clines, '--', 'LineColor', ccolor_grey, 'LineWidth', 2.0); hold on
        end
    end
    axis square
    grid on
    axis([5 11 0 500])
    %axis(axis_range)
    ylabel('glycogen [mm]')
    xlabel('glucose [mM]')
    set(gca,'xTick', 4:1:11)

    
    % panel 2 - gluconeogenesis/glycolysis
    subplot(1, 3, 2);
    % Normal, diabetes and treatments
    for treatment_ind = 1:treatment_num
        % load data
        in_file = in_files{treatment_ind};
        load(in_file);
        z = v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind,  t_eval_ind, 4);
        switch treatment_type
            case 'linear_addition'
                contour_color = linear_color(treatment_ind, :);
            case 'constant_addition'
                contour_color = constant_color(treatment_ind, :);
        end
        if treatment_ind == 1 || treatment_ind == 2
            c = contour(x,y,z', clines, 'k-', 'LineColor', contour_color, 'LineWidth', 2.0); hold on
        else
            c = contour(x,y,z', clines, 'k-', 'LineColor', contour_color, 'LineWidth', 2.0); hold on
        end

    end
    % Insulin and glucagon restored
    for k = 1:2
        % load data
        if k==1
            in_file = in_ins_restored;
        elseif k==2
            in_file = in_glu_restored;
        end
        load(in_file);

        z = v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 4);
        if k==1
            c = contour(x,y,z', clines, '-', 'LineColor', ccolor_grey, 'LineWidth', 2.0); hold on
        elseif k==2
            c = contour(x,y,z', clines, '--', 'LineColor', ccolor_grey, 'LineWidth', 2.0); hold on
        end
    end
    axis square
    shading interp
    grid on
    axis(axis_range)
    axis([6 14 0 500])
    set(gca,'xTick', 6:2:14)
    xlabel('glucose [mM]')


    % panel 3 : glycogenolysis / glycogen synthesis
    subplot(1, 3, 3);
    % Normal, diabetes and treatments
    for treatment_ind = 1:treatment_num
        % load data
        in_file = in_files{treatment_ind};
        load(in_file);

        z = -v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 5);
        switch treatment_type
            case 'linear_addition'
                contour_color = linear_color(treatment_ind, :);
            case 'constant_addition'
                contour_color = constant_color(treatment_ind, :);
        end
        if treatment_ind == 1 || treatment_ind == 2
            c = contour(x,y,z', clines, 'k-', 'LineColor', contour_color, 'LineWidth', 2.0); hold on
        else
            c = contour(x,y,z', clines, 'k-', 'LineColor', contour_color, 'LineWidth', 2.0); hold on
        end
    end
    % Insulin and glucagon restored
    for k = 1:2
        % load data
        if k==1
            in_file = in_ins_restored;
        elseif k==2
            in_file = in_glu_restored;
        end
        load(in_file);

        z = -v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 5);
        if k==1
            c = contour(x,y,z', clines, '-', 'LineColor', ccolor_grey, 'LineWidth', 2.0); hold on
        elseif k==2
            c = contour(x,y,z', clines, '--', 'LineColor', ccolor_grey, 'LineWidth', 2.0); hold on
        end
    end
    axis square
    grid on
    axis([2 12 0 500])
    xlabel('glucose [mM]')
    set(gca,'xTick', 2:2:12)


end



