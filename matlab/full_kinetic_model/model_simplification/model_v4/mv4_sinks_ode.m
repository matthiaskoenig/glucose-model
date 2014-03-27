function [f] = mv4_sinks_ode(c_init, delta_t)
%MV4_SINKS_ODE Returns the sinks (+)/ sources (-) in reference volume V~
% 
% f : vector of fluxes out of the system
% c_init : initial concentrations in systems
% delta_t : time step for the change
%

% Units
%   time: minutes     [s] ,  
%   concentration     [mM] = [mmol/l] 
%   volume:           [l]
%
%   author: Matthias Koenig 
%           Charite Berlin
%           Computational Systems Biochemistry Berlin
%           matthias.koenig@charite.de
%   date:   110801


% stoichiometric matrix
%   v1   v2  v3  v4
N = [  
   -1     0   0   0     % Glucose ext
    1     0   1  -1     % Glucose
    0     0   0   1     % Glycogen
    0     1  -2   0     % Lactate
    0    -1   0   0     % Lactate ext
];

% ODE Integration
[t_data, c_data] = ode15s( @f_fun, [0, delta_t], c_init, odeset('RelTol', 1e-6, 'NonNegative', 1:4));

% Calculation of fluxes (absolute flux during delta_t)
f = c_data(end,:) - c_data(1,:);

    % ODE System
    function [f_in] = f_fun(t,c)
        % ODE
        f_in = N * mv4_dxdt(c);

        % set constant concentrations (equivalent to zero flux for concentration)
        f_in(1) = 0;    % glucose extern
        f_in(3) = 0;    % glycogen
        f_in(5) = 0;    % lactate extern
    end
end

