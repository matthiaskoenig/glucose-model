function [t,x,v,mpars] = sim_single()
%SIM_SINGLE Performs simple single simulation with model.
%   function [t,c,v,mpars] = sim_single()
%   Simulation example with the glycolysis, gluconeogenesis model.
%
%   Returns:
%       t:      vector of time points
%       c:      matrix of concentrations for the time points t
%       v:      matrix of fluxes for the time points t
%       mpars : parameter of simulation

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110809

clear all; close all;

% Debug information
mpars.debug         = false;
flux_factor         = 12.5;     % all fluxes in mM/min/P
                                % factor for conversion to µmol/min/kg

mpars.t_end         = 10;                             % integration time in [min]
mpars.t_stepsize    = 0.1;                                % steps in solution vector (not stepsize of integration !)
mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;
mpars.S_start       = pars_X('mean');                   % initial concentrations
mpars.Vmax          = pars_Vmax();                      % Vmax values
mpars.stoichiometry = model_stoichiometry();         

% Hormonal control
mpars.insulin       = hormone_f('insulin', 'normal');
mpars.glucagon      = hormone_f('glucagon', 'normal');              
mpars.epinephrine   = hormone_f('epinephrine', 'normal');          
mpars.gamma         = [];  % normal gamma function

% Concentration settings for simulation
mpars.const_in_simulation = {'glyglc'  17};     % Glycogen is constatn

% Changed initial concentrations
sim = 1;
switch sim
    case 1
        mpars.changed_initial = {
            'lac_ext'       33      1.2     % [mM] lactate extern  
            'glc_ext'       32      4.0     % [mM] glucose extern
            'glyglc'        17      250       % [mM] glycogen equivalent
        };

    case 2
        mpars.changed_initial = {
            'lac_ext'       33      1.2     % [mM] lactate extern  
            'glc_ext'       32      8.0     % [mM] glucose extern
            'glyglc'        17      250       % [mM] glycogen equivalent
        };
    
    case 3
        mpars.changed_initial = {
            'lac_ext'       33      3     % [mM] lactate extern  
            'glc_ext'       32      6.0     % [mM] glucose extern
            'glyglc'        17      400       % [mM] glycogen equivalent
        };    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Integrate the model
[t, x, v] = model(mpars);
v = flux_factor *v;             % Adaption to physiological values

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figures for timecourses
glc   = x(:,18);
glc6p = x(:,19);
atp = x(:,1);
adp = x(:,2);
amp = x(:,3);

fig1 = figure('Name', 'Time Course');
for k=1:2
    subplot(1,2,k)
    switch k
        case 1
            plot(t, glc, 'r-o', t, glc6p, 'k-o');
            legend('Glucose', 'Glucose-6p');
        case 2
            plot(t, atp, 'r-o', t, adp, 'k-o', t, amp, 'b-o');
            legend('ATP', 'ADP', 'AMP')
    end
    xlabel('time [min]')
    ylabel('concentration [mM]')
    axis square
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate the glucose response in glu and glc6p
glc_ext = linspace(2, 15, 11);
glc = zeros(size(glc_ext));
glc6p = zeros(size(glc_ext));
for k=1:numel(glc_ext)
    k/numel(glc_ext) 
    mpars.changed_initial = {
            'lac_ext'       33      1.2     % [mM] lactate extern  
            'glc_ext'       32      glc_ext(k)     % [mM] glucose extern
            'glyglc'        17      250       % [mM] glycogen equivalent
        };
    % Integrate the model
    [t, x, v] = model(mpars);
    glc(k) = x(end, 18);
    glc6p(k) = x(end, 19);
end

fig2 = figure('Name', 'Response');
    plot(glc_ext, glc, 'r-o', glc_ext, glc6p, 'b-o', glc_ext, glc_ext, 'k-o');
    legend('Glucose', 'Glucose-6p', 'Glucose extern');
    xlabel('glucose ext [mM]')
    ylabel('concentration [mM]')
    axis square
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





