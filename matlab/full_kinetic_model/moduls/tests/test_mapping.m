% Test the basic mapping for modules
%
%   date        110408
%   author      Matthias Koenig
%   version     0.1

pars = struct();
[c,m,r,map] = mp_glycolysis(pars)


% mapping of names to indices for the module
pars.indices   = [1 2 3 4 5 6];
pars.names     = {'glc', 'glc_ext', 'lac', 'lac_ext', 'atp', 'adp'}
x = ones(10,1);     % [mM]
t = 10;             % [s]
dxdt = dxdt_glycolysis(t, x, pars)

