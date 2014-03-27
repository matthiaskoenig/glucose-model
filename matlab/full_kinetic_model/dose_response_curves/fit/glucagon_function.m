function y = glucagon_function(glc, x)
% dose-response function to optimize
        % glucagon = (glu_max-glu_base) .* (1 - glucose_ext.^n_glu ./
        % (glucose_ext.^n_glu + k_glu^n_glu) ) + glu_base;
        y = (x(1)-x(2)) .* (1 - glc^x(4) ./ (glc.^x(4) + x(3)^x(4)) ) + x(2);
end