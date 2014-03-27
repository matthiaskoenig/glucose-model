function y = epinephrine_function(glc, x)
% dose-response function to optimize
        % epinephrine = (epi_max-epi_base) .* (1 - glucose_ext.^n_epi ./
        % (glucose_ext.^n_epi + k_epi^n_epi) ) + epi_base;
        y = (x(1)-x(2)) .* (1 - glc^x(4) ./ (glc.^x(4) + x(3)^x(4)) ) + x(2);
end