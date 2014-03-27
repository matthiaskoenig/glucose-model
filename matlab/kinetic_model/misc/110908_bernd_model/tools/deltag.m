function deltag = deltag(keq, T)
% Calculates the DeltaG value from the given equilibrium constant.
% returnded deltag value is in [kJ/mol].
% Unit of the keq depends on the given reaction equation.
% As additional argument the temperature can be given. If no temperature
% is specified 310K is used.
if nargin == 1
    T = 310;    %[K]
end
R = 8.314;  % [J/molK]
deltag = - R * T * 1E-3 * log(keq); % [kJ/mol]