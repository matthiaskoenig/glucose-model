% Example which shows the calculation of the gamma values
%
%   author: Matthias Koenig
%   date: 121022
format compact

%% 1. Calculation of single gamma value from glucose concentraion

% get the hormone functions
ins_f = hormone_f('insulin', 'normal');
glu_f = hormone_f('glucagon', 'normal');
epi_f = hormone_f('epinephrine', 'normal');

glc = linspace(2,15,50);   % [mM]
% insulin normal
x_ins = [818.9  0   8.6   4.2];
ins = x_ins(2) + (x_ins(1)-x_ins(2)) .* glc.^x_ins(4) ./ (glc.^x_ins(4) + x_ins(3)^x_ins(4));

% glucagon normal
x_glu = [190    37.9    3.01    6.40];
glu = x_glu(2) + (x_glu(1)-x_glu(2)).*( 1 - glc.^x_glu(4)./(glc.^x_glu(4) + x_glu(3)^x_glu(4)) );

% epinephrine normal
x_epi = [6090   100     3.10    8.40];
epi = x_epi(2) + (x_epi(1)-x_epi(2)).*( 1 - glc.^x_epi(4)./(glc.^x_epi(4) + x_epi(3)^x_epi(4)) );

K_val = 0.1;
epi_effectiveness = 0.8;
K_ins = (x_ins(1)-x_ins(2) ) * K_val;
K_glu = (x_glu(1)-x_glu(2) ) * K_val;
K_epi = (x_epi(1)-x_epi(2)) * K_val;
ins = max(0.0, ins-x_ins(2));
glu = max(0.0, glu-x_glu(2));
epi = epi-x_epi(2);

gamma = 0.5 * (1 - ins./(ins + K_ins) + max(glu./(glu + K_glu), epi_effectiveness*epi./(epi + K_epi)) );


% 2. Plots
% dose response
fig1 = figure('Name', 'Dose-Response-Curves', 'Color', [1 1 1])
h_names = {'Insulin', 'Glucagon', 'Epinephrine'}
for k=1:3
    subplot(1,3,k)
    switch k
        case 1
            plot(glc, ins, '-o')
        case 2
            plot(glc, glu, '-o')
        case 3
            plot(glc, epi, '-o')
    end
    title(h_names{k}, 'FontWeight', 'bold')
    ylabel(strcat(h_names{k}, '[pmol/l]') )
    xlabel('Glucose [mM]')
    axis square
end

% gamma
fig2 = figure('Name', 'Gamma', 'Color', [1 1 1])
plot(glc, gamma, '-o')
title('Gamma')
xlabel('Glucose [mM]')
ylabel('Gamma')
axis square


