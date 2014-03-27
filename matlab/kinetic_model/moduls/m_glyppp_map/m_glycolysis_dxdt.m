function [dxdt] = m_glycolysis_dxdt(t, x_vec, mpars)
%DXDT Calculates the changes in concentration for given concentrations
    % vector of changes in concentration
    dxdt = m_glycolysis_stoichiometry() * m_glycolysis_ode(x_vec, t, mpars);
    
    % set constant concentrations (has to be managed in the above module
    % settings)
    I_const = cell2mat(mpars.x_const.keys());
    dxdt(I_const) = 0;
    
end