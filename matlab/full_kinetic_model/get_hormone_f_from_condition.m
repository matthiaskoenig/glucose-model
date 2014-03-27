function [ins_f, glu_f, epi_f] = get_hormone_f_from_condition(condition)
% Returns the appropriate hormone functions for the given condition
    dia_strength = 'T2DM'; 
    constant_factors = linspace(0, 600, 5);              % [pmol/l] insulin : constant addition of insulin over full glucose range
    linear_factors   = linspace(0, 1000/16, 5);           % [(pmol/l)/mM] : slope of linear treatment in insulin(glc) plot 
    t2dm = 'diabetes';
    
    switch condition
        case 'normal'
            [ins_f, glu_f, epi_f] = ...
                     hormone_response(condition, dia_strength);
        case 'diabetes'
            [ins_f, glu_f, epi_f] = ...
                     hormone_response(condition, dia_strength);
        case 'insulin_restored'
            [ins_f, glu_f, epi_f] = ...
                     hormone_response(condition, dia_strength);
        case 'glucagon_restored'
            [ins_f, glu_f, epi_f] = ...
                     hormone_response(condition, dia_strength);
        case 'linear_insulin_1'
            set_linear_f(1);
        case 'linear_insulin_2'
            set_linear_f(2);
         case 'linear_insulin_3'
            set_linear_f(3);
         case 'linear_insulin_4'
            set_linear_f(4);
         case 'additive_insulin_1'
            set_additive_f(1);
         case 'additive_insulin_2'
            set_additive_f(2);
         case 'additive_insulin_3'
            set_additive_f(3);
         case 'additive_insulin_4'
            set_additive_f(4);
        otherwise
            error('Unknown condition for simulation');
    end
    
    function set_additive_f(k)
        [ins_f, glu_f, epi_f] = ...
                     hormone_response(t2dm, dia_strength);
        ins_c = constant_factors(k+1);
        ins_f = treatment_insulin_constant_f(ins_c, dia_strength);
    end
    function set_linear_f(k)
        [ins_f, glu_f, epi_f] = ...
                     hormone_response(t2dm, dia_strength);
        ins_m = linear_factors(k+1);
        ins_f = treatment_insulin_linear_f(ins_m, dia_strength);
    end    

end