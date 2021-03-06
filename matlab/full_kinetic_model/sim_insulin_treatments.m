function [glc, M_ins, M_gamma] = sim_insulin_treatments(treatment_type, dia_strength)
%% SIM_INSULIN_TREATMENTS Insulin Treatment Analysis
%   Generation of insulin treatment profiles (absolute).
%   Function is called with treatment type either 'linear_addition' or 
%   'constant_addition'. 
%   Insulin curves of diabetic patients are used and the different
%   treatment regimes are added to this basal curve.
%
%   dia_strenght :   strength of diabetic case (T2DM, extreme_T2DM)
%
%   Returns:
%       glc   :   glucose vector
%       M_ins :   matrix of absolute insulin treatments for the glucose
%                       vector

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110225  -   v0.1

glc = linspace(2, 18, 100);             % extern glucose [mM]
switch dia_strength
    case 'T2DM'
        glu = hormone_abs(glc, 'glucagon', 'T2DM');   
        epi = hormone_abs(glc, 'epinephrine', 'T2DM');
    case 'extreme_T2DM'
        glu = hormone_abs(glc, 'glucagon', 'extreme_T2DM');   
        epi = hormone_abs(glc, 'epinephrine', 'extreme_T2DM');
end
    
switch treatment_type
    case 'constant_addition'
        % [1] constant addition of insulin
        % insulin concentrations
        ins_c = linspace(0,  600, 5);         % additional insulin [pmol/l]

        % Matrix of insulin concentrations
        M_ins = zeros(length(glc), length(ins_c));           % Matrix of insulin concentrations
        for k=1:length(ins_c)
           constant_factor = ins_c(k);    
           M_ins(:,k) = treatment_insulin_constant(glc, ...
                                            constant_factor, dia_strength);
        end

        % Matrix of gammas
        M_gamma = zeros(length(glc), length(ins_c));
        for k=1:length(ins_c)
           M_gamma(:,k) = gamma_f(M_ins(:,k)', glu, epi); 
        end

    case 'linear_addition'
        ins_m = linspace(0, 1000/16, 5);            % slope of additional insulin [(pmol/l)/(mM)]

        % Matrix of insulin concentrations
        M_ins = zeros(length(glc), length(ins_m));
        for k=1:length(ins_m)
           linear_factor = ins_m(k);
           M_ins(:,k) = treatment_insulin_linear(glc, ...
                                            linear_factor, dia_strength);
        end

        % Matrix of gammas
        M_gamma = zeros(length(glc), length(ins_m));
        for k=1:length(ins_m)
           M_gamma(:,k) = gamma_f(M_ins(:,k)', glu, epi); 
        end
    otherwise
        error('Unsupported treatment_type !');
end

end
