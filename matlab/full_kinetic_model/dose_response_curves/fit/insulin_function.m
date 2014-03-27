function ins = insulin_function(glc, x)
% dose-response function to optimize
        % insulin = (ins_max-ins_base) .* glucose_ext.^n_ins ./
        % (glucose_ext.^n_ins + k_ins^n_ins) + ins_base;
        ins = (x(1)-x(2)) .* glc^x(4) ./ (glc.^x(4) + x(3)^x(4)) + x(2);
end