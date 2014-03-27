function [vmax] = m_glycerol_pars_vmax()
%% Returns Vmax values for the reaction kinetics 
%
% Returns:
%   Vmax:   vector of Vmax values for the model
%
%   author: Matthias Koenig 
%   date:   110815

% adaption factor for glycerol reactions
f_glycerol = 1;  

% Vmax values
vmax = [
    f_glycerol * 100        % GLYT
    f_glycerol * 100        % GLYK
    f_glycerol * 100        % GLYDH
];

end