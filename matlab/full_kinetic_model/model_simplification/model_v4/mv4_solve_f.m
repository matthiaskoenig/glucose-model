function [f_res, c_res, v_res] = mv4_solve_f(GE_init, GY_init, LE_init, method)
% integrate model mv4 for given external glucose and lactate and glycogen.
%
%   DT  :   complete time of calculation
%   DTC :   internal time steps
%   author: Matthias Koenig 
%           Charite Berlin
%           Computational Systems Biochemistry Berlin
%           matthias.koenig@charite.de
%   date:   110801

% endtime and timesteps (DT and DTC)
DT = 300;                % [s]
DTC = 300;                 % [s]
t_len = DT/DTC + 1; 
V_f = 1;                % Volume relative to reference volume (V/V~)

% storage of timepoints, concentrations and fluxes (F)
NC = 5;                             % number of concentrations
model_sinks_ode = @mv4_sinks_ode;   % dxdt funktion    
model_sinks     = @mv4_sinks;   % dxdt funktion  

% initial conditions
t_data = zeros(1, t_len); 
c_data = zeros(NC, t_len);
f_data = zeros(NC, t_len);
t_data(1,1) = 0;
c_data(:,1) = [
                GE_init     % GLC_ext   C1
                3           % GLC       C2
                GY_init     % Glycogen  C3
                2           % Lactate   C4
                LE_init     % LAC_ext   C5
                
];
% time points for integration
for k = 2:t_len
    t_data(1,k) = t_data(1,k-1) + DTC;
end

%% ODE
if strcmp(method, 'ODE')
    for k = 2:t_len
        f_data(:,k) = model_sinks_ode(c_data(:,k-1), DTC);
        c_data(:,k) = c_data(:, k-1) + V_f * f_data(:,k);
    end

%% Euler
elseif strcmp(method,'Euler')
    for k = 2:t_len 
        f_data(:,k) = model_sinks(c_data(:,k-1), DTC);
        c_data(:,k) = c_data(:, k-1) + V_f * f_data(:,k);
    end
end

f_res = f_data(:,end);
c_res = c_data(:,end);
v_res = mv4_dxdt(c_res);

