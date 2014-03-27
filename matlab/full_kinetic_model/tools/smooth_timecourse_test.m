% test the smooth time course generator
% Matthias Koenig
% 120312
t_vec =    [0 5 25 45 60 61]
data_vec = [ 5 7  3  5 5]

%t_vec =    [0 5]
%data_vec = [5 7]

t_change1 = 1; 
t_change2 = 4; 
f_tc1 = smooth_timecourse(t_vec, data_vec, t_change1);
f_tc2 = smooth_timecourse(t_vec, data_vec, t_change2);



t = -10:0.1:70;
d1 = zeros(size(t));
d2 = zeros(size(t));
%t
for k=1:numel(t)
   res = f_tc1(t(k)); 
   d1(k) = res;
   res = f_tc2(t(k));
   d2(k) = res;
end

fig1 = figure('Name', 'Smooth Timecourse Test')


plot(t, d1, 'k-'), hold on
plot(t, d2, 'r-'), hold on
plot(t_vec(1:end-1), data_vec, 'sb')
xlabel('time')
ylabel('data')
ylim([2 9])
title('Smooth Timecourse');
