function [t,c,v,mpars] = sim_glycolysis_single()
%SIM_GLYCOLYSIS_SINGLE Performs simple simulation with PPP model.
%   function [t,c,v,mpars] = sim_ppp_single()
%   Simulation example with the glycolysis, gluconeogenesis and ppp model.
%
%   Returns:
%       t:      vector of time points
%       c:      matrix of concentrations for the time points t
%       v:      matrix of fluxes for the time points t
%       mpars : parameter of simulation

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110820  -   v0.1

clear all; close all; format compact;

%% Initialisation
disp('*** Initialisation ***');

% Debug information
mpars.debug         = false;

% Get the modul folder
name = 'glycolysis';

% Get the functions for names, stoichiometry and ode
d.name = name;
d.pars          = create_handle(name, 'pars');
d.pars_x        = create_handle(name, 'pars_x');
d.pars_v        = create_handle(name, 'pars_v');
d.dxdt          = create_handle(name, 'dxdt');
                                          
% Basic parameters
mpars   = d.pars()
t_span  = 0:1:2000;

% Generate initial concentration vector
x_init = zeros(mpars.Nx, 1);
for k=1:mpars.Nx
    key = char(mpars.x_names(k));
    x_init(k, 1) = mpars.x_init(key);
end

% test function call
d.dxdt(0, x_init, mpars);

%% Integrate the system with the settings
disp('*** Simulation ***');
tic
options = odeset('NonNegative', mpars.Nx);
[t,c] = ode15s(@(t,x) d.dxdt(t,x, mpars), t_span, x_init, options);
toc

% Calculate the fluxes
Nt = length(t_span);          % and timepoints
v = zeros(Nt, mpars.Nv);
for k = 1:Nt
   v(k,:) = m_glycolysis_ode(c(k,:) , t_span(k), mpars);
end


%% Display the results
disp('*** Create figures ***');
fig_glycolysis_single(t, c, v, mpars);

% Generate images for cytoscape
%modul_fig(t, c, v, d)

end
