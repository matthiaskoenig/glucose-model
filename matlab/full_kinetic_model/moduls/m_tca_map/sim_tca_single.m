function [t,c,v,mpars] = sim_tca_single()
%SIM_TCA_SINGLE Performs simple simulation with PPP model.
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

% Settings for module
name = 'tca';
f_fig = @fig_tca_single;
f_ode = @m_tca_ode;

% Debug information
mpars.debug         = false;

% Get the functions for names, stoichiometry and ode
d.name = name;
d.pars          = create_handle(name, 'pars');
d.pars_x        = create_handle(name, 'pars_x');
d.pars_v        = create_handle(name, 'pars_v');
d.dxdt          = create_handle(name, 'dxdt');
                                          
% Basic parameters
mpars   = d.pars()
t_span  = 0:1:50;

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

% [1] integrate to resting state
t_ss_end = 1000;
mpars.z = 0;            % z State
[t_ss,x_ss] = ode15s(@(t,x) d.dxdt(t,x, mpars), [0 t_ss_end], x_init, options);
x0_ss = x_ss(end,:);
mpars_ss = mpars;

% [2] integrate resting state
t_rest_end = 1000;
mpars.z = 0;            % z State
[t_rest,x_rest] = ode15s(@(t,x) d.dxdt(t,x, mpars), [0 t_rest_end], x0_ss, options);
x0_rest = x_rest(end,:);
mpars_rest = mpars;

% [3] change in oxidative phosphorylation
t_oxi_end = 1000;
mpars.z = 0;
[t_deoxi, x_deoxi] = ode15s(@(t,x) d.dxdt(t,x, mpars), [0 t_oxi_end], x0_rest, options);
t_deoxi = t_deoxi+t_rest_end;
mpars_deoxi = mpars;

t = [t_rest; t_deoxi];
x = [x_rest; x_deoxi];

toc

% Calculate the fluxes
Nt = length(t);          % and timepoints
v = zeros(Nt, mpars.Nv);
for k = 1:length(t_rest)
   v(k,:) = f_ode(x(k,:) , t_span(k), mpars_rest);
end
for k = length(t_rest)+1:Nt
   v(k,:) = f_ode(x(k,:) , t_span(k), mpars_deoxi);
end


%% Display the results
disp('*** Create figures ***');
f_fig(t, x, v, mpars);

% Generate images for cytoscape
%modul_fig(t, c, v, d)

end
