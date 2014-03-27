function [v_names, vmax, v_ind] = m_glycerol_pars_v()
%% M_PPP_PARS_V Definition of the flux names and Vmax values
%
% Returns:
%   v_names: cellarray of names
%   Vmax:    map of vmax values
%
%   author: Matthias Koenig 
%   date:   110820

% scaling factors for glycolysis and pentose phosphate pathway
f_glycerol = 1;  

% flux data
data = {
    'GLYT',     f_glycerol * 100      % v1   
    'GLYK',     f_glycerol * 100      % v2   
    'GLYDH',    f_glycerol * 100      % v3   
}

v_names = data(:,1);
vmax     = containers.Map(v_names, cell2mat(data(:,2)));
v_ind    = containers.Map(v_names, [1:length(v_names)]);    % necessary if stoichiometric matrix

end