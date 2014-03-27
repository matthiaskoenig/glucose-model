function dxdt = sim_blood_flow_ode(t,x,pars)
%SIM_BLOOD_FLOW_ODE ode model for the blood flow
% Blood flow velocity is known (this quantity has to be related to the
% transport of the substances
% pars.v


% First simulations only based on one type of transported compound
N = length(x);              % all concentrations
Nx = length(pars.names);    % number of metabolites
Nb = pars.N_blood;
dxdt = zeros(N, 1);

% set the concentration in first compartment based on the time profile
% this concentration is constant

for k=1:length(pars.names)
    f = pars.f_tc{k};
    x((k-1)*Nb + 1) = f(t);     % pp zonatatin set by tc function
    dxdt((k-1)*Nb + 1) = 0;     % pp compartment constant
end

% Diffusibility
% changes for all the interior compartments
D = 0;      % Diffusion component in both directions
            % units ??? and estimation
     
% change in concentration based on the length of blood compartment and
% blood flow (should remove all the concentration in the given amount of
% time)
v_bflow = pars.d_hep/pars.v_blood*5

% select the used model for transport
model = 1;

% flux proportional to concentration
if model == 1
    for k=1:length(pars.names)
        % changes in the interior compartments
        dxdt((k-1)*Nb+2 : k*Nb-1) = ...
                + D * (x((k-1)*Nb+1 : k*Nb-2) - x((k-1)*Nb+2 : k*Nb-1)) ... % diffusion influx compartment before
                - D * (x((k-1)*Nb+2 : k*Nb-1) - x((k-1)*Nb+3 : k*Nb)) ...   % diffusion efflux compartment after
                + v_bflow * x((k-1)*Nb+1 : k*Nb-2) ...      % influx of concentration due to blood flow
                - v_bflow * x((k-1)*Nb+2 : k*Nb-1);         % efflux of concentratin due to blood flow

        % changes for the last compartment
        dxdt(k*Nb) = ...
                + D * (x(k*Nb-1)-x(k*Nb)) ...     % diffusion influx compartment before
                + v_bflow * x(k*Nb-1) ...      % influx of concentration due to blood flow
                - v_bflow * x(k*Nb);           % efflux of concentratin due to blood flow
    end
end



% flux independent of concentration
if model == 2
    for k=1:length(pars.names)
        % changes in the interior compartments
        dxdt((k-1)*Nb+2 : k*Nb-1) = ...
                + D * (x((k-1)*Nb+1 : k*Nb-2) - x((k-1)*Nb+2 : k*Nb-1)) ... % diffusion influx compartment before
                - D * (x((k-1)*Nb+2 : k*Nb-1) - x((k-1)*Nb+3 : k*Nb)) ...   % diffusion efflux compartment after
                + v_bflow  ...      % influx of concentration due to blood flow
                - v_bflow;         % efflux of concentratin due to blood flow

        % changes for the last compartment
        dxdt(k*Nb) = ...
                + D * (x(k*Nb-1)-x(k*Nb)) ...     % diffusion influx compartment before
                + v_bflow ...      % influx of concentration due to blood flow
                - v_bflow;           % efflux of concentratin due to blood flow
    end
end
