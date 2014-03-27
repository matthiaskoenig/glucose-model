function [t,c,v,mpars] = sim_opoxi_single()
%SIM_GLYCEROL_SINGLE Performs simple simulation with PPP model.
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
name = 'opoxi';

% Get the functions for names, stoichiometry and ode
d.name = name;
d.pars          = create_handle(name, 'pars');
d.pars_x        = create_handle(name, 'pars_x');
d.pars_v        = create_handle(name, 'pars_v');
d.dxdt          = create_handle(name, 'dxdt');
                                          
% Basic parameters
mpars   = d.pars()

% Generate initial concentration vector
x_init = zeros(mpars.Nx, 1);
for k=1:mpars.Nx
    key = char(mpars.x_names(k));
    x_init(k, 1) = mpars.x_init(key);
end

% test function call
d.dxdt(0, x_init, mpars);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Integrate the system with the settings
disp('*** Simulation ***');
tic

options = odeset('NonNegative', mpars.Nx);
% Steady state start 
mpars.z = 0;
t_end_ss = 1E5;
x_init_ss = x_init;
[t_ss, x_ss] = ode15s(@(t,x) d.dxdt(t,x, mpars), ...
                                        [0 t_end_ss], x_init_ss, options);
mpars_rest = mpars;                 

% Integration for resting state
mpars.z = 0;
t_end_rest = 100;
x_init_rest = x_ss(end, :);
[t_rest, x_rest] = ode15s(@(t,x) d.dxdt(t,x, mpars), ...
                                   [0 t_end_rest], x_init_rest, options);
mpars.rest = mpars;

%{
% Interate deoxigenation
mpars.z = 0;
t_end_deoxi = 1000;
x_init_deoxi = x_rest(end, :);
[t_deoxi, x_deoxi] = ode15s(@(t,x) d.dxdt(t,x, mpars), ...
                                   [0 t_end_deoxi], x_init_deoxi, options);
mpars.deoxi = mpars;
t_deoxi= t_deoxi + t_end_rest;

%t_reoxigenierung sec erregung
mpars.z = 0.9;
t_end_reoxi = 1899;
x_init_reoxi = x_deoxi(end, :);
[t_reoxi, x_reoxi] = ode15s(@(t,x) d.dxdt(t,x, mpars), ...
                                 [0 t_end_reoxi], x_init_reoxi, options);
mpars.reoxi = mpars;
t_reoxi = t_reoxi + t_end_rest + t_end_deoxi;

t = [t_rest; t_deoxi; t_reoxi];
x = [x_rest; x_deoxi; x_reoxi];
%}
t = t_rest;
x = x_rest;

toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate the fluxes
Nt = length(t);          % and timepoints
v = zeros(Nt, mpars.Nv);
for k = 1:length(t_rest)
   v(k,:) = m_opoxi_ode(x(k,:) , t(k), mpars_rest);
end
%{
for k = length(t_rest)+1:length(t_rest)+length(t_deoxi)
   v(k,:) = f_ode(x(k,:) , t(k), mpars_deoxi);
end
for k = length(t_rest)+length(t_deoxi)+1:Nt
   v(k,:) = f_ode(x(k,:) , t(k), mpars_reoxi);
end
%}

%% Display the results
disp('*** Create figures ***');
fig_opoxi_single(t, x, v, mpars);

% Generate images for cytoscape
%modul_fig(t, c, v, d)

end
