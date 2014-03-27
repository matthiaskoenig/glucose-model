% Visualisation of the Krssak2004 time courses
close all
clear all
disp('Krssak2004 - Visualization')

sims = { 
    'mixed_meal_normal'
    'mixed_meal_t2dm'
    'clamp_normal'
    'clamp_t2dm'
};

N_sims = length(sims);
width = 800;
height = 1600;
xlim_data = [-50 800];

fig = figure('Name', 'Krssak2004', 'Position', [0 height width height]);
for k_sim=1:N_sims
    sim = sims{k_sim};
    disp(sim)
    data = sim_krssak2004_data(sim);
    disp('... data loaded ...')
    
    %% glucose
    if (k_sim <= 2)
        subplot(6,2,1)
    else
        subplot(6,2,2)
    end
    if (k_sim==1) || (k_sim==3)
        errorbar(data.glc_t, data.glc_data, data.glc_sem, 'ks-')
        hold on
    else
        errorbar(data.glc_t, data.glc_data, data.glc_sem, 'bs-')
        hold off
    end
    if (k_sim <= 2)
        title('Mixed Meal Test')
    else
        title('Clamp Test')
    end
    xlabel('time [min]')
    ylabel('glucose [mM]')
    xlim(xlim_data)
    ylim([0 20])
    
    %% ffa
    if (k_sim <= 2)
        subplot(6,2,3)
    else
        subplot(6,2,4)
    end
    if (k_sim==1) || (k_sim==3)
        errorbar(data.ffa_t, data.ffa_data, data.ffa_sem, 'ks-')
        hold on
    else
        errorbar(data.ffa_t, data.ffa_data, data.ffa_sem, 'bs-')
        hold off
    end
    xlabel('time [min]')
    ylabel('ffa [µmol/l]')
    xlim(xlim_data)
    ylim([0 900])
    
    % insulin
    if (k_sim <= 2)
        subplot(6,2,5)
    else
        subplot(6,2,6)
    end
    if (k_sim==1) || (k_sim==3)
        errorbar(data.insulin_t, data.insulin_data, data.insulin_sem, 'ks-')
        hold on
    else
        errorbar(data.insulin_t, data.insulin_data, data.insulin_sem, 'bs-')
        hold off
    end
    xlabel('time [min]')
    ylabel('insulin [pmol/l]')
    xlim(xlim_data)
    ylim([0 1000])
    
    % glucagon
    if (k_sim <= 2)
        subplot(6,2,7)
    else
        subplot(6,2,8)
    end
    if (k_sim==1) || (k_sim==3)
        errorbar(data.glucagon_t, data.glucagon_data, data.glucagon_sem, 'ks-')
        hold on
    else
        errorbar(data.glucagon_t, data.glucagon_data, data.glucagon_sem, 'bs-')
        hold off
    end
    xlabel('time [min]')
    ylabel('glucagon [pmol/l]')
    xlim(xlim_data)
    ylim([10 40])
    
    % glycogen
    if (k_sim <= 2)
        subplot(6,2,9)
    else
        subplot(6,2,10)
    end
    if (k_sim==1) || (k_sim==3)
        errorbar(data.glycogen_t, data.glycogen_data, data.glycogen_sem, 'ks-')
        hold on
    else
        errorbar(data.glycogen_t, data.glycogen_data, data.glycogen_sem, 'bs-')
        hold off
    end
    xlabel('time [min]')
    ylabel('glycogen [mM]')
    xlim(xlim_data)
    ylim([200 370])
    
    % egp
    if (k_sim <= 2)
        subplot(6,2,11)
    else
        subplot(6,2,12)
    end
    if (k_sim==1) || (k_sim==3)
        errorbar(data.egp_t, data.egp_data, data.egp_sem, 'ks-')
        hold on
    else
        errorbar(data.egp_t, data.egp_data, data.egp_sem, 'bs-')
        legend('normal', 'T2DM')
        hold off
    end
    xlabel('time [min]')
    ylabel('EGP [µmol/kg/min]')
    xlim(xlim_data)
    ylim([-5 20])
    
end