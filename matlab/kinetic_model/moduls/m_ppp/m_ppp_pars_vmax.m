function [vmax] = m_ppp_pars_vmax()
%% Returns Vmax values for the reaction kinetics 
%
% Returns:
%   Vmax:   vector of Vmax values for the model
%
%   author: Matthias Koenig 
%   date:   110312

% adaption factors for glycolysis and pentose phosphate pathway
f_gly = 1;  
f_ppp = 0.2;

% Vmax values
vmax = [

    f_gly * 250        % GLUT2
    f_gly * 15         % GK
    f_gly * 11.25      % G6P
    f_gly * 250        % GPI
    f_gly * 0.0025     % PFK2
    f_gly * 0.075      % FBP2
    f_gly * 0.525      % PFK1
    f_gly * 2.575      % FBP1
    f_gly * 250        % ALD
    f_gly * 250        % TPI
    f_ppp * 20         % G6PD
    f_ppp * 20         % PGLS
    f_ppp * 20         % PGD
    f_ppp * 200        % RPE (near equilibrium)
    f_ppp * 40         % RPIA
    f_ppp *  5         % TALDO
    f_ppp *  5         % TKT1
    f_ppp *  5         % TKT2
    f_ppp *  5         % R5PU
    f_ppp *  260        % NADPHU
    f_gly *  0         % GRAPU % NO EFFECT !!!
    f_ppp *  100         % PRPPS
    f_ppp *  1         % PRPPU
             0         % PGLS2 - spontaneaus reaction
];

end