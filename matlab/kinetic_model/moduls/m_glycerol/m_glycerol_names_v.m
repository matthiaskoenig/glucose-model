function [names] = m_glycerol_names_v()
% NAMES_V Returns metabolite names of the model.
%
% Returns:
%   names:  cell array of names of the reactions
%
%   author: Matthias Koenig 
%   date:   110211

names = {
    'GLYT'  % v1   
    'GLYK'  % v2   
    'GLYDH' % v3   
};
