function [t_data, f_data, c_data] = mv4_solve(delta_t)
% FORTRAN_SOLVE Solves the minimal model in Matlab with Euler and ODE
% method.
% 
% Returns the vector of timepoints and the matrix of concentrations and
% fluxes. 
%
%   DT  :   complete time of calculation
%   DTC :   internal time steps
%   author: Matthias Koenig 
%           Charite Berlin
%           Computational Systems Biochemistry Berlin
%           matthias.koenig@charite.de
%   date:   110801

% endtime and timesteps (DT and DTC)
DT = 1200;                % [s]
DTC= 1;
t_len = DT/DTC + 1; 
V_f = 1;    % Volume relative to reference volume (V/V~)

% storage of timepoints, concentrations and fluxes (F)
NC = 5;  % number of concentrations
model_sinks = @mv4_sinks
model_sinks_ode = @mv4_sinks_ode



% initial conditions
t_data = zeros(1, t_len); 
c_data = zeros(NC, t_len);
f_data = zeros(NC, t_len);
t_data(1,1) = 0;
c_data(:,1) = [
                9     %	GLC_ext   C1
                3     %	GLC       C2
                250   % Glycogen  C3
                2     % Lactate   C4
                5    % LAC_ext   C5
                
];
c_data_ode = c_data;
f_data_ode = f_data;

% time points for integration
for k = 2:t_len
    t_data(1,k) = t_data(1,k-1) + DTC;
end


%% EULER
display('-----------------')
display('Time Matlab Euler')
tic
% Solve with simple Euler
for k = 2:t_len 
    % get fluxes and concentrations for next time point
    f_data(:,k) = model_sinks(c_data(:,k-1), DTC);
    c_data(:,k) = c_data(:, k-1) + V_f * f_data(:,k);
end
toc
display('cdata')
c_data(:,end)
display('fdata')
f_data(:,end)
res = [t_data(end) c_data(:,end)' f_data(:,end)']
fig_solve2(t_data, f_data, c_data);
return

%% ODE
display('-----------------')
display('Time Matlab ODE')
tic
% Solve with more comples ODE integration
for k = 2:t_len
    % get fluxes and concentrations for next time point
    f_data_ode(:,k) = model_sinks_ode(c_data_ode(:,k-1), DTC);
    c_data_ode(:,k) = c_data_ode(:, k-1) + V_f * f_data_ode(:,k);
end
toc
display('cdata')
c_data_ode(:,end)
display('fdata')
f_data_ode(:,end)
res = [t_data(end) c_data_ode(:,end)' f_data_ode(:,end)']
display('-----------------')

%% Plot the solutions
fig_solve2(t_data, f_data_ode, c_data_ode);


%% Plot the solutions
%fig_solve(t_data, f_data, c_data, f_data_ode, c_data_ode);