function [] = sim_hypoglycemia_timecourse_figs(file)
close all

if (nargin~=1)
    %file = 'Hypoglycemia_v02.mat'
    file = '/home/mkoenig/Desktop/kinetic_model_results/simulations/120507_data/Hypoglycemia/hypoglycemia_i30_a5.mat'
end
load(file);

conditions = {  'normal'
                'diabetes'
                'insulin_restored'
                'glucagon_restored'
                'linear_insulin_1'
                'linear_insulin_2'
                'linear_insulin_3'
                'linear_insulin_4'
                'additive_insulin_1'
                'additive_insulin_2'
                'additive_insulin_3'
                'additive_insulin_4'
              };

x_lim = [40 220];
fig1 = figure('Name', 'Hypoglycemia', 'Position', [1680 0 500 1200])
for k = 1:length(conditions)
    condition = conditions{k};
    data = getfield(fdata, condition);
    
    % GU and HGP
    if (k<=4)
        subplot(6, 2, 2*(k-1) + 1)
    elseif (k>4 & k<=8)
        subplot(6, 2, 9)
    elseif (k>8 & k<=12)
        subplot(6, 2, 11)
    end
    plot(t_data, data.gu_sim, 'b', t_data, data.gp_sim, 'r') 
    if (k>4)
        hold on;
    end
    axis square
    xlabel('time [min]')
    ylabel({'HGP(red) & GU (blue)', '[µmol/kg/min]'})
    xlim(x_lim);
    %ylim([7 17]);
    
    % glc
    if (k<=4)
        subplot(6, 2, 2*k)
    elseif (k>4 & k<=8)
        subplot(6, 2, 10)
    elseif (k>8 & k<=12)
        subplot(6, 2, 12)
    end
    if any(find([1 2 3 4 5 9]==k))
        fill([x_lim(1) x_lim(2) x_lim(2) x_lim(1)], [0 0 3 3],[1 0.9 0.9], 'EdgeColor', [1 1 1]);
        hold on
    end
    plot(t_data, data.glc_sim, 'k')
    if (k>4)
        hold on;
    end
    axis square
    xlabel('time [min]')
    ylabel('glucose [mM]')
    xlim(x_lim);
    ylim([2.5 4.2]);

end

% Make the subplots bigger and bold
%scale_subplots(1.03);
bold_subplots();




