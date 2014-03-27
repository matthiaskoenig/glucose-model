function [ins_f, glu_f, epi_f] = hormone_response(condition, dia_strength)
%HORMONE_RESPONSE Returns hormone function handles for given conditions and
% diabetes strength.
%  
    switch condition
        case 'normal'        
            ins_f  = hormone_f('insulin', 'normal');
            glu_f = hormone_f('glucagon', 'normal');
            epi_f = hormone_f('epinephrine', 'normal');
            
        case 'diabetes'
            switch dia_strength
                case 'T2DM'
                    ins_f  = hormone_f('insulin', 'T2DM');
                    glu_f = hormone_f('glucagon', 'T2DM');
                    epi_f = hormone_f('epinephrine', 'T2DM');
                case 'extreme_T2DM'
                    ins_f  = hormone_f('insulin', 'extreme_T2DM');
                    glu_f = hormone_f('glucagon', 'extreme_T2DM');
                    epi_f = hormone_f('epinephrine', 'extreme_T2DM');
                case 'no_epi_extreme_T2DM'
                    ins_f  = hormone_f('insulin', 'extreme_T2DM');
                    glu_f = hormone_f('glucagon', 'extreme_T2DM');
                    epi_f = [];
                case 'sleep_epi_extreme_T2DM'
                    ins_f     = hormone_f('insulin', 'extreme_T2DM');
                    glu_f    = hormone_f('glucagon', 'extreme_T2DM');
                    epi_f = hormone_f('epinephrine', 'sleep');
                otherwise
                    error('Unknown dia_strength')
            end
            
        case 'insulin_restored'
            ins_f = hormone_f('insulin', 'normal');
            switch dia_strength
                case 'T2DM'
                    glu_f    = hormone_f('glucagon', 'T2DM');
                    epi_f = hormone_f('epinephrine', 'T2DM');
                case 'extreme_T2DM'
                    glu_f    = hormone_f('glucagon', 'extreme_T2DM');
                    epi_f = hormone_f('epinephrine', 'extreme_T2DM');
                case 'no_epi_extreme_T2DM'
                    glu_f    = hormone_f('glucagon', 'extreme_T2DM');
                    epi_f = [];
                case 'sleep_epi_extreme_T2DM'
                    glu_f    = hormone_f('glucagon', 'extreme_T2DM');
                    epi_f = hormone_f('epinephrine', 'sleep');
                otherwise
                    error('Unknown dia_strength')
            end
            
        case 'glucagon_restored'
            glu_f = hormone_f('glucagon', 'normal');
            switch dia_strength
                case 'T2DM'
                    ins_f  = hormone_f('insulin', 'T2DM');
                    epi_f = hormone_f('epinephrine', 'T2DM');
                case 'extreme_T2DM'
                    ins_f  = hormone_f('insulin', 'extreme_T2DM');
                    epi_f = hormone_f('epinephrine', 'extreme_T2DM');
                case 'no_epi_extreme_T2DM'
                    ins_f  = hormone_f('insulin', 'extreme_T2DM');
                    epi_f = [];
                case 'sleep_epi_extreme_T2DM'
                    ins_f  = hormone_f('insulin', 'extreme_T2DM');
                    epi_f = hormone_f('epinephrine', 'sleep');
                otherwise
                    error('Unknown dia_strength')
            end
            
    end
end

