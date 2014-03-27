function [t,c,v,mpars] = sim_ppp_single()
%SIM_PPP_SINGLE Performs simple simulation with PPP model.
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
%   date:   110523  -   v0.1

clear all
close all

% Debug information
mpars.debug         = false;
flux_factor         = 12.5;     % all fluxes in mM/min/P
                                % factor for conversion to µmol/min/kg

% Get the modul folder
name = 'ppp';

% Get the functions for names, stoichiometry and ode
d.name = name;
d.names_v       = create_handle(name, 'names_v');
d.names_s       = create_handle(name, 'names_s');
d.stoichiometry = create_handle(name, 'stoichiometry');
d.init          = create_handle(name, 'pars_init');
d.pars          = create_handle(name, 'pars');
d.vmax          = create_handle(name, 'pars_vmax');
d.ode            = create_handle(name, 'ode');
                                          
% Basic parameters
SM = d.stoichiometry()
mpars = d.pars()
t_span        = 0:1:50;
[Nc, Nv] = size(SM);        % number of compounds, reactions
Nt = length(t_span);          % and timepoints

% Integrate the system with the settings
tic
options = odeset('NonNegative', Nc);
[t,c] = ode15s(@(t,y) dxdt_f(t,y), t_span, mpars.init, options);
toc

% Calculate the fluxes
v = zeros(Nt, Nv);
for k = 1:Nt
   v(k,:) = d.ode( c(k,:), t_span(k), mpars); 
end

% Display the results
fig_ppp_single(t, c, v, mpars, d);

% Generate images for cytoscape
%modul_fig(t, c, v, d)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function [dxdt] = dxdt_f(t,y)
        dxdt = d.stoichiometry()*d.ode(y,t,mpars);
        % set the constant concentrations
        I = cell2mat({mpars.constant{:,2}});
        dxdt(I) = 0;
    end

end
