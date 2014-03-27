function [z1, z2, z3] = komin_functions()
% Functions z2(x1, x2, x3) and z3(x1,x2,x3) giving the fluxes of:
%   z2: flux to glycogen (z2>0) and from glycogen (z2 <0)
%   z3: flux to lactate via glycolysis (z3>0) or flux from lactate (z3<0)
%       via gluconeogenesis
%   z1(x1,x2,x3) import of glucose (z1>0) via hepatic glucose uptake or 
%       glucose export (z1 < 0) via hepatic glucose production is the 
%       combination of z2 and z3
%   z1 = z2 + z3;
%
%   Fluxes z1, z2, z3 are in [µmol/kg/min] meaning µmol glucose per kg body
%   weight and Minute.
%   The fluxes are for the whole Human liver. These fluxes have to be
%   scaled to the individual hepatocyte.
%
%
%
%            x1 (glc_ext)
%                ||
%      ----------||---------------
%     |          || z1
%     |          \/
%     |                z2  
%     |          glc  ====>  x2 (glycogen)
%     |          ||
%     |          || z3
%     |          ||
%     |          \/
%     |          lac
%     |      
%     |          ||
%     |----------||---------------
%                || z3
%                \/
%              x3 (lac_ext)
%
%
%       glc (intern) and lac (intern) are constant in the model due to
%       z1 = z2+z3
%
%   author: Matthias Koenig
%   contact: matthias.koenig@charite.de
%   date: 03 April 2012

    z1 = @f_z1;
    z2 = @f_z2;
    z3 = @f_z3;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Fitted responses depending on glucose_ext and glycogen 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %GNG and GLY % x1 (glucose_ext), x2 (glycogen)
    function [z] = f_gng_gly(x1, x2)
        C = [  -0.013260401508103  -0.000078240970095   0.478235644004833  ...
                0.000002861605817   0.000932752106971  -2.492569641130055  ...
                0.000000166945924  -0.000125285017396   0.015354944655784  ...
               -4.975026288067225];
        z = C(1)*x1^3 + C(2)*x1^2*x2 + C(3)*x1^2 + C(4)*x1*x2^2 + C(5)*x1*x2 ...
            +C(6)*x1 + C(7)*x2^3 + C(8)*x2^2 + C(9)*x2 + C(10);
        return
    end

    %GLYL and GLYS % x1 (glucose_ext), x2 (glycogen)
    function [z] = f_glyl_glys(x1, x2)
        C = [   0.015298362033754  -0.000289250010776  -0.547536679729713  ...
               -0.000005684726209   0.010350112006466   6.232845830004314  ...
               -0.000000348461291   0.000282613503037  -0.115405862243966  ...
              -13.439952615163973];
        z = C(1)*x1^3 + C(2)*x1^2*x2 + C(3)*x1^2 + C(4)*x1*x2^2 + C(5)*x1*x2 ...
            +C(6)*x1 + C(7)*x2^3 + C(8)*x2^2 + C(9)*x2 + C(10);
        return
    end
   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Resulting fluxes taking limitations of substrates into account
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %z1 depending on  x1 (glucose_ext), x2 (glycogen) and x3 (lactate_ext)
    function [z1] = f_z1(x1, x2, x3)
       z1 = f_z2(x1, x2, x3) + f_z3(x1, x2, x3); 
    end
    
    %z2 depending on  x1 (glucose_ext), x2 (glycogen) and x3 (lactate_ext)
    function [z2] = f_z2(x1, x2, x3)
       % gluconeogenesis is limited by available lactate_ext (x3) and
       % depends on storage capacity
       z2 = f_gng_gly(x1, x2);
       % glycogen synthesis is limited by available lactate_ext (x3) and
       % storage capacity (500-x2)
       if (z2 > 0) 
          z2 = z2 * (500-x2)^2/(40^2+(500-x2)^2) * x3^2/(0.3^2 + x3^2);  
       end 
       % glycogenolysis is limited by available glycogen
       if (z2 < 0)
           z2 = z2 * x2^2/(x2^2+40^2);
       end
    end
    
    %z3 depending on  x1 (glucose_ext), x2 (glycogen) and x3 (lactate_ext)
    function [z3] = f_z3(x1, x2, x3)
       % gluconeogenesis is limited by available lactate_ext (x3)
       z3 = f_glyl_glys(x1, x2);
       if (z3 < 0) 
          z3 = z3 * x3^2/(0.3^2 + x3^2);  
       end 
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %scale_subplots(1.01)

end

