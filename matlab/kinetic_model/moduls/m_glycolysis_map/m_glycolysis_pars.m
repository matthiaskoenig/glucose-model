function [mpars] = m_glycolysis_pars()
%M_MODULE_PARS Additional parameter settings for the module.

% author:   Matthias Koenig
% date:     110820
% version:  0.1

    % x_names, initial x values [mM] and constant x_values
    [mpars.x_names, mpars.x_init, mpars.x_ind, mpars.x_const] = m_glycolysis_pars_x();
    
    % v names and vmax values
    [mpars.v_names, mpars.vmax, mpars.v_ind] = m_glycolysis_pars_v();

    % hormone functions
    mpars.gamma = [];       % standard gamma function
    mpars.insulin       = hormone_f('insulin', 'normal');               
    mpars.glucagon      = hormone_f('glucagon', 'normal');              
    mpars.epinephrine   = hormone_f('epinephrine', 'normal');       
    
    % generate helper variables
    mpars.Nx = length(mpars.x_names);
    mpars.Nv = length(mpars.v_names);

end