function [ins, glu] = sim_cherrington1976_hormones(t, sim, base_t, ...
           inf_t_start, inf_t_end, ins_max, ins_min, glu_max, glu_min)
% Function which calculates the hormone profiles during the infusion
       
ins = ins_max;
glu = glu_max;

% basal, minimal values
if (t >= inf_t_start+base_t) && (t <=inf_t_end)
  switch sim
      case 'somatostatin'
        ins = ins_min;
        glu = glu_min;
      case 'insulin_replacement'
        glu = glu_min;
      case 'glucagon_replacement'
        ins = ins_min;
  end
end

% time dependent drop of hormones (start infusion)
if (t > inf_t_start) && (t < inf_t_start+base_t)
   ins_tmp = ins_min + 0.5*(ins_max-ins_min) + ...
                        0.5*(ins_max-ins_min) * cos(pi/base_t*(t - inf_t_start));
   glu_tmp = glu_min + 0.5*(glu_max-glu_min) + ...
                        0.5*(glu_max-glu_min) * cos(pi/base_t*(t - inf_t_start));
   switch sim
      case 'somatostatin'
        ins = ins_tmp;
        glu = glu_tmp;
      case 'insulin_replacement'
        glu = glu_tmp;
      case 'glucagon_replacement'
        ins = ins_tmp;
  end
end

% time dependent increase of hormones (end infusion)
if (t > inf_t_end) && (t < inf_t_end+base_t)
   ins_tmp = ins_min + 0.5*(ins_max-ins_min) - ...
                0.5*(ins_max-ins_min) * cos(pi/base_t*(t - inf_t_end));
   glu_tmp = glu_min + 0.5*(glu_max-glu_min) - ...
                0.5*(glu_max-glu_min)*cos(pi/base_t*(t - inf_t_end));        
   switch sim
      case 'somatostatin'
        ins = ins_tmp;
        glu = glu_tmp;
      case 'insulin_replacement'
        glu = glu_tmp;
      case 'glucagon_replacement'
        ins = ins_tmp;
   end
end

end