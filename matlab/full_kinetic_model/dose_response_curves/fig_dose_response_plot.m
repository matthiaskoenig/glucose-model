%%FIG_DOSE_RESPONSE_PLOT Plot hormone dose response curves and gamma
%
%   author: Matthias Koenig
%   date:   110224
close all
clear all

%% Definitions
% define glucose vector
x_name = 'glucose [mM]';
glc_min  = 2;
glc_max  = 16;
glc_step = 0.01;
glc = glc_min:glc_step:glc_max;

% define hormones and conditions to plot
hormones    = {'insulin', 'glucagon', 'epinephrine'};
conditions  = {'normal', 'IGT', 'T2DM', 'extreme_T2DM'};    
h_axis = {  [glc_min glc_max 0 800] 
            [glc_min glc_max 0 200] 
            [glc_min glc_max 0 7000]};

        
%% Plot of all dose response curves
fig1 = figure('Name', 'Dose-Response Curves');
pcount = 1;
for k=1:length(hormones)
    for p=1:length(conditions)
        sp = subplot(length(hormones), length(conditions), pcount);
        h_abs = hormone_abs(glc, hormones{k}, conditions{p});
        plot(glc, h_abs)
        title(strcat(hormones{k}, ' - ', conditions{p}))
        xlabel(x_name)
        ylabel(strcat(hormones{k}, ' [pmol/l]'))
        axis(h_axis{k})
        axis square
        grid on
        set(sp, 'XTick',[2 5 8 11 14])
        pcount = pcount + 1;
    end
end
clear pcount k p


%% Insulin, Glucagon, Epinephrine and Gamma
% normal case, diabetic case and the extreme diabetic case
fig2 = figure('Name', 'Response Curves');
for k=1:3
    sp = subplot(1,4,k);
    switch k
        case 1
            h_name = 'insulin';
            set(sp, 'YTick',[0 200 400 600 800])
        case 2 
            h_name = 'glucagon';
            set(sp, 'YTick',[0 50 100 150 200])
        case 3
            h_name = 'epinephrine';
            set(sp, 'YTick',[0 1000 2000 3000 4000 5000 6000])
    end
    plot( glc, hormone_abs(glc, h_name, 'normal'), 'k', ...
          glc, hormone_abs(glc, h_name, 'T2DM'), 'r', ...
          glc, hormone_abs(glc, h_name, 'extreme_T2DM'), 'b');
    %title(h_name)
    %legend(h_name, strcat(h_name, '_{dia}'))
    xlabel(strcat(x_name))
    ylabel(strcat(h_name, ' [pmol/l]'))
    axis square
    axis(h_axis{k})   
    grid on
    set(sp, 'XTick',[2 5 8 11 14])
    %set(sp, 'XMinorTick', 'on')
    switch k
        case 1
            set(sp, 'YTick',[0 200 400 600 800])
        case 2 
            set(sp, 'YTick',[0 50 100 150 200])
        case 3
            set(sp, 'YTick',[0 1000 2000 3000 4000 5000 6000])
    end
end

% gamma in 4th panel
legend('normal', 'T2DM', 'extreme T2DM')
sp = subplot(1,4,4);

g_normal_1 = gamma_f( hormone_abs(glc, 'insulin', 'normal'), ...
                    hormone_abs(glc, 'glucagon', 'normal'));
g_normal_2 = gamma_f( hormone_abs(glc, 'insulin', 'normal'), ...
                    hormone_abs(glc, 'glucagon', 'normal'), ...
                    hormone_abs(glc, 'epinephrine', 'normal'));
g_T2DM_1 = gamma_f(   hormone_abs(glc, 'insulin', 'T2DM'), ...
                    hormone_abs(glc, 'glucagon', 'T2DM'));
g_T2DM_2 = gamma_f(   hormone_abs(glc, 'insulin', 'T2DM'), ...
                    hormone_abs(glc, 'glucagon', 'T2DM'), ...
                    hormone_abs(glc, 'epinephrine', 'T2DM'));
g_extreme_T2DM_1 = gamma_f( hormone_abs(glc, 'insulin', 'extreme_T2DM'), ...
                    hormone_abs(glc, 'glucagon', 'extreme_T2DM'));
g_extreme_T2DM_2 = gamma_f( hormone_abs(glc, 'insulin', 'extreme_T2DM'), ...
                    hormone_abs(glc, 'glucagon', 'extreme_T2DM'), ...
                    hormone_abs(glc, 'epinephrine', 'extreme_T2DM'));

plot(glc, g_normal_1, 'k--', glc, g_normal_2, 'k', ...
     glc, g_T2DM_1, 'r--', glc, g_T2DM_2, 'r', ...
     glc, g_extreme_T2DM_1, 'b--', glc, g_extreme_T2DM_2, 'b')

 xlabel(x_name)
ylabel('\gamma', 'FontWeight', 'bold')
axis square
axis([glc_min glc_max 0 1])
grid on
set(sp, 'YTick',[0 0.2 0.4 0.6 0.8 1])
set(sp, 'XTick',[2 5 8 11 14])

