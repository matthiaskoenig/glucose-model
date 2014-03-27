function [t,c,v,mpars] = sim_oxphos_single()
%SIM_PPP_SINGLE Performs simple simulation with oxphos model
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

% Get the modul folder
name = 'oxphos';

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
options = odeset('NonNegative', Nc);
[t,c] = ode15s(@(t,y) dxdt_f(t,y), t_span, mpars.init, options);


% Necessary to combine the two modules into one complete module

% Generate one large concentration vector from the concentrations of the
% single module
x =

I_m1 % indices of module1 in this vector
I_m2 % indices of module2 in this vector


% flux vectors as result of concentration vectors
    function [dxdt] = 
        dxdt = zeros(length(x))
        dxdt(I_m1) = dxdt_m1(c)
dxdt_m1 = dxdt_m1_f(c, 



dxdt = [




%Startpunkt festlegen
[t,x]=ode15s(@HH_Energy_Abl_CAC,[0 1e5],x_start0,opt,0);
dd=size(x);
x0=x(dd(1),:); %Ruhezustand

%integrate for t_ruhe sec (Ruhezustand)
t_ruhe=100
[t,x] = ode15s(@HH_Energy_Abl_CAC,[0 t_ruhe],x0,opt,0); 
dd=size(x);
S_rest=x(dd(1),:);
xrest=x;
trest=t;

%t_oxi_weg  f"ur t_oxi sec 
t_oxi=1000
[t,x] = ode15s(@HH_Energy_Abl_CAC,[0 t_oxi],S_rest,opt,0);%
dd=size(x);
S_deoxi=x(dd(1),:); %startwerte nach deoxigenierung 
x_deoxi=x;
t_deoxi=t+t_ruhe;

%t_reoxigenierung sec erregung
t_erregung=1899
[t,x] = ode15s(@HH_Energy_Abl_CAC,[0 t_erregung],S_deoxi,opt,0.9);
dd=size(x);
S_reoxi=x(dd(1),:); %startwerte anch erregung 
x_reoxi=x;
t_reoxi=t+t_ruhe+t_oxi;

tall=[trest; t_deoxi; t_reoxi];
xall=[xrest; x_deoxi; x_reoxi];









% Calculate the fluxes
v = zeros(Nt, Nv);
for k = 1:Nt
   v(k,:) = d.ode( c(k,:), t_span(k), mpars); 
end

% Display the results
fig_ppp_single(t, c, v, mpars, d);

% Generate images for cytoscape
modul_fig(t, c, v, d)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function [dxdt] = dxdt_f(t,y)
        dxdt = d.stoichiometry()*d.ode(y,t,mpars);
        % set the constant concentrations
        I = cell2mat({mpars.constant{:,2}});
        dxdt(I) = 0;
    end

end
