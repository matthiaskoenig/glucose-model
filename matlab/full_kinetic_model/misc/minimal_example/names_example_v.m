function [names] = names_example_v()
% NAMES_V Returns metabolite names of the model.
%
% Returns:
%   names:  cell array of names of the reactions
%
%   author: Matthias Koenig 
%   date:   110614

names = {
    'v1 : A_{ext} <-> A'
	'v2 : A -> B + C'
	'v3 : C <-> C_{ext}'
	'v4 : B <-> C'
    'v5 : C_{ex} ->'
};
