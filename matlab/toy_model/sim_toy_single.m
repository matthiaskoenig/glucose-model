
% sim_toy_single - simulation starter for toy model
%
% Toy model to check the scaling of the glucose model.
%
%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2014 Matthias Koenig
%   date:   2014-04-01
%
clear all, format compact

% Initial concentrations
x0 = [10   % A_ext [mM]
      0    % A     [mM]
      0    % B     [mM]
      0];  % B_ext [mM]     

tspan = 0:1:100; % [s]
dydt_fun = @(t,y) dydt_toy_model(t,y);
[t,c] = ode15s(dydt_fun, tspan , x0, odeset('RelTol', 1e-9, 'AbsTol', 1e-9));

% Calculate fluxes from the ODE system
[~, vtmp, ~] = dydt_fun(0, x0);   % get the flux names
Nv = numel(vtmp);
Nt = numel(t);
v  = zeros(Nt, Nv);
v_human = zeros(Nt, Nv);
v_kgbw = zeros(Nt, Nv);

for k=1:Nt
    [~, v(k, :), v_human(k,:), v_kgbw(k,:)] = dydt_fun(t(k), c(k, :));
end


%% Create figure %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cnames = names_c();
vnames = names_v();

figure('Name', 'Concentrations', 'Color', [1 1 1], 'Position', [0 600 1200 600])
plot(t, c)

legend(cnames)
xlabel('time [min]')
ylabel('c [mM]')

figure('Name', 'Fluxes', 'Color', [1 1 1], 'Position', [0 0 1200 600])
for k=1:3
    subplot(1,3,k)
    switch k
        case 1
            plot(t, v)
            ylabel('[mmol/s]')
            title('v [mmol/s]')
        case 2
            plot(t, v_human)
            ylabel('[mu mol/min]')
            title('v_{human} [mu mol/min]')
        case 3
            plot(t, v_kgbw)
            ylabel('[mu mol/min/kgbw]')
            title('v_{kgbw} [mu mol/min/kgbw]')
    end
    legend(vnames)    
    axis square
    xlabel('time [min]')
end
