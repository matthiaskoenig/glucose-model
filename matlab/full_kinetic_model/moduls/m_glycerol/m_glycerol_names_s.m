function [names] = m_glycerol_names_s()
% NAMES_S Returns metabolite names of the model.
%
% Returns:
%   names:  cell array of names of the metabolites
%
%   author: Matthias Koenig 
%   date:   110211

names = {
    'atp'       %	S1
    'adp'       %	S2
    'nad'       %   S3
    'nadh'  	%	S4
    'h'         %	S5
    'glyc_ext'  %	S6
    'glyc'  	%	S7
    'glyc3p'  	%	S8
    'dhap'  	%	S9
};