function [ f ] = treatment_insulin_linear_f(ins_m, dia_strength)
%TREATMENT_INSULIN_LINEAR Generates absolute insulin treatment thearaphy.
%   Returns function handle to the treatment giving the absolute insulin
%   concentrations.

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110225  -   v0.1

f = @h_f;

    function [h] = h_f(glc)
        % Get the basal level
        switch dia_strength
            case 'T2DM'
                x       = pars_hormone('insulin', 'T2DM');
            case 'extreme_T2DM'
                x       = pars_hormone('insulin', 'extreme_T2DM');
            case 'no_epi_extreme_T2DM'
                x       = pars_hormone('insulin', 'extreme_T2DM');
            case 'sleep_epi_extreme_T2DM'
                x       = pars_hormone('insulin', 'extreme_T2DM');
            otherwise
                error('unknown dia_strength')
        end
        h = x(2) + (x(1)-x(2)) .* glc.^x(4) ./ (glc.^x(4) + x(3)^x(4));
        
        % constant addition
        h = h + ins_m * glc;
    end

end

