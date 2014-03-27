% Fit the glycolysis response curves with polynoms to reuse in other models
clear all, close all

%% Load the data for analysis (dependendy glucose and glycogen)
% data is analysed in combination with the simulation results
in_folder = '/home/mkoenig/Science/projects/kinetic_model_results/simulations/120307_data/glucose_glycogen_dependency'
conditions = {'normal', 'diabetes', 'insulin_restored', 'glucagon_restored'}

condition = 'normal' 
in_file = strcat(in_folder,  '/glucose_glycogen_dependency_', condition);
load(in_file);
    
glc_ext  = mpars.glc_ext;
glycogen = mpars.glycogen;
t_span   = mpars.t_span;

% indeces of boundaries
    t_eval = 100;           % time point of evaluation
    % glc_min = glc_ext(1); glc_max = glc_ext(end);
    glc_min = glc_ext(1); glc_max = 11;
    glycogen_min = glycogen(1); glycogen_max = glycogen(end);
    
    tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
    tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
    tmp = find(glycogen>=glycogen_min); glycogen_min_ind = tmp(1);
    tmp = find(glycogen<=glycogen_max); glycogen_max_ind = tmp(end);
    tmp = find(glycogen>=250); glycogen_250_ind = tmp(1);
    tmp = find(t_span>=t_eval); t_eval_ind = tmp(1);

    x = glc_ext(glc_min_ind:glc_max_ind);
    y = glycogen(glycogen_min_ind:glycogen_max_ind);
    
    % panel 1 - HGP and HGU
    z1 = v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 1);

    % panel 2 - glycolysis and gluconeogenesis
    z2 = v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind,  t_eval_ind, 4);
    
    % panel 3 - glycogenolyis and glycogen synthesis
    z3 = -v_full(glc_min_ind:glc_max_ind, glycogen_min_ind:glycogen_max_ind, t_eval_ind, 5);
    

 
%% Fit the test data sets and plot the results
fit_z1 = zeros(length(x), length(y));
fit_z2 = zeros(length(x), length(y));
fit_z3 = zeros(length(x), length(y));
indepvar  = zeros(length(x)*length(y), 2);
depvar_z1 = zeros(length(x)*length(y), 1);
depvar_z2 = zeros(length(x)*length(y), 1);
depvar_z3 = zeros(length(x)*length(y), 1);
counter = 1;
for i = 1:length(x)
    for k = 1:length(y)
        indepvar(counter,1) = x(i);
        indepvar(counter,2) = y(k);
        depvar_z1(counter,1) = z1(i,k);
        depvar_z2(counter,1) = z2(i,k);
        depvar_z3(counter,1) = z3(i,k);
        counter = counter + 1;
    end
end

% Fit polynom and calculation of the actual values
 modelterms = 3;
 polymodel_z1 = polyfitn(indepvar,depvar_z1,modelterms)
 polymodel_z1.Coefficients
 polymodel_z2 = polyfitn(indepvar,depvar_z2,modelterms)
 polymodel_z2.Coefficients
 polymodel_z3 = polyfitn(indepvar,depvar_z3,modelterms)
 polymodel_z3.Coefficients
 polymodel_z3.ModelTerms
 ypred_z1 = polyvaln(polymodel_z1, indepvar);
 ypred_z2 = polyvaln(polymodel_z2, indepvar);
 ypred_z3 = polyvaln(polymodel_z3, indepvar);
 counter = 1
 
 % Compare with calculated fit curves
 fs = fit_curves_glucose_metabolism();
 
 for i = 1:length(x)
     for k = 1:length(y)
         fit_z1(i,k) = ypred_z1(counter);
         fit_z1(i,k) = fs.z1(x(i), y(k));
         fit_z2(i,k) = ypred_z2(counter);
         fit_z2(i,k) = fs.z2(x(i), y(k));
         fit_z3(i,k) = ypred_z3(counter);
         fit_z3(i,k) = fs.z3(x(i), y(k));
         counter = counter + 1;
     end
 end

 %% Plot the test data and the resulting fit
 edge_alpha = 0.1;
 %surf_axis  = [0 12 0 15 0 1];      % axis scale for response complex and simple
 %surf_axis_fit = [0 12 0 15 0 1];   % axis scale for difference
 figure(1)
 figure('Name', '3D polynomal fit', 'Color', [1 1 1], 'OuterPosition', [0 0 800 1600])
 for k=1:9
    subplot(3,3,k)
    switch k
        case 1
            % panel 1 - HGP and HGU
            p1 = surf(x,y,z1');
            title('HGP & HGU', 'FontWeight', 'bold')
        case 2
            % panel 2 - glycolysis and gluconeogenesis
            p1 = surf(x,y,z2');
            title('Glycolysis', 'FontWeight', 'bold')
        case 3
            % panel 3 - glycogenolyis and glycogen synthesis
            p1 = surf(x,y,z3');
            title('Glycogenolysis', 'FontWeight', 'bold')
            zlim([-30 30])
            
        case 4
            p1 = surf(x,y,fit_z1');
            title('simple', 'FontWeight', 'bold')
        case 5
            p1 = surf(x,y,fit_z2');
            title('simple', 'FontWeight', 'bold')
        case 6
            p1 = surf(x,y,fit_z3');
            title('simple', 'FontWeight', 'bold')
            zlim([-30 30])
        
        zlim_lim = 20;
        case 7
            p1 = surf(x,y,z1'-fit_z1');
            title('Difference', 'FontWeight', 'bold')
            zlim([-zlim_lim, zlim_lim])
        case 8
            p1 = surf(x,y,z2'-fit_z2');
            title('Difference', 'FontWeight', 'bold')
            zlim([-zlim_lim, zlim_lim])
        case 9
            p1 = surf(x,y,z3'-fit_z3');
            title('Difference', 'FontWeight', 'bold')       
            zlim([-zlim_lim, zlim_lim])
                 
    end
    set(p1, 'EdgeAlpha', edge_alpha)
    xlabel('glucose [mM]')
    ylabel('glycogen [mM]')
    zlabel('v [µmol/kg/min]')
    axis square
    xlim([2, 12])
    ylim([0, 500])
    
 end
 
 % Bold all subplots
 bold_subplots();
