% Example which shows the calculation of the gamma values
%
%   author: Matthias Koenig
%   date: 110809
close all
clear all
format compact

%% 1. Calculation of single gamma value from glucose concentraion

% get the hormone functions
ins_f = hormone_f('insulin', 'normal');
glu_f = hormone_f('glucagon', 'normal');
epi_f = hormone_f('epinephrine', 'normal');

glc = 5             % [mM]
ins = ins_f(glc)    % [pmol/l]
glu = glu_f(glc)    % [pmol/l]
epi = epi_f(glc)    % [pmol/l]
gamma = gamma_f(ins, glu, epi)


%% 2. Calculate the response functions and gamma
glc = linspace(2,15,50);   % [mM]

ins = ins_f(glc);   % [pmol/l]
glu = glu_f(glc);   % [pmol/l]
epi = epi_f(glc);   % [pmol/l]

gamma = gamma_f(ins, glu, epi);


%% 3. Plots
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


