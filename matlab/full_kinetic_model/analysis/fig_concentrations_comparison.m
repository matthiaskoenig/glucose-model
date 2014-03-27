% comparison of the model concentrations and experimental data for the
% concentrations

close all
clear all

% data folder
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110314_data/glucose_dependency/T2DM'

% simulation condition
condition  = 'normal'
%condition  = 'diabetes'
%condition  = 'insulin_restored'
%condition  = 'glucagon_restored'

% load simulation data
in_file = strcat(out_folder, '/glucose_dependency_', condition);
load(in_file);

% offset
t_offset = 10;           % offset for t (very rapid changes in first minute not shown)

% plot boundaries
glc_min = 3;
glc_max = 9;
t_max = 720; 

% indeces of plot boundaries
glc_ext = mpars.glc_ext;
t_span  = mpars.t_span; 
tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
tmp = find(t_span>=t_max); t_max_ind = tmp(1);
t_min_ind = t_offset;
t_min = 0;

x = glc_ext(glc_min_ind:glc_max_ind);
y = t_span(t_offset:t_max_ind)/60;      % time in [h]

% calculate the statistics of all the concentrations
cnames = names_s();
data = zeros(numel(x)*numel(y), numel(cnames));
mean_data = zeros(1, numel(cnames));
for k=1:numel(cnames)
    k, cnames{k}
    z = c_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, k);
    mean_data(1,k) = mean(mean(z));
    data(:,k) = reshape(z, numel(x)*numel(y), 1)/mean_data(1,k);
    
    
end

% initial concentrations
cinit = reshape(c_full(1,1,:), numel(cnames), 1);
cinit([32, 18]) = 5;    % set the glucose concentration
cinit([19, 20]) = cinit([19, 20])/3.5;
cinit([15]) = cinit([15])/4;
cinit = cinit./mean_data';

Irem = [10 12 13 14 49 48 45 34 35 38 40]
% experimental concentrations
cdata = boxplot_concentrations();
for k = 1:length(cdata)
   index = cdata(k, 1);
   if find(Irem == index)
       cdata(k, :) = [NaN NaN NaN];
   else
      Nmin = numel(find(Irem < index));
    cdata(k, 2:3) = cdata(k, 2:3)./mean_data(index);
    cdata(k, 1) = index - Nmin;
   end
end

data(:, Irem) = [];
cnames(Irem) = [];
cinit(Irem) = [];

figure(1)
% boxplot
hb = boxplot(data, 'labels', cnames, 'labelorientation', 'inline', 'whisker', 1.5), hold on
set( hb(7,:),'Visible','off' ) 
%plot(ones(numel(atp_ex), 1), atp_ex, 'ko', 'MarkerFaceColor','g'), hold on
title('Concentration boxplots')
ylim([0, 5])
ylabel('Concentration relative to mean')
axis square 

p1 = plot(1:numel(cinit), cinit(:), 'sk')
set(p1, 'MarkerFaceColor', 'y')
set(p1, 'MarkerSize', 3.2)

plot(cdata(:,1), cdata(:,2), 'ko', 'MarkerFaceColor',[0.5 0.5 0.5], 'MarkerSize', 2), hold on
he1 =errorbar(cdata(:,1), cdata(:,2), cdata(:,3),'.k');
set(he1,'MarkerSize',2.0);
set(he1,'Color',[0.5 0.5 0.5]);
%{
% Create the boxplot for the concentrations
data_glycogen = data(:,17);
data(:,17) = [];
cnames(17) = [];

figure(1)
subplot(1,2,1)
boxplot(data, 'labels', cnames)
subplot(1,2,2)
boxplot(data_glycogen, 'labels', {'glycogen'})
%}
