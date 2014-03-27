%% Result of the optimization
% Function which is optimized
clear all
close all
dose_response_function  = @glucagon_function;
optimization_function   = @optimize_glucagon_curve;
glc_min = 0; 
glc_max = 20;
axis_range = [glc_min glc_max 0 270];

name_axis  = 'glucagon [pmol/l]';
name_title = 'Glucagon' 

% Insulin suppression of glucagon secretion
insulin_suppression = 3.4;

% Data for the normal curves
data_normal = [
    
    % Glucagon data of hyperinsulemic, hypoglycemic clamp has to be adapted
    % due to inhibitory effect of insulin on glucagon secretion
    %correct_hormone_data(data_glucagon_normal_Mitrakou1991,
    %insulin_suppression)
    correct_hormone_data(data_glucagon_normal_Degn2004, insulin_suppression)
    correct_hormone_data(data_glucagon_normal_Lerche2009, insulin_suppression)        
    correct_hormone_data(data_glucagon_normal_Levy1998, insulin_suppression)
    correct_hormone_data(data_glucagon_normal_Israelian2006, insulin_suppression)
    
    correct_hormone_data(data_glucagon_normal_Degn2004, insulin_suppression)
    correct_hormone_data(data_glucagon_normal_Lerche2009, insulin_suppression)        
    correct_hormone_data(data_glucagon_normal_Levy1998, insulin_suppression)
    correct_hormone_data(data_glucagon_normal_Israelian2006, insulin_suppression)
    correct_hormone_data(data_glucagon_normal_Segel2002, insulin_suppression)
    
    
    data_glucagon_normal_OGGT_Butler1991
    data_glucagon_normal_OGGT_Cobelli2010
    data_glucagon_normal_OGGT_Fery1993
    
    data_glucagon_normal_OGGT_Gerich1993
    data_glucagon_normal_OGGT_Henkel2005
    data_glucagon_normal_Mitrakou1991    
    %data_glucagon_normal_OGGT_Knop2007
    data_glucagon_normal_OGGT_Basu2009
    data_glucagon_normal_OGGT_Mitrakou1992
    data_glucagon_normal_OGGT_Basu2009
    
];
% Data for the dose response curve in impaired glucose
% tolerance (IGT)
data_IGT = [
    data_glucagon_IGT_OGGT_Butler1991
    data_glucagon_IGT_OGGT_Fery1993
    data_glucagon_IGT_OGGT_Henkel2005
];
% Data for the dose response curve in T2DM1
data_T2DM_1 = [
    data_glucagon_T2DM_OGGT_Gerich1993
    data_glucagon_T2DM_OGGT_Basu2009    
    data_glucagon_T2DM_OGGT_Henkel2005
    data_glucagon_T2DM_OGGT_Butler1991  
    %data_glucagon_T2DM_OGGT_Knop2007
    data_glucagon_T2DM_OGGT_Fery1993    
    data_glucagon_T2DM_OGGT_Mitrakou1992
    
    %correct_hormone_data(data_glucagon_T2DM_Segel2002, insulin_suppression)
    correct_hormone_data(data_glucagon_T2DM_Israelian2006, insulin_suppression)
    correct_hormone_data(data_glucagon_T2DM_Levy1998, insulin_suppression)
    correct_hormone_data(data_glucagon_T2DM_Israelian2006, insulin_suppression)
    correct_hormone_data(data_glucagon_T2DM_Levy1998, insulin_suppression)   
];

data_T2DM_2 = [
    data_glucagon_T2DM_OGGT_Gerich1993
    data_glucagon_T2DM_OGGT_Basu2009    
    data_glucagon_T2DM_OGGT_Henkel2005
    data_glucagon_T2DM_OGGT_Butler1991  
    %data_glucagon_T2DM_OGGT_Knop2007
    data_glucagon_T2DM_OGGT_Fery1993    
    data_glucagon_T2DM_OGGT_Mitrakou1992
    
    correct_hormone_data(data_glucagon_T2DM_Segel2002, insulin_suppression)
    %correct_hormone_data(data_glucagon_T2DM_Israelian2006, insulin_suppression)
    %correct_hormone_data(data_glucagon_T2DM_Levy1998, insulin_suppression)
    %correct_hormone_data(data_glucagon_T2DM_Israelian2006, insulin_suppression)
    %correct_hormone_data(data_glucagon_T2DM_Levy1998, insulin_suppression)   
];



% Optimal solution
x_opt_normal = optimization_function('normal', data_normal)
x_opt_IGT = optimization_function('IGT', data_IGT)
x_opt_T2DM_1 = optimization_function('T2DM_1', data_T2DM_1)
x_opt_T2DM_2 = optimization_function('T2DM_2', data_T2DM_2)

%% Calculate the optimal insulin curves
glc_ext = glc_min:0.01:glc_max;
hormone_normal  = zeros(length(glc_ext));
hormone_IGT     = zeros(length(glc_ext));
hormone_T2DM_1    = zeros(length(glc_ext));
hormone_T2DM_2    = zeros(length(glc_ext));

for glc_ind =1:length(glc_ext)
   hormone_normal(glc_ind)  = dose_response_function(glc_ext(glc_ind), x_opt_normal);
   hormone_IGT(glc_ind)     = dose_response_function(glc_ext(glc_ind), x_opt_IGT);
   hormone_T2DM_1(glc_ind)    = dose_response_function(glc_ext(glc_ind), x_opt_T2DM_1);
   hormone_T2DM_2(glc_ind)    = dose_response_function(glc_ext(glc_ind), x_opt_T2DM_2);
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
errorbar(data_T2DM_1(:,1), data_T2DM_1(:,2), data_T2DM_1(:,3), 'rs'), hold on
errorbar(data_T2DM_2(:,1), data_T2DM_2(:,2), data_T2DM_2(:,3), 'rs'), hold on;
title(strcat(name_title, ' dose-response T2DM'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)

plot(glc_ext, hormone_T2DM_1, 'r'), hold on;
plot(glc_ext, hormone_T2DM_2, 'r'), hold on;
hold off;
%}


figure(2)
errorbar(data_normal(:,1), data_normal(:,2), data_normal(:,3), 'bo'), hold on
plot(glc_ext, hormone_normal, 'b'), hold on
errorbar(data_IGT(:,1), data_IGT(:,2), data_IGT(:,3), 'g*'), hold on
plot(glc_ext, hormone_IGT, 'g'), hold on
errorbar(data_T2DM_1(:,1), data_T2DM_1(:,2), data_T2DM_1(:,3), 'rs'), hold on
plot(glc_ext, hormone_T2DM_1, 'r'), hold on

hold off

title(strcat(name_title, ' dose-response normal'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)


figure(3)
% normal individual experiments
    a1 = data_glucagon_normal_Degn2004;           % adapted !
    a2 = data_glucagon_normal_Lerche2009;         % adapted !
    a3 = data_glucagon_normal_Mitrakou1991;
    a4 = data_glucagon_normal_Levy1998;
    a5 = data_glucagon_normal_OGGT_Butler1991;
    a6 = data_glucagon_normal_OGGT_Cobelli2010;
    a7 = data_glucagon_normal_OGGT_Fery1993;
    a8 = data_glucagon_normal_OGGT_Gerich1993;
    a9 = data_glucagon_normal_OGGT_Henkel2005;
    a10 = data_glucagon_normal_Mitrakou1991;    
    a11 = data_glucagon_normal_OGGT_Basu2009;
    a12 = data_glucagon_normal_OGGT_Mitrakou1992;
    a13 = data_glucagon_normal_OGGT_Basu2009;
    plot(   a1(:,1), a1(:,2), '*', ...
            a2(:,1), a2(:,2), '*', ...
            a3(:,1), a3(:,2), '*', ...
            a4(:,1), a4(:,2),  '*', ...
            a5(:,1), a5(:,2), '*', ...
            a6(:,1), a6(:,2),  '*', ...
            a7(:,1), a7(:,2), '*', ...
            a8(:,1), a8(:,2),  '*', ...
            a9(:,1), a9(:,2),  '*', ...
            a10(:,1), a10(:,2),  '*', ...
            a11(:,1), a11(:,2), '*', ...
            a12(:,1), a12(:,2),  '*', ...
            a13(:,1), a13(:,2), '*')
        
            
title(strcat(name_title, ' dose-response normal'))
axis(axis_range)
xlabel('glucose [mM]')
ylabel(name_axis)
hold on;
plot(glc_ext, hormone_normal, 'b')
hold off;



% opt
%% plot the optimal results
% values optimal
fprintf('-------------------------------------------\n')
fprintf('      \t max \t\t min \t k    \t n \n')
fprintf('-------------------------------------------\n')
fprintf('normal\t %4.2d \t %4.2d  \t %4.2d  \t %4.2d  \n', x_opt_normal);
fprintf('IGT  \t %4.2d \t %4.2d  \t %4.2d  \t %4.2d  \n', x_opt_IGT);
fprintf('T2DM_1  \t %4.2d \t %4.2d  \t %4.2d  \t %4.2d  \n', x_opt_T2DM_1);
fprintf('T2DM_2  \t %4.2d \t %4.2d  \t %4.2d  \t %4.2d  \n', x_opt_T2DM_2);
fprintf('-------------------------------------------\n')

