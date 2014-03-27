function [f] = mv4_sinks(c, delta_t)
%FORTRAN_SINKS Returns the sinks (+)/ sources (-) in reference volume V~
% 
% v : vector of fluxes out of the system
% c : concentrations in systems
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

% resulting fluxes from first approxmation
f = N * mv4_dxdt(c) * delta_t;

% set constant concentrations (equivalent to zero flux for concentration)
%f(1) = 0;   % glucose extern
%f(5) = 0;   % lactate extern

end

