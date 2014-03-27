% Analyse and plot the double mutant data
% The double mutants are sorted based on the distance function. 
%
%   author  : Matthias Koenig
%   date    : 110810 

close all
clear all

%glc_ext = [3 6 9];     % glucose values for the dm calculation
glc_ext = [3];
N = 58;                 % number of double mutants (from simulation)
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110810_data/mca';

% matrix of distances
dist_m = zeros(N, 3*length(glc_ext));

% load distance data (flux and concentration distances for all glucose
% values)
for k = 1:length(glc_ext)
    % files
    out_file = strcat(out_folder, '/mca_g6p_double_mutants_tmp_glc_', num2str(glc_ext(k)) );
    load(out_file)

    % unsorted matrix
    dist_m(:,(k-1)*3 + 1) = cell2mat({ph_dm(:).d_t}) - ph_sm.d_t*ones(1,N);
    dist_m(:,(k-1)*3 + 2) = cell2mat({ph_dm(:).d_c}) - ph_sm.d_c*ones(1,N);
    dist_m(:,(k-1)*3 + 3) = cell2mat({ph_dm(:).d_v}) - ph_sm.d_v*ones(1,N);
end


% sort matrix by selected distance measure
% -> any Vector I can be used for resorting
d_t = dist_m(:,1);              % use the first glucose total distance for sorting
[tmp, I] = sort(d_t,'descend');
dist_m(:,:) = dist_m(I,:);
% sort the names
n1_names = {ph_dm(I).name};

% invert sign (so that better green and worse red)
dist_m = -dist_m;

% add the normal state
%dist_m(end+1,:) = [- ph_sm.d_t -ph_sm.d_c -ph_sm.d_v];
%n1_names{end+1} = 'normal state';

% reduce to the best
%N_best = 20;
%n1_names = {n1_names{1:N_best}};
%dist_m(N_best+1:end, :) = [];

% generate column names based on external glucose and distance
for k=1:length(glc_ext)
    n2_names{(k-1)*3 + 1} = strcat(num2str(glc_ext(k)), ' dist');
    n2_names{(k-1)*3 + 2} = strcat(num2str(glc_ext(k)), ' dist_c');
    n2_names{(k-1)*3 + 3} = strcat(num2str(glc_ext(k)), ' dist_v');
end

%% Plot the matrix of distances
rg_min = floor(min(min(dist_m))*1.2)
rg_max = ceil(max(max(dist_m))*1.2)
rg_cmap = colormap_gwr(rg_min, rg_max);
edge_alpha = 0.0;

fig1 = figure('Name', 'Double Mutation Distance', 'Colormap', rg_cmap, 'Position', [1 900 850 850]);
%fig1 = figure('Name', 'MCA c', 'Position', [1 900 850 850]);
    C = dist_m;
    [n1, n2] = size(C)
    C = [C zeros(n1,1); [zeros(1,n2) -1]];
    X = 0.5:1:n2+0.5;
    Y = 0.5:1:n1+0.5;
    p1 = pcolor(X, Y, C);
    set(p1, 'EdgeAlpha', edge_alpha)

    colorbar()
    set(gca, 'YTick', 1:n1) 
    set(gca,'YTickLabel',n1_names())
    set(gca, 'XTick', 1:n2) 
    xticklabel_rotate90(1:n2, n2_names())
    set(gca, 'XAxisLocation', 'bottom')
    caxis([rg_min rg_max])
    %axis('square')
    
    %set(gcf, 'PaperPositionMode', 'auto')
    %fig_file = strcat(out_file, '.png')
    %saveas(fig1, fig_file,'png'); 