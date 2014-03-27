function [mpars] = m_glycolysis_pars()
%M_MODULE_PARS Additional parameter settings for the module.

    % initial concentrations
    mpars.init = m_glycolysis_pars_init();
    
    % Vmax values
    mpars.vmax = m_glycolysis_pars_vmax();

    % constant concentrations
    mpars.constant = {
    'atp'           1       % energy level
    'adp'           2       % energy level
    'amp'           3       % energy level
    'nad'           8       % energy level
    'nadh'          9       % energy level
    'p'             10      % cofactor
    'h20'           12      % cofactor
    'co2'           13      % cofactor
    'h'             14      % cofactor                    
    'glc_ext'       32      % external boundary
    'lac_ext'       33      % external boundary
    'co2_mito'      34      % cofactor
    'p_mito'        35      % cofactor
    'acoa_mito'     38      % boundary TCA
    'cit_mito'      40      % boundary TCA
    'atp_mito'      41      % energy level
    'adp_mito'      42      % energy level
    'coa_mito'      45      % boundary TCA
    'nadh_mito'     46      % energy level
    'nad_mito'      47      % energy level
    'h_mito'        48      % cofactor
    'h2o_mito'      49      % cofactor
};

    % hormone functions
    mpars.gamma = [];       % standard gamma function
    mpars.insulin       = hormone_f('insulin', 'normal');               
    mpars.glucagon      = hormone_f('glucagon', 'normal');              
    mpars.epinephrine   = hormone_f('epinephrine', 'normal');       

end