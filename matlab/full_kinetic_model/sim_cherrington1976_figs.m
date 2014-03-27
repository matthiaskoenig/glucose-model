function [] = sim_cherrington1976_figs(file)
% Figures for the evaluation of the cherrington simulations
close all
if (nargin~=1)
    file = 'Cherrington1976_v2.mat'
end
load(file);

simulations = { 'saline'
                'somatostatin' 
                'insulin_replacement'
                'glucagon_replacement'
                'somatostatin_replacement'
              };
        

% Plot the results for the single simulations
% TODO: mean change in HGP during treatments
% TODO: real timecourses of hormomes and GU changes
% TODO: plot the error bars for the experimental data

% Basal glucose production
pbgp_sim = zeros(1,length(simulations));
pbgp_exp = zeros(1,length(simulations));
pbgp_sx = zeros(1,length(simulations));
pbgp_sim_e = zeros(1,length(simulations));
pbgp_exp_e = zeros(1,length(simulations));
pbgp_sx_e = zeros(1,length(simulations));

pbgp_sim_netto = zeros(1,length(simulations));
pbgp_exp_netto = zeros(1,length(simulations));
pbgp_sx_netto = zeros(1,length(simulations));
pbgp_sim_netto_e = zeros(1,length(simulations));
pbgp_exp_netto_e = zeros(1,length(simulations));
pbgp_sx_netto_e = zeros(1,length(simulations));


width=550;
msize = 4;

for k_sim = 1:length(simulations)    
    sim = simulations{k_sim}
    data = getfield(fdata, sim);
    data_sx = getfield(fdata_sx, sim); 

    % plot the important information
    switch sim        
        case 'saline'
            fig1 = figure('Name', 'Cherrington1976 - Saline', 'Position',[0 1080-width width width]);
        case 'somatostatin'
            fig2 = figure('Name', 'Cherrington1976 - Somatostatin', 'Position',[width 1080-width width width]);
        case 'insulin_replacement'
            fig3 = figure('Name', 'Cherrington1976 - Insulin Replacement', 'Position', [2*width 1080-width width width]);
        case 'glucagon_replacement'
            fig4 = figure('Name', 'Cherrington1976 - Glucagon Replacement', 'Position',[1920 1080-width width width]);
        case 'somatostatin_replacement'
            fig5 = figure('Name', 'Cherrington1976 - Somatostatin Replacement', 'Position',[1920+width 1080-width width width]);
    end
    
    %xlim_data = [2 100];
    xlim_data = [90 220];
    expdata = sim_cherrington1976_data(sim);
    
    %%
    % Insulin & Glucagon simulation
    subplot(3,3,1)
    ymax = 1.2*max(ins_max, glu_max);
    ymin = 0;
    fill([inf_t_start inf_t_end inf_t_end inf_t_start], [ymin ymin ymax ymax],[0.95, 0.95 0.95], 'EdgeColor', [1 1 1]);
    line([inf_t_start inf_t_start], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    line([inf_t_end inf_t_end], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    hold on
    plot(t_data, data.ins_sim, 'bs-', 'MarkerFaceColor', 'b', 'MarkerSize', msize)
    hold on
    plot(t_data, data.glu_sim, 'rs-', 'MarkerFaceColor', 'r', 'MarkerSize', msize)
    ylabel({'Insulin (b) & Glucagon (r)', '[pmol/l]'});
    axis([xlim_data(1) xlim_data(2) ymin ymax])
    axis square;
    title('Simulation 1')
    
    % Insulin & Glucagon data
    subplot(3,3,2)
    ymax = 1.2*max(max(expdata.ins_data), max(expdata.glu_data));
    ymin = 0;
    fill([inf_t_start inf_t_end inf_t_end inf_t_start], [ymin ymin ymax ymax],[0.95, 0.95 0.95], 'EdgeColor', [1 1 1]);
    line([inf_t_start inf_t_start], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    line([inf_t_end inf_t_end], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    hold on
    errorbar(expdata.ins_t, expdata.ins_data, expdata.ins_sem, 'bs-', 'MarkerFaceColor', 'b', 'MarkerSize', msize);
    hold on
    errorbar(expdata.glu_t, expdata.glu_data, expdata.glu_sem, 'rs-', 'MarkerFaceColor', 'r', 'MarkerSize', msize);
    hold off
    title(sim)
    axis([xlim_data(1) xlim_data(2) ymin ymax])
    axis square;
    title('Experiment')
    
    % Insulin & Glucagon simulation with exp time course
    subplot(3,3,3)
    ymax = 1.2*max(max(data_sx.ins_sx), max(data_sx.glu_sx));
    
    
    
    ymin = 0;
    fill([inf_t_start inf_t_end inf_t_end inf_t_start], [ymin ymin ymax ymax],[0.95, 0.95 0.95], 'EdgeColor', [1 1 1]);
    line([inf_t_start inf_t_start], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    line([inf_t_end inf_t_end], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    hold on
    plot(t_data, data_sx.ins_sx, 'bs-', 'MarkerFaceColor', 'b', 'MarkerSize', msize)
    hold on
    plot(t_data, data_sx.glu_sx, 'rs-', 'MarkerFaceColor', 'r', 'MarkerSize', msize)
    axis([xlim_data(1) xlim_data(2) ymin ymax])
    axis square;
    title('Simulation 2')
    
    %%
    % HGP & GU simulation
    subplot(3,3,4)
    ymin = 0.9*min(min(data.gp_sim), min(data.gu_sim));
    ymin = 0;
    ymax = 1.1*max(max(data.gp_sim), max(data.gu_sim));
    
    fill([inf_t_start inf_t_end inf_t_end inf_t_start], [ymin ymin ymax ymax],[0.95, 0.95 0.95], 'EdgeColor', [1 1 1]);
    line([inf_t_start inf_t_start], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    line([inf_t_end inf_t_end], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    hold on
    plot(t_data, data.gp_sim, 'rs-', 'MarkerFaceColor', 'r', 'MarkerSize', msize);
    hold on
    plot(t_data, data.gu_sim, 'ks-', 'MarkerFaceColor', 'k', 'MarkerSize', msize);
    ylabel({'HGP (r) & GU (b)', '[µmol/min/kg bw]'});
    axis([xlim_data(1) xlim_data(2) ymin ymax])
    axis square;
    
    % HGP & GU data
    subplot(3,3,5)
    ymin = 0.9*min(min(expdata.gp_data), min(expdata.gu_data));
    ymin = 0;
    ymax = 1.1*max(max(expdata.gp_data), max(expdata.gu_data));
    fill([inf_t_start inf_t_end inf_t_end inf_t_start], [ymin ymin ymax ymax],[0.95, 0.95 0.95], 'EdgeColor', [1 1 1]);
    line([inf_t_start inf_t_start], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    line([inf_t_end inf_t_end], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    hold on
    errorbar(expdata.gp_t, expdata.gp_data, expdata.gp_sem, 'rs-', 'MarkerFaceColor', 'r', 'MarkerSize', msize);
    hold on
    errorbar(expdata.gp_t, expdata.gu_data, expdata.gu_sem, 'ks-', 'MarkerFaceColor', 'k', 'MarkerSize', msize);
    hold off
    axis([xlim_data(1) xlim_data(2) ymin ymax])
    axis square;
    
    % HGP & GU simulation with exp time course
    subplot(3,3,6)
    ymin = 0.9*min(min(data.gp_sim), min(data.gu_sim));
    ymax = 1.1*max(max( data_sx.gp_sx), max( data_sx.gu_sx));
    fill([inf_t_start inf_t_end inf_t_end inf_t_start], [ymin ymin ymax ymax],[0.95, 0.95 0.95], 'EdgeColor', [1 1 1]);
    line([inf_t_start inf_t_start], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    line([inf_t_end inf_t_end], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    hold on
    plot(t_data, data_sx.gp_sx, 'rs-', 'MarkerFaceColor', 'r', 'MarkerSize', msize);
    hold on
    plot(t_data, data_sx.gu_sx, 'ks-', 'MarkerFaceColor', 'k', 'MarkerSize', msize);
    axis([xlim_data(1) xlim_data(2) 0 ymax])
    axis square;
    
    
    %%
    % Glucose extern simulation
    subplot(3,3,7)
    ymax = 9;
    ymin = 1
    
    fill([inf_t_start inf_t_end inf_t_end inf_t_start], [ymin ymin ymax ymax],[0.95, 0.95 0.95], 'EdgeColor', [1 1 1]);
    line([inf_t_start inf_t_start], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    line([inf_t_end inf_t_end], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    hold on
    
    plot(t_data, data.glc_sim, 'ks-', 'MarkerFaceColor', 'k', 'MarkerSize', msize);
    xlabel('time [min]')
    ylabel('glucose [mM]')
    axis([xlim_data(1) xlim_data(2) ymin ymax])
    
    %line([xlim_data(1) xlim_data(2)], [3 3], 'LineStyle', '--', 'Color', 'r')
    axis square
    
    % Glucose extern data
    subplot(3,3,8)
    %ymax = 9;
    %ymin = 3
    
    fill([inf_t_start inf_t_end inf_t_end inf_t_start], [ymin ymin ymax ymax],[0.95, 0.95 0.95], 'EdgeColor', [1 1 1]);
    line([inf_t_start inf_t_start], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    line([inf_t_end inf_t_end], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    hold on
    
    errorbar(expdata.glc_t, expdata.glc_data, expdata.glc_sem, 'ks-', 'MarkerFaceColor', 'k', 'MarkerSize', msize);
    xlabel('time [min]')
    xlim(xlim_data);
    axis([xlim_data(1) xlim_data(2) ymin ymax])
    

    axis square
    
    % Glucose extern simulation with external time course
    subplot(3,3,9)
    %ymax = 7.5;
    %ymin = 3
    fill([inf_t_start inf_t_end inf_t_end inf_t_start], [ymin ymin ymax ymax],[0.95, 0.95 0.95], 'EdgeColor', [1 1 1]);
    line([inf_t_start inf_t_start], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    line([inf_t_end inf_t_end], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    hold on
    
    plot(t_data, data_sx.glc_sx, 'ks-', 'MarkerFaceColor', 'k', 'MarkerSize', msize);
    xlabel('time [min]')
    axis([xlim_data(1) xlim_data(2) ymin ymax])
    
    axis square
    
    % Glycogen
%     ymin = 200;
%     ymax = 300;
%     subplot(4,2,7)
%     plot(data.t_sim, data.glycogen_sim, 'ks-');
%     title('Glycogen')
%     xlabel('time [min]')     
%     ylabel('glycogen [mM]')
%     axis([xlim_data(1) xlim_data(2) ymin ymax])
%     
%     line([inf_t_start inf_t_start], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
%     line([inf_t_end inf_t_end], [ymin ymax], 'LineStyle', '--', 'Color', 'k')
    
% Make the subplots bigger and bold
    scale_subplots(1.03);
    bold_subplots();

    drawnow
    
    
    %%
    % Calculate relative changes to baseline [85,135,200]
    sim_t_start = 85;
    ind1_sim = find(t_data <= sim_t_start, 1, 'last')
    ind2_sim = find(t_data <= inf_t_start, 1, 'last')
    ind3_sim = find(t_data > inf_t_start, 1, 'first')
    ind4_sim = find(t_data <= inf_t_end, 1, 'last')
    
    ind1_exp = find(expdata.gp_t <= sim_t_start, 1, 'last')
    ind2_exp = find(expdata.gp_t <= inf_t_start, 1, 'last')
    ind3_exp = find(expdata.gp_t > inf_t_start, 1, 'first')
    ind4_exp = find(expdata.gp_t <= inf_t_end, 1, 'last')
    
    if numel(ind1_exp) == 0;
        ind1_exp = 1;   % take first value if no data point before sim_t_start
    end
    
    % Calculate the basal glucose production
    tmp = data.gp_sim;
    m1   = mean( tmp(ind3_sim:ind4_sim));
    std1 = std(  tmp(ind3_sim:ind4_sim));
    m2   = mean( tmp(ind1_sim:ind2_sim));
    std2 = std(  tmp(ind1_sim:ind2_sim));
    pbgp_sim(k_sim) = m1/m2*100;
    pbgp_sim_e(k_sim) = pbgp_sim(k_sim) * sqrt( (std1/m1)^2 + (std2/m2)^2); 
    
    tmp = expdata.gp_data;
    m1   = mean( tmp(ind3_exp:ind4_exp));
    std1 = std(  tmp(ind3_exp:ind4_exp));
    m2   = mean( tmp(ind1_exp:ind2_exp));
    std2 = std(  tmp(ind1_exp:ind2_exp));
    pbgp_exp(k_sim) = m1/m2*100;
    pbgp_exp_e(k_sim) = pbgp_exp(k_sim) * sqrt( (std1/m1)^2 + (std2/m2)^2); 
    
    tmp = data_sx.gp_sx;
    m1   = mean( tmp(ind3_sim:ind4_sim));
    std1 = std(  tmp(ind3_sim:ind4_sim));
    m2   = mean( tmp(ind1_sim:ind2_sim));
    std2 = std(  tmp(ind1_sim:ind2_sim));
    pbgp_sx(k_sim) = m1/m2*100;
    pbgp_sx_e(k_sim) = pbgp_sx(k_sim) * sqrt( (std1/m1)^2 + (std2/m2)^2); 
    
    % Calculate the basal netto glucose production
    tmp1 = data.gp_sim;
    tmp2 = data.gu_sim;
    m1   = mean( tmp1(ind3_sim:ind4_sim));
    std1 = std(  tmp1(ind3_sim:ind4_sim));
    m2   = mean(tmp2(ind3_sim:ind4_sim));
    std2 = std(tmp2(ind3_sim:ind4_sim));
    m3   = mean( tmp1(ind1_sim:ind2_sim));
    std3 = std(  tmp1(ind1_sim:ind2_sim));
    pbgp_sim_netto(k_sim) = (m1-m2)/m3*100;
    pbgp_sim_netto_e(k_sim) = pbgp_sim_netto(k_sim) * sqrt( (std1/m1)^2 +(std2/m2)^2 + (std3/m3)^2 );
    
    tmp1 = expdata.gp_data;
    tmp2 = expdata.gu_data;
    m1   = mean( tmp1(ind3_exp:ind4_exp));
    std1 = std(  tmp1(ind3_exp:ind4_exp));
    m2   = mean(tmp2(ind3_exp:ind4_exp));
    std2 = std(tmp2(ind3_exp:ind4_exp));
    m3   = mean( tmp1(ind1_exp:ind2_exp));
    std3 = std(  tmp1(ind1_exp:ind2_exp));
    pbgp_exp_netto(k_sim) = (m1-m2)/m3*100;
    pbgp_exp_netto_e(k_sim) = pbgp_exp_netto(k_sim) * sqrt( (std1/m1)^2 +(std2/m2)^2 + (std3/m3)^2 );

    tmp1 = data_sx.gp_sx;[0.5 0.5 0.5]
    tmp2 = data_sx.gu_sx;
    m1   = mean( tmp1(ind3_sim:ind4_sim));
    std1 = std(  tmp1(ind3_sim:ind4_sim));
    m2   = mean(tmp2(ind3_sim:ind4_sim));
    std2 = std(tmp2(ind3_sim:ind4_sim));
    m3   = mean( tmp1(ind1_sim:ind2_sim));
    std3 = std(  tmp1(ind1_sim:ind2_sim));
    pbgp_sx_netto(k_sim) = (m1-m2)/m3*100;
    pbgp_sx_netto_e(k_sim) = pbgp_sx_netto(k_sim) * sqrt( (std1/m1)^2 +(std2/m2)^2 + (std3/m3)^2 );  
    
end

%%%% Save the figures
print(fig1,'Cherrington1976_01_saline.tif', '-dtiff', '-r600') 
print(fig2,'Cherrington1976_02_somatostatine.tif', '-dtiff', '-r600') 
print(fig3,'Cherrington1976_03_insulin_replacement.tif', '-dtiff', '-r600') 
print(fig4,'Cherrington1976_04_glucagon_replacement.tif', '-dtiff', '-r600') 
print(fig5,'Cherrington1976_05_somatostatin_replacement.tif', '-dtiff', '-r600') 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the relative changes to baseline
bpgp_data = [
    91.47	14.28
    59.79	2.52
    61.30	5.46
    149.37	15.55
    88.70	13.03
]
fig6 = figure('Name', 'Change HGP', 'Position', [1920+2*width 1080-900 900 700]);
%% normal data
%subplot(1,2,1)
x = [1:length(simulations)]'
%y = [pbgp_sim' pbgp_exp' pbgp_sx']
%e = [zeros(5,1) bpgp_data(:,2) zeros(5,1)]
%y = [pbgp_sim' pbgp_exp' bpgp_data(:,1) pbgp_sx']
%e = [pbgp_sim_e' pbgp_exp_e' bpgp_data(:,2) pbgp_sx_e']
y = [pbgp_sim' pbgp_exp' pbgp_sx']
e = [pbgp_sim_e' pbgp_exp_e' pbgp_sx_e']
h = bar(x, y)

set(h,'BarWidth',1); % The bars will now touch each other
%set(gca,'XTicklabel','Saline|Somatostatin|Insulin Replacement|Glucagon Replacement|Somatostatin Replacement')
set(gca,'XTicklabel','Saline|Insulin + Glucagon Deficiency|Glucagon Deficiency|Insulin Deficiency|Somatostatin + Insulin and Glucagon deficiency')
%set(get(gca,'YLabel'),'String',{'Relative Basal Glucose Production during Infusion', 'HGP_{infusion}/HGP_{control} [%]'})
set(get(gca,'YLabel'),'String',{'Percent of basal glucose production'})
set(h(1),'facecolor',[0.5 0.5 0.5])
set(h(2),'facecolor','w')
set(h(3),'facecolor',[0.8 0.8 0.8]) 
ylim([0 160])
xlim([0.3 5.7])
line([0 6], [100 100], 'LineStyle', '--', 'Color', 'k')
lh = legend('Simulation 1', 'Experiment', 'Simulation 2', 2);

%set(lh,'Location', [50 50 100 100])

% Errorbars - Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
hold on;
numgroups = size(y, 1); 
numbars = size(y, 2); 
groupwidth = min(0.8, numbars/(numbars+1.5));
for i = 1:numbars
x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars); % Aligning error bar with individual bar
errorbar(x, y(:,i), e(:,i), 'k', 'linestyle', 'none');
end
axis square
bold_subplots();
%xtick_tmp = get(gca, 'XTick');
%xticklabel_tmp = get(gca, 'XTickLabels');
%xticklabel_rotate90(xtick_tmp, xticklabel_tmp);
print(fig6,'Cherrington1976_06_barplot.tif', '-dtiff', '-r600') 

%% take the change in HGU into account for calculationprint(fig5,'Cherrington1976_05_somatostatin_replacement.tif', '-dtiff', '-r600') 
fig7 = figure('Name', 'Change HGP', 'Position', [1920+2*width 1080-900 900 700]);
%subplot(1,2,2)
x = [1:length(simulations)]'
y = [pbgp_sim_netto' pbgp_exp_netto' pbgp_sx_netto']
e = [pbgp_sim_netto_e' pbgp_exp_netto_e' pbgp_sx_netto_e']
h = bar(x, y)

set(h,'BarWidth',1); % The bars will now touch each other
set(gca,'XTicklabel','Saline|Somatostatin|Insulin Replacement|Glucagon Replacement|Somatostatin Replacement')
set(get(gca,'YLabel'),'String',{'Relative Netto Basal Glucose Production', '(HGP_{infusion}-GU_{infusion})/HGP_{control} [%]'})
set(h(1),'facecolor','b')
set(h(2),'facecolor','y')
set(h(3),'facecolor','r')
%lh = legend('Sim Human 1', 'Exp Dog', 'Sim Human 2');
%set(lh,'Location','BestOutside','Orientation','horizontal')

% Errorbars - Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
hold on;
numgroups = size(y, 1); 
numbars = size(y, 2); 
groupwidth = min(0.8, numbars/(numbars+1.5));
for i = 1:numbars
x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars); % Aligning error bar with individual bar
errorbar(x, y(:,i), e(:,i), 'k', 'linestyle', 'none');
end
axis square;

xtick_tmp = get(gca, 'XTick');
xticklabel_tmp = get(gca, 'XTickLabels');
xticklabel_rotate90(xtick_tmp, xticklabel_tmp);


scale_subplots(1.05);
bold_subplots();
%saveas(fig6,'Cherrington1976_06_barplot.tif') 





