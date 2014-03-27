function [] = sim_blood_flow()
%%SIMPLE_ZONATTION Simulation of various blood flow models.
% Generates the outer blood compartments and the blood flow model from pp
% to pv hepatocytes.
%
% Hepatocytes are not taken into account. This is just a test suit for the
% various blood flow models
%   
%   author: Matthias Koenig
%   date:   110413
%   version:    0.1


% Simple layout of identical number of cell and blood compartments
pars.N_hep    = 10;                              % number of cells in the sinosoid
pars.k_layout = 2;                              % layout parameter relating blood to hepatocytes
pars.N_blood = pars.k_layout * pars.N_hep;       % Number of blood compartments

% blood compartment parameters
pars.L_sin   = 1E-3;                      % [m] length sinosoid
pars.d_blood = pars.L_sin/pars.N_blood;    % [m] length blood compartment   
pars.d_hep   = pars.L_sin/pars.N_hep;     % [m] length hepatocyte (~50µm)
pars.d_sin   = 5.7E-6;                    % [m] diameter of sinosoid
pars.n_sin   = 5.23E9;                    % Number of sinosoids
pars.V_blood = pars.n_sin * pars.d_hep*pi*(0.5*pars.d_sin)^2;   % [m^3] Volume of blood compartment

% blood flux parameters (flux rate based on estimated time for sonosoid
% passage
pars.v_blood = 180E-6;                     % [m/s]  blood flux
pars.t_pas   = pars.d_blood/pars.v_blood;  % [s] time for passing one compartment

% timesteps for integration
pars.t_start = 0;                          % [s]   start of simulation
pars.t_end  =  50;                         % [s]   end of simulation

% Transported entities are glucose and lactate
% Initial blood glucose and lactate concentrations
pars.names = {'glc_ext', 'lac_ext' , 'test_1', 'test_2'};
%pars.names = {'glc_ext'};
pars.f_max = { 9       ,  5        , 4       , 7       };
pars.f_base= { 3       ,  0        , 2       , 0       };
pars.f_type= {'sinus'  , 'gauss', 'step', 'constant'}; 
pars

% initial concentration for simulation
init.m = cell(1,length(pars.names));
for k=1:length(pars.names)
   init.m{k} = pars.f_max{k}*ones(pars.N_blood,1);  % [mM]
end

% Timecourse of metabolites (simplest case only glucose and lactate)
pars.f_tc = cell(1,length(pars.names));
for k=1:length(pars.names)
   pars.f_tc{k} = tc_generator(pars.f_type{k}, pars.f_max{k}, pars.f_base{k}); 
end

% Integrate the ODE system with the given distribution
% define various 
% Set the maximum step size depending on the rapidity of the occuring
% events (here the change in periportal blood flow)
tspan = linspace(pars.t_start, pars.t_end, 501);
x0 = make_init(pars.names);
[t,x] = ode15s(@(t,x) sim_blood_flow_ode(t, x, pars), tspan, x0, odeset('RelTol', 1e-6));


% Set the constant values of the simulation
for k=1:length(pars.names)
    f = pars.f_tc{k};
    x(:,(k-1)*pars.N_blood +1) = f(tspan);     
end


% plot the used periportal concentration profile
close all
fig1 = figure('Name', 'x(1)');
for k=1:length(pars.names)
    f = pars.f_tc{k};
    y = f(tspan);
    plot(t, y);hold on
end
hold off
xlabel('time [s]');
ylabel('c [mM]');
legend(pars.names)


% plot the resulting concentration matrix
compartments = (1:length(pars.names)*pars.N_blood);
fig2 = figure('Name', 'x & dxdt');
subplot(2,1,1)
p1 = pcolor(compartments, t, x);
set(p1, 'EdgeAlpha', 0.1)
xlabel('compartment')
ylabel('t [s]')
colorbar()

% plot the resulting flux matrix
dxdt = zeros(size(x));
for k=1:length(tspan)
   dxdt(k,:) = sim_blood_flow_ode(tspan(k), x(k,:), pars);
end
subplot(2,1,2)
p1 = pcolor(compartments, t, dxdt);
set(p1, 'EdgeAlpha', 0.1)
xlabel('compartment')
ylabel('t [s]')
colorbar




% store the solution of the ODE integration in appropriate vectors
%save('test.mat', 't', '-v7.3');

% Display the simulation result
%fig_simple_zonation(t_all, glc_ext_all, lac_ext_all, x_all, v_all, pars, init);

    function x0 = make_init(names)
    % Generate the initial values of the simulation    
        Nx = length(names);             % number of metabolites
        x0 = zeros(Nx*pars.N_blood ,1);
        for p=1:Nx
            x0( (p-1)*pars.N_blood + 1:(p-1)*pars.N_blood+pars.N_blood ) = init.m{k};
        end
    end
end

