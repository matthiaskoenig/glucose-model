function [c_init] = m_glycerol_pars_init()
%% M_MODUL_PARS_INIT Inital metabolite concentrations
%   
% Returns:
%   c_init:    vector of initial substrate concentrations
%
%   author: Matthias Koenig 
%   date:   110815

% Experimental data has to be updated (NADH has to be changed)
c_init = [
    2.8     % 1	atp 
    0.8     % 2	adp
    1.22	% 3	nad
    5.6E-4	% 4	nadh
    5E-8	% 5	h
    0.2     % 6	glyc_ext
    0.72	% 7	glyc
    0.5     % 8	glyc3p
    0.03	% 9	dhap
];