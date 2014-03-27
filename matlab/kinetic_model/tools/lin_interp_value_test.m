% Test the linear interpolation of the values;
data = [
    90.00	5.93
    100.00	5.83
    110.00	5.83
    120.00	5.80
    130.00	5.62
    140.00	5.59
    150.00	5.56
    160.00	5.53
    170.00	5.57
    180.00	5.62
    190.00	5.51
    200.00	5.45
    210.00	5.64
    220.00	5.69
    230.00	5.62
];
% Data and time vector of data points
t_vec = data(:,1);
data_vec = data(:,2);

% Interpolation time pints and data
t_interp = 0:1:240;
data_interp = zeros(size(t_interp));
data_interp2 = zeros(size(t_interp));
for k=1:numel(t_interp)
    data_interp(k) = lin_interp_value(t_interp(k), t_vec, data_vec);
end
data_interp2 = lin_interp_value(t_interp, t_vec, data_vec);

fig = figure('Name', 'Linear Interpolation');
plot(t_vec, data_vec, 'ko', ...
     t_interp, data_interp, 'b-', t_interp, data_interp2, 'r-');
title('Linear Interpolation of Data Points');
xlabel('time [min]');




