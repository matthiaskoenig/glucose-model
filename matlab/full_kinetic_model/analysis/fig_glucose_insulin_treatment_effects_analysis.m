function y = fig_glucose_insulin_treatment_analysis()
%% Creates the one dimensional figures of the insulin treatment effects

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110315  -   v0.1

close all
clear all

% Simulation Settings
in_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110314_data/glucose_insulin_treatment/T2DM'
%in_sleep 
%'/home/mkoenig/Desktop/kinetic_model_results/simulations/110303_data/glucose_insulin_treatment/sleep_epi_extreme_T2DM/no_treatment_1'
in_ins_restored = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110314_data/glucose_glycogen_dependency/T2DM/glucose_glycogen_dependency_insulin_restored'
in_glu_restored = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110314_data/glucose_glycogen_dependency/T2DM/glucose_glycogen_dependency_glucagon_restored'

%% Select range for plot
% plot boundaries (values have to exist)
glc_min = 2;            % glucose minial concentration
glc_max = 14.2;           % glucose maximal concentration
glycogen_min = 0;       % glycogen minimal concentration
glycogen_max = 500;     % glycogen maximal concentration
t_eval = 100;           % time point of evaluation
treatment_num  = 4;     % number of simulated treatments
xticks = (glc_min:2:18);


conditions = {'linear_addition', 'constant_addition'};
weighted = false;      % use the glucose flux as weight for the GRC

% Colors for therapies
constant_color = [  0.5 0 0.5
                    0.6 0 0.6
                    0.7 0 0.7
                    0.8 0 0.8
                 ];
linear_color = [    0 0.4 0
                    0 0.53 0
                    0 0.66 0
                    0 0.8 0
                    ];
                
%z_type = 'GRC';
z_type = 'GLUT2';

switch z_type
    case 'GRC'
        axis_range1 = [glc_min glc_max-0.2 0 9.5];
        axis_range2 = [glc_min glc_max-0.2 0 9.5];
    case 'GLUT2'
        axis_range1 = [glc_min glc_max-0.2 -30 30];
        axis_range2 = [glc_min glc_max-0.2 -30 30];
end

% Make figure
fig1 = figure('Name','Linear insulin treatments', 'Color',[1 1 1]);
sp1 = subplot(2,2,1)
sp2 = subplot(2,2,2)
sp3 = subplot(2,2,3)
sp4 = subplot(2,2,4)




%% load the normal case
in_file  = strcat(in_folder, '/normal_1');
load(in_file);
% data for all simulations
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

% plot normal data
    % insert normal data
    % 250 value
    switch z_type
    case 'GRC'
        y = squeeze(v_full(glc_min_ind:glc_max_ind, glycogen_250_ind, t_eval_ind, 1));
        z = zeros(size(y));
        z(1:end-1) = ( y(2:end)-y(1:end-1) )'./( glc_ext(glc_min_ind+1:glc_max_ind)-glc_ext(glc_min_ind:glc_max_ind-1) );
        if weighted
            z = z.*y;
        end
    case 'GLUT2'
        z = v_full(glc_min_ind:glc_max_ind, glycogen_250_ind, t_eval_ind, 1);
    end
    
    set(fig1, 'CurrentAxes', sp1)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, 'k-'); hold on
    set(ptmp,'LineWidth',2.0);
    set(fig1, 'CurrentAxes', sp2)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, 'k-'); hold on
    set(ptmp,'LineWidth',2.0);

    % mean value
    switch z_type
    case 'GRC'
        y = squeeze(mean(v_full(glc_min_ind:glc_max_ind, : , t_eval_ind, 1), 2));
        z = zeros(size(y));
        z(1:end-1) = ( y(2:end)-y(1:end-1) )'./( glc_ext(glc_min_ind+1:glc_max_ind)-glc_ext(glc_min_ind:glc_max_ind-1) );
        if weighted
            z = z.*y;
        end
    case 'GLUT2'
        z = mean(v_full(glc_min_ind:glc_max_ind, : , t_eval_ind, 1), 2);
    end

    set(fig1, 'CurrentAxes', sp3)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, 'k-'); hold on
    set(ptmp,'LineWidth',2.0);
    set(fig1, 'CurrentAxes', sp4)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, 'k-'); hold on
    set(ptmp,'LineWidth',2.0);

% load the untreated diabetic type
in_file = strcat(in_folder, '/no_treatment_1')
load(in_file);
    % 250 value
    switch z_type
    case 'GRC'
        y = squeeze(v_full(glc_min_ind:glc_max_ind, glycogen_250_ind, t_eval_ind, 1));
        z = zeros(size(y));
        z(1:end-1) = ( y(2:end)-y(1:end-1) )'./( glc_ext(glc_min_ind+1:glc_max_ind)-glc_ext(glc_min_ind:glc_max_ind-1) );
        if weighted
            z = z.*y;
        end
    case 'GLUT2'
        z = v_full(glc_min_ind:glc_max_ind, glycogen_250_ind, t_eval_ind, 1);
    end
    set(fig1, 'CurrentAxes', sp1)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, 'b-'); hold on
    set(ptmp,'LineWidth',2.0);
    set(fig1, 'CurrentAxes', sp2)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, 'b-'), hold on
    set(ptmp,'LineWidth',2.0);

    % mean value
    switch z_type
    case 'GRC'
        y = squeeze(mean(v_full(glc_min_ind:glc_max_ind, : , t_eval_ind, 1), 2));
        z = zeros(size(y));
        z(1:end-1) = ( y(2:end)-y(1:end-1) )'./( glc_ext(glc_min_ind+1:glc_max_ind)-glc_ext(glc_min_ind:glc_max_ind-1) );
        if weighted
            z = z.*y;
        end
    case 'GLUT2'
        z = mean(v_full(glc_min_ind:glc_max_ind, : , t_eval_ind, 1), 2);
    end
    
    set(fig1, 'CurrentAxes', sp3)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, 'b-'), hold on
    set(ptmp,'LineWidth',2.0);
    set(fig1, 'CurrentAxes', sp4)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, 'b-'), hold on
    set(ptmp,'LineWidth',2.0);

%% Calculate the mean and glycogen 250 data and plot in according subplot
for c_ind = 1:length(conditions) 
    for treatment_ind = 1:treatment_num
            condition = conditions{c_ind};
            in_file  = strcat(in_folder, '/', condition, '_', num2str(treatment_ind));
            load(in_file);
        
            % 250 value
            switch z_type
            case 'GRC'
                y = squeeze(v_full(glc_min_ind:glc_max_ind, glycogen_250_ind, t_eval_ind, 1));
                z = zeros(size(y));
                z(1:end-1) = ( y(2:end)-y(1:end-1) )'./( glc_ext(glc_min_ind+1:glc_max_ind)-glc_ext(glc_min_ind:glc_max_ind-1) );
                if weighted
                    z = z.*y;
                end
            case 'GLUT2'
                z = v_full(glc_min_ind:glc_max_ind, glycogen_250_ind, t_eval_ind, 1);
            end
            switch condition
                case 'linear_addition'
                    set(fig1, 'CurrentAxes', sp1)
                    tcolor = linear_color(treatment_ind,:);
                case 'constant_addition'
                    set(fig1, 'CurrentAxes', sp2)
                    tcolor = constant_color(treatment_ind,:);
            end
            ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, 'Color', tcolor); hold on
            set(ptmp, 'LineWidth', 2.0)
            
            
            % mean value
            switch z_type
            case 'GRC'
                y = squeeze(mean(v_full(glc_min_ind:glc_max_ind, : , t_eval_ind, 1), 2));
                z = zeros(size(y));
                z(1:end-1) = ( y(2:end)-y(1:end-1) )'./( glc_ext(glc_min_ind+1:glc_max_ind)-glc_ext(glc_min_ind:glc_max_ind-1) );
                if weighted
                    z = z.*y;
                end
            case 'GLUT2'
                z = mean(v_full(glc_min_ind:glc_max_ind, : , t_eval_ind, 1), 2);
            end
            
            switch condition
                case 'linear_addition'
                    set(fig1, 'CurrentAxes', sp3)
                case 'constant_addition'
                    set(fig1, 'CurrentAxes', sp4)
            end
            ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, 'Color', tcolor), hold on
            set(ptmp, 'LineWidth', 2.0)
    end
end


% Load insulin restored
in_file = in_ins_restored;
load(in_file);
% data for all simulations
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

%ins_restored_color = [1 0.4 0];
%glu_restored_color = [1 0.4 0];
ins_restored_color = [1 0 0];
glu_restored_color = [1 0 0];

    % 250 value
    switch z_type
    case 'GRC'
        y = squeeze(v_full(glc_min_ind:glc_max_ind, glycogen_250_ind, t_eval_ind, 1));
        z = zeros(size(y));
        z(1:end-1) = ( y(2:end)-y(1:end-1) )'./( glc_ext(glc_min_ind+1:glc_max_ind)-glc_ext(glc_min_ind:glc_max_ind-1) );
        if weighted
            z = z.*y;
        end
    case 'GLUT2'
        z = v_full(glc_min_ind:glc_max_ind, glycogen_250_ind, t_eval_ind, 1);
    end
    set(fig1, 'CurrentAxes', sp1)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, '-', 'Color', ins_restored_color); hold on
    set(ptmp, 'LineWidth', 2.0)
    set(fig1, 'CurrentAxes', sp2)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, '-', 'Color', ins_restored_color); hold on
    set(ptmp, 'LineWidth', 2.0)
    
    % mean value
    switch z_type
    case 'GRC'
        y = squeeze(mean(v_full(glc_min_ind:glc_max_ind, : , t_eval_ind, 1), 2));
        z = zeros(size(y));
        z(1:end-1) = ( y(2:end)-y(1:end-1) )'./( glc_ext(glc_min_ind+1:glc_max_ind)-glc_ext(glc_min_ind:glc_max_ind-1) );
        if weighted
            z = z.*y;
        end
    case 'GLUT2'
        z = mean(v_full(glc_min_ind:glc_max_ind, : , t_eval_ind, 1), 2);
    end
    
    set(fig1, 'CurrentAxes', sp3)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, '-', 'Color', ins_restored_color); hold on
    set(ptmp, 'LineWidth', 2.0)
    set(fig1, 'CurrentAxes', sp4)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z,'-',  'Color', ins_restored_color); hold on    
    set(ptmp, 'LineWidth', 2.0)

% Load glucagon restored
in_file = in_glu_restored;
load(in_file);
    % 250 value
    switch z_type
    case 'GRC'
        y = squeeze(v_full(glc_min_ind:glc_max_ind, glycogen_250_ind, t_eval_ind, 1));
        z = zeros(size(y));
        z(1:end-1) = ( y(2:end)-y(1:end-1) )'./( glc_ext(glc_min_ind+1:glc_max_ind)-glc_ext(glc_min_ind:glc_max_ind-1) );
        if weighted
            z = z.*y;
        end
    case 'GLUT2'
        z = v_full(glc_min_ind:glc_max_ind, glycogen_250_ind, t_eval_ind, 1);
    end
    set(fig1, 'CurrentAxes', sp1)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z,'--',  'Color', glu_restored_color), hold on
    set(ptmp, 'LineWidth', 2.0)
    set(fig1, 'CurrentAxes', sp2)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, '--', 'Color', glu_restored_color), hold on
    set(ptmp, 'LineWidth', 2.0)
    
    % mean value
    switch z_type
    case 'GRC'
        y = squeeze(mean(v_full(glc_min_ind:glc_max_ind, : , t_eval_ind, 1), 2));
        z = zeros(size(y));
        z(1:end-1) = ( y(2:end)-y(1:end-1) )'./( glc_ext(glc_min_ind+1:glc_max_ind)-glc_ext(glc_min_ind:glc_max_ind-1) );
        if weighted
            z = z.*y;
        end
    case 'GLUT2'
        z = mean(v_full(glc_min_ind:glc_max_ind, : , t_eval_ind, 1), 2);
    end
    
    set(fig1, 'CurrentAxes', sp3)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, '--', 'Color', glu_restored_color), hold on
    set(ptmp, 'LineWidth', 2.0)
    set(fig1, 'CurrentAxes', sp4)
    ptmp = plot(glc_ext(glc_min_ind:glc_max_ind), z, '--', 'Color', glu_restored_color), hold on    
    set(ptmp, 'LineWidth', 2.0)


    
%% Define the axis    
set(fig1, 'CurrentAxes', sp1)
%title('linear insulin therapy: glycogen 250mM', 'FontWeight', 'bold')
switch z_type
    case 'GRC'
        ylabel('HGRC [µmol/kg/min/mM]')
    case 'GLUT2'
        ylabel('HGP/HGU [µmol/kg/min]')
end
xlabel('glucose [mM]')
%legend('normal', 'T2DM', 'T1', 'T2', 'T3', 'T4', 'insulin restored', 'glucagon restored')
axis(axis_range1)
axis square
set(gca,'xTick', xticks)
grid on

set(fig1, 'CurrentAxes', sp2)
%title('constant insulin therapy: glycogen 250mM')
switch z_type
    case 'GRC'
        ylabel('HGRC [µmol/kg/min/mM]')
    case 'GLUT2'
        ylabel('HGP/HGU [µmol/kg/min]')
end
xlabel('glucose [mM]')
axis(axis_range1)
axis square
set(gca,'xTick', xticks)
grid on

set(fig1, 'CurrentAxes', sp3)
%title('linear insulin therapy: mean glycogen', 'FontWeight', 'bold')
switch z_type
    case 'GRC'
        ylabel('HGRC [µmol/kg/min/mM]')
    case 'GLUT2'
        ylabel('HGP/HGU [µmol/kg/min]')
end
xlabel('glucose [mM]')
axis(axis_range2)
axis square
set(gca,'xTick', xticks)
grid on

set(fig1, 'CurrentAxes', sp4)
%title('constant insulin therapy: mean glycogen', 'FontWeight', 'bold')
switch z_type
    case 'GRC'
        ylabel('HGRC [µmol/kg/min/mM]')
    case 'GLUT2'
        ylabel('HGP/HGU [µmol/kg/min]')
end
xlabel('glucose [mM]')
axis(axis_range2)
axis square
set(gca,'xTick', xticks)
grid on

end