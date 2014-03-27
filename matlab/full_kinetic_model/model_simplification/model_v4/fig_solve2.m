function [y] = fig_solve2(t, f, c)
% plot details about the solution

t_unit = 'min'
switch t_unit
    case 's'
        t = t;
    case 'min'
        t = t/60;
    case 'h'
        t = t/3600;
end
  
t_ind = 3;
figure('Name', 'Concentrations & Fluxes', 'Color', [1 1 1], 'OuterPosition', [0 0 1200 800])
% plot the concentrations
for k=1:5
    subplot(3,5,k)
    plot(t(t_ind:end), c(k, t_ind:end))
    xlabel(strcat('time [', t_unit, ']'))
    ylabel('C [mM]')
    switch k
        case 1
            title('Glucose extern', 'FontWeight', 'bold')
        case 2
            title('Glucose', 'FontWeight', 'bold')
        case 3
            title('Glycogen', 'FontWeight', 'bold')
        case 4
            title('Lactate', 'FontWeight', 'bold')
        case 5
            title('Lactate extern', 'FontWeight', 'bold')
    end
    axis square
end

% plot the reactions
dxdt = zeros(4, length(t));
for i = 1:length(t)
   dxdt(:,i) = mv4_dxdt(c(:,i)); 
end

for k = 6:9
    subplot(3,5,k)
    plot(t(t_ind:end), dxdt(k-5, t_ind:end))
    xlabel(strcat('time [', t_unit, ']'))
    ylabel('v [mmol/s]')
    switch k
        case 6
            title('v1 glucose import', 'FontWeight', 'bold')
        case 7
            title('v2 lactate import', 'FontWeight', 'bold')
        case 8
            title('v3 gluconeogenesis', 'FontWeight', 'bold')
        case 9
            title('v4 glycogen synthesis', 'FontWeight', 'bold')
    end
    axis square
end

% plot the fluxes
for k = 11:15
    subplot(3,5,k)
    plot(t(t_ind:end), f(k-10, t_ind:end))
    xlabel(strcat('time [', t_unit, ']'))
    ylabel('f [mmol/s]')
    switch k
        case 11
            title('f(1)', 'FontWeight', 'bold')
        case 12
            title('f(2)', 'FontWeight', 'bold')
        case 13
            title('f(3)', 'FontWeight', 'bold')
        case 14
            title('f(4)', 'FontWeight', 'bold')
        case 15
            title('f(5)', 'FontWeight', 'bold')
    end
    axis square
end

