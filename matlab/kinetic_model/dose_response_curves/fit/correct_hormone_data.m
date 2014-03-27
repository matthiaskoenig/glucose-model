function c_data = correct_hormone_data(data, factor)
%CORRECT_HORMONE_DATA scales the given hormone data and SEM with the
% factor. 
% Necessary due to effects of one hormone on another like for example
% insulin on glucagon.

c_data = data;
c_data(:,2:3) = factor * c_data(:,2:3);