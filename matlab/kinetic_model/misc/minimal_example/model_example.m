function [t, c, v] = model_example(mpars)
%% MODEL Simulate kinetic model with given parameters
%   Function for wrapping the ODE integration with given parameters.
%   Use this model function to perform more complex simulations or
%   simulation series.
%
%   Returns 
%       t: timepoints of simulation (set via mpars.t_end and mpars.t_step)
%       c: concentrations at the given timepoints
%       v: fluxes at the given timepoints
%
%   author: Matthias Koenig
%   date:   110614

% Constant metabolite concentrations set to initial concentrations
% during the simulations (for all simulations)
const_metabolites = {};

% Set changed initial concentrations (standard initial concentrations
% overwritten with data in changed inital
mpars.S_start = set_changed_inital(mpars.S_start, mpars.changed_initial);

% Set constant concentrations (additional concentrations can be set
% constant)
[mpars.const_c, const_c_ind] = set_const_in_simulation(mpars.S_start, mpars.const_in_simulation, const_metabolites);


% Integration
[t,c] = ode15s(@(t,y) model_example_ode_options(t, y, mpars), mpars.t_span, ...
                      mpars.S_start, odeset('RelTol', 1e-6, 'NonNegative', 1:5));

% Calculate fluxes
v_num = size(mpars.stoichiometry, 2);
t_num = length(t);
v  = zeros(t_num, v_num);
for k=1:t_num
    v(k, :) = model_example_ode(c(k, :), mpars);
end

% Set constant concentrations
const_vec = ones(t_num, 1);
for k=1:length(const_c_ind)
   c(:, const_c_ind(k)) = const_vec * mpars.const_c(const_c_ind(k),2); 
end








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function S = set_changed_inital(S, changed_initial)
    % Set changed initial concentrations in initial concentration vector
    %   changed_initial = {
    %       'glyglc'        17      250     % [mM] glycogen equivalent
    %   }
        for k_ind=1:length(changed_initial)
           index         = changed_initial{k_ind,2};
           concentration = changed_initial{k_ind,3};
           S(index) = concentration;
        end
    end

    function [const_c, const_c_ind] = set_const_in_simulation(S, const_in_simulation, const_metabolites)
    % Calculates the constant concentration vector
    % first column  : isconstant (1 - true, 0 - false)
    % second column : concentation (value) 
        const_c_ind = sort([[const_in_simulation{:,2}] [const_metabolites{:,2}]]);
        const_c = zeros(length(S), 2);
        const_c(const_c_ind, 1) = 1;
        const_c(const_c_ind, 2) = S(const_c_ind);
    end

    function [] = show_concentration_info()
        % show overview over initial concentrations and which
        % concentrations are set constant in the simulation
        c_names = names_ppp_s;
        disp('--------------------------------')
        disp('name, concentration, constant, value')
        disp('--------------------------------')
        for n_index = 1:size(mpars.stoichiometry,1)
            if mpars.const_c(n_index, 1) == 1
                fprintf('%s \t %f \t %f \t %f\n', c_names{n_index}, mpars.S_start(n_index), mpars.const_c(n_index, 1), mpars.const_c(n_index, 2));
            else
                fprintf('%s \t %f \t \n', c_names{n_index}, mpars.S_start(n_index));
            end
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
