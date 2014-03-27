function g = gamma_f(ins, glu, epi)
%% GAMMA_F calculate gamma switch from insulin, glucagon and epinephrine
%   Absolute insulin, glucagon and epinephrine values are used in the
%   gamma calculation.
%   Epinephrine is a backup system for glucagon. 
%   
% Returns:
%       g : gamma in [0, 1]. 
%
% Gamma = 0 is switch in gluconeogenese direction.
% Gamma = 1 is switch in glycolysis direction.
%
%   author:     Matthias Koenig
%   date:       110222
if ( any(ins<0) || any(glu<0))
    error('Negative hormone concentrations.')
end

K_val = 0.1;
x_ins = pars_hormone('insulin', 'normal');
x_glu = pars_hormone('glucagon', 'normal');
K_ins = (x_ins(1)-x_ins(2) ) * K_val;
K_glu = (x_glu(1)-x_glu(2) ) * K_val;
ins = max(0.0, ins-x_ins(2));
glu = max(0.0, glu-x_glu(2));

% Only insulin and glucagon are used for gamma calculation
if (nargin == 2)
    g = 0.5 * (1 - ins./(ins + K_ins) + glu./(glu + K_glu) );
    %g = 0.5 * (1 - ins./(ins + K_ins));
end

% If epinephrine is given, the maximum of the glucagon and epinephrine
% answer (weighted with the epinephrine effectiveness) is used for the
% gamma calculation
if (nargin == 3)
    if any(epi<0)
        error('Negative hormone concentrations.')
    end
    epi_effectiveness = 0.8;
    x_epi = pars_hormone('epinephrine', 'normal');
    K_epi = (x_epi(1)-x_epi(2)) * K_val;
    epi = epi-x_epi(2);
    g = 0.5 * (1 - ins./(ins + K_ins) + max(glu./(glu + K_glu), epi_effectiveness*epi./(epi + K_epi)) );
end


