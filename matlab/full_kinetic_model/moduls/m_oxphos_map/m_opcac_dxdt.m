function [dxdt] = m_opcac_dxdt(t, x_vec, mpars)
%DXDT Calculates the changes in concentration for given concentrations
    

    % vector of changes in concentrations (stoichiometric matrix)
    %dxdt = m_glycerol_stoichiometry() * m_opoxi_ode(x_vec, t, mpars);
    
    % vector of changes directly returned 
    dxdt = m_opcac_ode(x_vec, t, mpars);
    dxdt(1:24) = [];         % fluxes through reactions
                             % 25:end : direct change fluxes for 
    
    
    % set constant concentrations (has to be managed in the above module
    % settings)
    I_const = cell2mat(mpars.x_const.keys());
    dxdt(I_const) = 0;
    
end