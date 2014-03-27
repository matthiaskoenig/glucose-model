function [mpars] = m_glycerol_pars()
%M_MODULE_PARS Additional parameter settings for the module.

    % initial concentrations
    mpars.init = m_glycerol_pars_init();
    
    % Vmax values
    mpars.vmax = m_glycerol_pars_vmax();

    % constant concentrations
    mpars.constant = {
    'atp'           1       % energy level
    'adp'           2       % energy level
    'nad'           3       % energy level
    'nadh'          4       % energy level
    'h'             5      % cofactor                    
    'glyc_ext'      6      % external boundary
    'dhap'          9      % external boundary
};

    % hormone functions
    mpars.gamma = [];       % standard gamma function
    mpars.insulin       = hormone_f('insulin', 'normal');               
    mpars.glucagon      = hormone_f('glucagon', 'normal');              
    mpars.epinephrine   = hormone_f('epinephrine', 'normal');       

end