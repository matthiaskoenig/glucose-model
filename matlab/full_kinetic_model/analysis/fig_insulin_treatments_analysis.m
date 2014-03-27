%FIG_INSULIN_TREATMENTS Calculate the different insulin treatment hormonal
%and gamma curves.
%

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110225  -   v0.1

clear all
close all
%dia_strength = 'T2DM';
dia_strength = 'extreme_T2DM';

% treatment responses
[glc, M_ins_abs_1, M_gamma_1] = sim_insulin_treatments('constant_addition', dia_strength);
[glc, M_ins_abs_2, M_gamma_2] = sim_insulin_treatments('linear_addition', dia_strength);
glc_min = glc(1);   glc_max = glc(end);
rel_axis = [glc_min glc_max -0.05 1.05];

% normal responses
ins_normal = hormone_abs(glc, 'insulin', 'normal');
glu_normal = hormone_abs(glc, 'glucagon', 'normal');
epi_normal = hormone_abs(glc, 'epinephrine', 'normal');;

switch dia_strength
    case 'T2DM'
        ins_dia = hormone_abs(glc, 'insulin', 'T2DM');
        glu_dia = hormone_abs(glc, 'glucagon', 'T2DM');
        epi_dia = hormone_abs(glc, 'epinephrine', 'T2DM');

    case 'extreme_T2DM'
        ins_dia = hormone_abs(glc, 'insulin', 'extreme_T2DM');
        glu_dia = hormone_abs(glc, 'glucagon', 'extreme_T2DM');
        epi_dia = hormone_abs(glc, 'epinephrine', 'extreme_T2DM');
end

gamma_normal = gamma_f(ins_normal, glu_normal, epi_normal);
gamma_dia = gamma_f(ins_dia, glu_dia, epi_dia);


%% Plot the generated response curves
fig1 = figure('Name','insulin treatments', 'Color',[1 1 1]);

% [1] additive insulin
for k=1:2
    subplot(2,2,k)  
    switch k
        case 1
            % absolute insulin
            plot(glc, M_ins_abs_1), hold on
            plot(glc, ins_normal, 'k',  glc, ins_dia, 'r'), hold off
            title('Additive insulin curves','FontWeight','bold')
            ylabel('insulin [pmol/l]')
            axis([glc_min, glc_max, 0, 800])
        case 2
            % gamma
            plot(glc, M_gamma_1), hold on
            plot(glc, gamma_normal, 'k', glc, gamma_dia, 'r'), hold off
            title('Additive gamma curves','FontWeight','bold')
            ylabel('gamma')
            axis(rel_axis)
    end
    xlabel('glucose [mM]')            
    axis square
    grid on
end

%{
% [2] normal response
for k=3:4
    subplot(3,2,k)  
    switch k
        case 3
            % absolute insulin
            plot(glc, ins_normal, 'k',  glc, ins_dia, 'r');
            title('Normal response','FontWeight','bold')
            ylabel('insulin [pmol/l]')
            axis([glc_min, glc_max, 0, 800])
        case 4
            % gamma
            plot(glc, gamma_normal, 'k', glc, gamma_dia, 'r');
            title('normal response','FontWeight','bold')
            ylabel('gamma')
            axis(rel_axis)
    end
    xlabel('glucose [mM]')
    axis square
    grid on
end
%}

% [3] linear insulin addition
for k=3:4
    subplot(2,2,k)
    switch k
        case 3
            % insulin
            plot(glc, M_ins_abs_2),  hold on
            plot(glc, ins_normal, 'k',  glc, ins_dia, 'r'), hold off
            title('Linear insulin curves','FontWeight','bold')
            ylabel('insulin [pmol/l]')
            axis([glc_min glc_max, 0, 1500])
        case 4
            % gamma
            plot(glc, M_gamma_2), hold on
            plot(glc, gamma_normal, 'k', glc, gamma_dia, 'r'), hold off
            title('Linear gamma curves','FontWeight','bold')
            ylabel('gamma')
            axis(rel_axis)
    end
    xlabel('glucose [mM]')
    axis square
    grid on    
end
