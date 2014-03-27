close all
clc 

if (nargin~=1)
    file = '/home/mkoenig/Desktop/kinetic_model_results/simulations/120629_data/Hypoglycemia/hypoglycemia_i30_a5.mat'
end
load(file);

x_lim = [-20 130];
y_lim_gu = [0 6];


xNames = names_s;
vNames = names_v;
Nx = length(names_s);
Nv = length(names_v);

%% Plot the concentrations
fig_concentrations = figure('Name', 'Concentrations', 'Position', [0 0 1600 1600], 'Color', [1 1 1])
conditions = {  'normal'
                'diabetes'};
set(gcf,'DefaultAxesColorOrder',[0 0 0;0 0 1;1 0 0])
Rows = 5;
Columns = 5;
s_interest = [4 5 15:29 31 37 39 43 44];
for ks=1:length(s_interest)
    kx = s_interest(ks);
    subplot(Rows,Columns,ks)
    
    y = [];
    for kc = 1:length(conditions)
        condition = conditions{kc};
        data = getfield(fdata, condition);
        x = data.tAll - sim.t_add_start;
        y = [y data.cAll(kx,:)'];
    end
    ptmp = plot(x, y);
    ylabel(strcat(xNames{kx}, ' [mM]'));  
    set(ptmp, 'LineWidth', 2);
  
    axis square
    if (ks > (Rows-1)*Columns)
        xlabel('t [min]')
    end
    xlim(x_lim);
    %ylim([0 1.1*max(y)])
end
bold_subplots();
scale_subplots(1.001);
name = 'Hypoglycemia_Concentrations';
file_tmp = strcat('/home/mkoenig/Desktop/figures/', name, '.tif');
set(gcf,'PaperPositionMode','auto')
print(fig_concentrations, file_tmp, '-dtiff', '-r70')

%% Plot the fluxes
fig_fluxes = figure('Name', 'Concentrations', 'Position', [0 0 1600 1600], 'Color', [1 1 1])
conditions = {  'normal'
                'diabetes'};
set(gcf,'DefaultAxesColorOrder',[0 0 0;0 0 1;1 0 0])
Rows = 5;
Columns = 6;
v_interest = [1:9 11 13:23 25:33];
Ntest = length(v_interest)
for ks=1:length(v_interest)
    kv = v_interest(ks);
    subplot(Rows,Columns,ks)
    y = [];
    for kc = 1:length(conditions)
        condition = conditions{kc};
        data = getfield(fdata, condition);
        x = data.tAll - sim.t_add_start;
        y = [y data.vAll(kv,:)'];
    end
    ptmp = plot(x, y);
    ylabel(strcat(vNames{kv}));  
    set(ptmp, 'LineWidth', 2);
  
    axis square
    if (kv > (Rows-1)*Columns)
        xlabel('t [min]')
    end
    xlim(x_lim);
    %ylim([0 1.1*max(y)])
end
bold_subplots();
scale_subplots(1.001);
name = 'Hypoglycemia_Fluxes';
file_tmp = strcat('/home/mkoenig/Desktop/figures/', name, '.tif');
set(gcf,'PaperPositionMode','auto')
print(fig_fluxes, file_tmp, '-dtiff', '-r70')
