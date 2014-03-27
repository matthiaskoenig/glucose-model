%% Result of the optimization
clear all
close all
dose_response_function  = @insulin_function;
optimization_function   = @optimize_insulin_curve;
glc_min = 0; 
glc_max = 20;
axis_range = [glc_min glc_max 0 1000];

name_axis  = 'insulin [pmol/l]';
name_title = 'Insulin' 

data_normal = [
    data_insulin_normal_OGGT_Ferrannini1988
    data_insulin_normal_OGGT_Fery1993
    data_insulin_normal_Lerche2009	 
    data_insulin_normal_OGGT_Gerich1993
    data_insulin_normal_OGGT_Basu2009	 
    data_insulin_normal_OGGT_Henkel2005
    data_insulin_normal_OGGT_Butler1991	 
    data_insulin_normal_OGGT_Knop2007
    data_insulin_normal_OGGT_Cobelli2010	 
    data_insulin_normal_OGGT_Mitrakou1992
];
data_IGT = [
    data_insulin_IGT_OGGT_Butler1991  
    data_insulin_IGT_OGGT_Henkel2005
    data_insulin_IGT_OGGT_Fery1993
    data_insulin_IGT_OGGT_Mitrakou1992
];
data_T2DM = [
    data_insulin_T2DM_OGGT_Fery1993
    data_insulin_T2DM_OGGT_Basu2009	 
    data_insulin_T2DM_OGGT_Gerich1993
    data_insulin_T2DM_OGGT_Butler1991	 
    data_insulin_T2DM_OGGT_Henkel2005
    data_insulin_T2DM_OGGT_Ferrannini1988
    data_insulin_T2DM_OGGT_Knop2007
];

%% Calculate the optimal insulin curves
% Optimal solution
x_opt_normal = optimization_function('normal')
x_opt_IGT = optimization_function('IGT')
x_opt_T2DM = optimization_function('T2DM')

%% Calculate the optimal insulin curves
glc_ext = glc_min:0.01:glc_max;
hormone_normal  = zeros(length(glc_ext));
hormone_IGT     = zeros(length(glc_ext));
hormone_T2DM    = zeros(length(glc_ext));

for glc_ind =1:length(glc_ext)
   hormone_normal(glc_ind)  = dose_response_function(glc_ext(glc_ind), x_opt_normal);
   hormone_IGT(glc_ind)     = dose_response_function(glc_ext(glc_ind), x_opt_IGT);
   hormone_T2DM(glc_ind)    = dose_response_function(glc_ext(glc_ind), x_opt_T2DM);
end

%% Plot the data with the optimal curves
close all
figure(1)
% normal
subplot(3,1,1)
errorbar(data_normal(:,1), data_normal(:,2), data_normal(:,3), 'bo')
title(strcat(name_title, ' dose-response normal'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)
hold on;
plot(glc_ext, hormone_normal, 'b')
hold off;

% IGT
subplot(3,1,2)
errorbar(data_IGT(:,1), data_IGT(:,2), data_IGT(:,3), 'g*')
title(strcat(name_title, ' dose-response IGT'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)
hold on;
plot(glc_ext, hormone_IGT, 'g')
hold off;

% T2DM
subplot(3,1,3)
errorbar(data_T2DM(:,1), data_T2DM(:,2), data_T2DM(:,3), 'rs')
title(strcat(name_title, ' dose-response T2DM'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)
hold on;
plot(glc_ext, hormone_T2DM, 'r')
hold off;
%}

figure(2)
errorbar(data_normal(:,1), data_normal(:,2), data_normal(:,3), 'bo'), hold on
plot(glc_ext, hormone_normal, 'b'), hold on
errorbar(data_IGT(:,1), data_IGT(:,2), data_IGT(:,3), 'g*'), hold on
plot(glc_ext, hormone_IGT, 'g'), hold on
errorbar(data_T2DM(:,1), data_T2DM(:,2), data_T2DM(:,3), 'rs'), hold on
plot(glc_ext, hormone_T2DM, 'r'), hold on

hold off

title(strcat(name_title, ' dose-response normal'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)

figure(3)
% normal individual experiments
    a1 =     data_insulin_normal_OGGT_Ferrannini1988
    a2 =     data_insulin_normal_OGGT_Fery1993
    a3 =     data_insulin_normal_Lerche2009	 
    a4 =     data_insulin_normal_OGGT_Gerich1993
    a5 =     data_insulin_normal_OGGT_Basu2009	 
    a6 =     data_insulin_normal_OGGT_Henkel2005
    a7 =     data_insulin_normal_OGGT_Butler1991	 
    a8 =     data_insulin_normal_OGGT_Knop2007
    a9 =     data_insulin_normal_OGGT_Cobelli2010	 
    a10 =     data_insulin_normal_OGGT_Mitrakou1992
    plot(   a1(:,1), a1(:,2), '*-', ...
            a2(:,1), a2(:,2), '*-', ...
            a3(:,1), a3(:,2), '*-', ...
            a4(:,1), a4(:,2),  '*-', ...
            a5(:,1), a5(:,2), '*-', ...
            a6(:,1), a6(:,2),  '*-', ...
            a7(:,1), a7(:,2), '*-', ...
            a8(:,1), a8(:,2),  '*-', ...
            a9(:,1), a9(:,2),  '*-', ...
            a10(:,1), a10(:,2),  '*-')
        
            
title(strcat(name_title, ' dose-response normal'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)
hold on;
plot(glc_ext, hormone_normal, 'b')
hold off;


%% plot the optimal results
disp('max  min  k  n')
x_opt_normal
x_opt_IGT
x_opt_T2DM