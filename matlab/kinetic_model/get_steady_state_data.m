function [ss_c, ss_v] = get_steady_state_data(vmax, glc_ext)
% Calculate the steady state concentrations and fluxes for given vmax
% values and external glucose.
% used for the calculation of the double mutations
%
%   author  : Matthias Koenig
%   date    : 110810

    % Test the Vmax
    [c_num, v_num] = size(model_stoichiometry());
    if any(vmax<0)
        error('negative Vmax')
    end
    if (length(vmax) ~= v_num)
        
       error('wrong length Vmax') 
    end
    
    % Basic parameters
    mpars.debug = false;
    mpars.t_end      = 200;                                 % integration end time in [min]
    mpars.t_stepsize = 5;                                   % stepsize of calculated t values
    mpars.t_span        = 0:mpars.t_stepsize:mpars.t_end;

    mpars.S_start       = pars_Sex2('mean');                % initial concentrations
    mpars.Vmax = vmax;                                       % Vmax values
    mpars.stoichiometry = model_stoichiometry();            % stoichiometry
    mpars.condition = 'normal';
    mpars.dia_strength = '';

    % Select the appropriate hormonal response function for simulation
    mpars.gamma = [];                       % use normal gamma function
    [mpars.insulin, mpars.glucagon, mpars.epinephrine] = ...
                        hormone_response(mpars.condition, mpars.dia_strength);

    %% Simulation 

    mpars.changed_initial = {
        'lac_ext'       33      0.8                 % [mM] lactate extern  
        'glc_ext'       32      glc_ext             % [mM] glucose extern
        'glyglc'        17      250                 % [mM] glycogen equivalent
    }; 

    % Simulation to steady state with constant glycogen 
    mpars.const_in_simulation = {'glyglc'        17};
    [t, c, v] = model(mpars);

    % correct the data to µmol/min/kg for the fluxes
    v = 12.5 * v;

    % Store steady state concentrations and fluxes
    ss_c = c(end,:);
    ss_v = v(end,:);   
end
