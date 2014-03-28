function [] = tc_generator_test()
%TC_GENERATOR_TEST Test the generated metabolite time courses.
clear all

% time course definitions
m_max  = 9;    % [mM] concentration for time course
m_base = 3;

modi   = {'constant', 'gauss', 'sinus', 'step'};
f_modi = cell(1,4);
for k=1:length(modi)
    f_modi{k} = tc_generator(modi{k}, m_max, m_base);
end

t_start = 0;
t_dur   = 20;
t_end   = t_start + t_dur;
steps = 1000;

t = linspace(t_start, t_end, steps);


% plot the different time courses
close all
fig1 = figure('Name', 'Timecourses');
for k=1:length(modi)
   subplot(length(modi), 1, k)
   f = f_modi{k};
   plot(t, f(t), 'k-');
   title(strcat('Timecourse: ', modi{k}), 'FontWeight', 'bold');
   xlabel('time [s]');
   ylabel('c[mM]');
   axis([t_start, t_end, 0, m_max*1.1]);
   grid on
end




