function [mpars] = m_ppp_pars()
%M_MODULE_PARS Additional parameter settings for the module.

    % initial concentrations
    mpars.init = m_ppp_pars_init();
    
    % Vmax values
    mpars.Vmax = m_ppp_pars_vmax();

    % constant concentrations
    mpars.constant = {
        'atp'           1       % energy level
        'adp'           2       % energy level
        'amp'           24      % energy level
        'p'             5       % cofactor
        'h20'           6       % cofactor
        'co2'           7       % cofactor
        'h'             8       % cofactor                    
        'glc_ext'       23      % external boundary
    };

    % hormone functions
    mpars.gamma = [];
    mpars.insulin       = hormone_f('insulin', 'normal');               
    mpars.glucagon      = hormone_f('glucagon', 'normal');              
    mpars.epinephrine   = hormone_f('epinephrine', 'normal');       

end