function keq = keq(deltag)
% Calculates the keq value from the given Delta G value in [kJ/mol]
% Unit of the keq depends on the given reaction equation.
% As additional argument the temperature can be given. If no temperature
% is specified 310K is used.
%
% T = 310;    %[K]
% R = 8.314;  % [J/molK]

keq = exp( -deltag/(8.314 * 310 * 1E-3) );