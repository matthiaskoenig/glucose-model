function [h] = hormone_abs(glc, hormone, condition)
%HORMONE_F Calculates the absolute hormone dose response curves.

f = hormone_f(hormone, condition);
h = f(glc);

end
