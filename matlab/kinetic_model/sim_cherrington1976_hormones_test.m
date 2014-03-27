% Test the hormone profile generating function
close all, clear all
disp('Test the hormone timecourse generating function of Cherrington1976')

% switch of insulin and glucagon profile
% preinfusion from 80 to 135 min
% infusion between 135 and 200 min
% takes ~20 mins for hormones to reach basal levels, with basal
% levels being around 30% of initial values
base_f = 0.3;
base_t = 30;        % min
inf_t_start = 135;  % min 135
inf_t_end   = 200;  % min 200
ins_max = 60;     % pmol/l
ins_min = base_f * ins_max;         % pmol/l
glu_max = 70;    % pmol/l
glu_min = base_f * glu_max;          % pmol/l

% different simulations
sims = { 'saline'
                'somatostatin' 
                'insulin_replacement'
                'glucagon_replacement'
                'somatostatin_replacement'
              };
sims_names = { 'Saline'
               'Somatostatin'
               'Somatostatin & Insulin Replacement'
               'Somatostatin & Glucagon Replacement'
               'Somatostatin Replacement'
               };
               
N_sim = length(sims);

% generate test data
t_vec = 0:2:250;    % min
ins_mat = zeros(length(t_vec), length(sims));    % pmol/l
glu_mat = zeros(length(t_vec), length(sims));    % pmol/l  

for k_sim=1:N_sim
    sim = sims{k_sim};
    for k_t=1:length(t_vec)
        t = t_vec(k_t);
        % get the current hormone concentrations
        [ins_tmp glu_tmp] = sim_cherrington1976_hormones(t, sim, base_t, ...
               inf_t_start, inf_t_end, ins_max, ins_min, glu_max, glu_min);
        ins_mat(k_t, k_sim) = ins_tmp;
        glu_mat(k_t, k_sim) = glu_tmp;

    end
end

% plot the test data
fig1 = figure('Name', 'Hormome concentration profiles', 'Position',[0 400 1920 400]);
ymax = 1.1*max(ins_max, glu_max);
for k_fig = 1:N_sim
    subplot(1, N_sim, k_fig)
    plot(t_vec, ins_mat(:,k_fig), 'bs-', t_vec, glu_mat(:, k_fig), 'rs-')
    title(sims_names{k_fig});
    xlabel('time [min]');
    ylabel('hormome [pmol/l]');
    axis([80 250 0 ymax])
    
    line([inf_t_start inf_t_start], [0 ymax], 'LineStyle', '--', 'Color', 'k')
    line([inf_t_end inf_t_end], [0 ymax], 'LineStyle', '--', 'Color', 'k')
    
    if k_fig == N_sim
       legend({'Insulin', 'Glucagon'}) 
    end
    
end