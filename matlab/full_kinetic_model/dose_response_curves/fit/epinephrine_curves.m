%% Result of the optimization
% Function which is optimized
dose_response_function  =    @epinephrine_function;
optimization_function       = @optimize_epinephrine_curve;
glc_min = 0; 
glc_max = 12;
axis_range = [glc_min glc_max 0 8000];

name_axis  = 'epinephrine [pmol/l]';
name_title = 'Epinephrine' 

% Data for the normal curves
data_normal = [
    data_epinephrine_normal_Degn2004
    data_epinephrine_normal_Lerche2009
    data_epinephrine_normal_Mitrakou1991
    data_epinephrine_normal_Levy1998
    data_epinephrine_normal_Israelian2006
    data_epinephrine_normal_Jones1998
    data_epinephrine_normal_Segel2002
];
% Data for the IGT curves
data_IGT = [];

% Data for the epinephrine dose response curve in T2DM
data_T2DM = [
    data_epinephrine_T2DM_Levy1998    
    data_epinephrine_T2DM_Israelian2006
    data_epinephrine_T2DM_Segel2002
];
% Data for the epinephrine dose response curve in normal sleep
data_sleep = [
    data_epinephrine_normal_sleep_Jones1998
];



% Optimal solution
x_opt_normal = optimization_function('normal', data_normal)
% x_opt_IGT = optimization_function('IGT', data_IGT)
x_opt_T2DM  = optimization_function('T2DM', data_T2DM)
x_opt_sleep  = optimization_function('sleep', data_sleep)

%% Calculate the optimal insulin curves
glc_ext = glc_min:0.01:glc_max;
hormone_normal = zeros(length(glc_ext));
hormone_IGT = zeros(length(glc_ext));
hormone_T2DM = zeros(length(glc_ext));
hormone_sleep = zeros(length(glc_ext));

for glc_ind =1:length(glc_ext)
   hormone_normal(glc_ind)  = dose_response_function(glc_ext(glc_ind), x_opt_normal);
   %hormone_IGT(glc_ind)     = dose_response_function(glc_ext(glc_ind), x_opt_IGT);
   hormone_T2DM(glc_ind)    = dose_response_function(glc_ext(glc_ind), x_opt_T2DM);
   hormone_sleep(glc_ind)    = dose_response_function(glc_ext(glc_ind), x_opt_sleep);
end

%% Plot the data with the optimal curves
close all
figure(1)
% normal
subplot(4,1,1)
errorbar(data_normal(:,1), data_normal(:,2), data_normal(:,3), 'bo')
title(strcat(name_title, ' dose-response normal'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)
hold on;
plot(glc_ext, hormone_normal, 'b')
hold off;

%{
% IGT
subplot(3,1,2)
errorbar(data_insulin_IGT(:,1), data_insulin_IGT(:,2), data_insulin_IGT(:,3), 'g*')
title('Insulin dose-response IGT')
axis([0 20 0 1000])
xlabel('glucose [mM]')
ylabel('insulin [pmol/l]')
hold on;
plot(glc_ext, insulin_IGT, 'g')
hold off;
%}
% T2DM
subplot(4,1,3)
errorbar(data_T2DM(:,1), data_T2DM(:,2), data_T2DM(:,3), 'rs')
title(strcat(name_title, ' dose-response T2DM'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)
hold on;
plot(glc_ext, hormone_T2DM, 'r')
hold off;

subplot(4,1,4)
errorbar(data_sleep(:,1), data_sleep(:,2), data_sleep(:,3), 'ks')
title(strcat(name_title, ' dose-response sleep'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)
hold on;
plot(glc_ext, hormone_sleep, 'k')
hold off;


figure(2)
errorbar(data_normal(:,1), data_normal(:,2), data_normal(:,3), 'bo'), hold on
plot(glc_ext, hormone_normal, 'b'), hold on
%{
errorbar(data_insulin_IGT(:,1), data_insulin_IGT(:,2), data_insulin_IGT(:,3), 'g*'), hold on
plot(glc_ext, insulin_IGT, 'g'), hold on
%}
errorbar(data_T2DM(:,1), data_T2DM(:,2), data_T2DM(:,3), 'rs'), hold on
plot(glc_ext, hormone_T2DM, 'r'), hold on

errorbar(data_sleep(:,1), data_sleep(:,2), data_sleep(:,3), 'ks'), hold on
plot(glc_ext, hormone_sleep, 'k'), hold on

hold off

title(strcat(name_title, ' dose-response normal'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)

% values optimal
fprintf('-------------------------------------------\n')
fprintf('      \t max \t\t min \t k    \t n \n')
fprintf('-------------------------------------------\n')
fprintf('normal\t %4.2d \t %4.2d  \t %4.2d  \t %4.2d  \n', x_opt_normal);
fprintf('T2DM  \t %4.2d \t %4.2d  \t %4.2d  \t %4.2d  \n', x_opt_T2DM);
fprintf('sleep  \t %4.2d \t %4.2d  \t %4.2d  \t %4.2d  \n', x_opt_sleep);
fprintf('-------------------------------------------\n')