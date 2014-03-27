close all
clear all

sims =  {       'saline'
                'somatostatin' 
                'insulin_replacement'
                'glucagon_replacement'
                'somatostatin_replacement'
              };

t = 80:5:250;
fig1 = figure('Name', 'Test GU/GP function generators', 'Position', [0 1400 600 1400]);
for k_sim = 1:length(sims)
   sim = sims{k_sim};
   
   [f_gp, f_gu] = sim_cherrington1976_gugp_f(sim);
   
   
   subplot(length(sims), 1, k_sim)
   plot(t, f_gp(t), 'rs-',  t, f_gu(t), 'bs-', t, f_gu(t)-f_gp(t), 'ks-')
   
   xlabel('time [min]')
   title(sim)
   grid on
   
   if (k_sim == length(sims))
       legend({'gp', 'gu', 'gp-gu'})
   end
    
    
end