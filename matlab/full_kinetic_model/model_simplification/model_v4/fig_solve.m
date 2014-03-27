function [] = fortran_solve_plot(t_data, f_data, c_data, f_data_ode, c_data_ode)
% Plot solutions in comparison with ODE solution
%
%   author: Matthias Koenig 
%           Charite Berlin
%           Computational Systems Biochemistry Berlin
%           matthias.koenig@charite.de
%   date:   110801

%close all
figure('OuterPosition', [0 0 1400 1000])

% concentrations
subplot(2,3,1)
plot(t_data, c_data, '-o')
title('C_{euler} Matlab')
xlabel('time [s]')

subplot(2,3,2)
plot(t_data, c_data_ode, '-o')
title('C_{ode} Matlab')
xlabel('time [s]')
legend()

subplot(2,3,3)
plot(t_data, (c_data_ode-c_data)./abs(c_data_ode) *100, '-o')
title('c_{diff} [%]')
xlabel('time [s]')


% fluxes F
subplot(2,3,4)
plot(t_data, f_data, '-o')
title('F_{euler} Matlab')
xlabel('time [s]')

subplot(2,3,5)
plot(t_data, f_data_ode, '-o')
title('F_{ode} Matlab')
xlabel('time [s]')

subplot(2,3,6)
plot(t_data, (f_data_ode-f_data)./abs(f_data_ode) *100, '-o')
title('F_{diff} [%]')
xlabel('time [s]')

