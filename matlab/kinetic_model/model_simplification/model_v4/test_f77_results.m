function [] = test_f77_results()
% Plot the Fortran 77 simulation results
NC = 5;

%load('./data/mv4_f77_sim1.dat')
%data = mv4_f77_sim1;
load('./data/mv4_f77_sim2.dat')
data = mv4_f77_sim2;
t = data(:,1)';
c = data(:,2:NC+1)'
f = data(:,NC+2:1+2*NC)';

% plot the data
fig_solve2(t, f, c)
