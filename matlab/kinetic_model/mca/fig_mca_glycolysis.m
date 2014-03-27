% Create Figures for the MCA of the glycolysis network
%
%   author: Matthias Koenig
%   date: 120311
close all, clear all
disp('*** Create MCA figures ***')

% Data storage
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/mca/120311';
load_data = false;

% Remove the unnecessary information
% Unly the variable concentrations are of interest and the nonzero fluxes
% in the network
%I_c = [4:7 11 15:31 36:40 43:44]
I_c_rem = [1:3 8:10 12:14 17 32:35 41:42 45:49];
I_v_rem = [10 12 24 34:36];

% Dimensions of the matrices
[c_num, v_num] = size(model_stoichiometry())

% Results of the MCA strongly depend on the original state in which the 
% network is (meaning the external glucose concentration)

glc = [3, 9];   % select the glucose concentration for which the MCA is performed
for k=1:length(glc)
    
    % Perform MCA for all given glucose concentrations
    glc_ext = glc(k);    % [mM]
    fprintf('External glucose: %f [mM]\n', glc_ext)
    mpars.out_file  = strcat(out_folder, '/mca_', num2str(glc_ext));
    % Load or recalculate
    if load_data
        
        load(mpars.out_file)
    else
        [mca_c, mca_v] = sim_mca_glycolysis(glc_ext, out_folder);
    end
    
    % Create the figure
    rg_cmap = [0.400000005960464 0 0;0.446153849363327 0 0;0.49230769276619 0 0;0.538461565971375 0 0;0.584615409374237 0 0;0.6307692527771 0 0;0.676923096179962 0 0;0.723076939582825 0 0;0.769230782985687 0 0;0.81538462638855 0 0;0.861538469791412 0 0;0.907692313194275 0 0;0.953846156597137 0 0;1 0 0;1 0.0526315793395042 0.0526315793395042;1 0.105263158679008 0.105263158679008;1 0.157894730567932 0.157894730567932;1 0.210526317358017 0.210526317358017;1 0.263157904148102 0.263157904148102;1 0.315789461135864 0.315789461135864;1 0.368421047925949 0.368421047925949;1 0.421052634716034 0.421052634716034;1 0.473684221506119 0.473684221506119;1 0.526315808296204 0.526315808296204;1 0.578947365283966 0.578947365283966;1 0.631578922271729 0.631578922271729;1 0.684210538864136 0.684210538864136;1 0.736842095851898 0.736842095851898;1 0.789473712444305 0.789473712444305;1 0.842105269432068 0.842105269432068;1 0.89473682641983 0.89473682641983;1 0.947368443012238 0.947368443012238;1 1 1;0.944444417953491 0.972113311290741 0.944444417953491;0.888888895511627 0.944226562976837 0.888888895511627;0.833333313465118 0.916339874267578 0.833333313465118;0.777777791023254 0.888453185558319 0.777777791023254;0.722222208976746 0.860566437244415 0.722222208976746;0.666666686534882 0.832679748535156 0.666666686534882;0.611111104488373 0.804793000221252 0.611111104488373;0.555555582046509 0.776906311511993 0.555555582046509;0.5 0.749019622802734 0.5;0.444444447755814 0.721132874488831 0.444444447755814;0.388888895511627 0.693246185779572 0.388888895511627;0.333333343267441 0.665359497070312 0.333333343267441;0.277777791023254 0.637472748756409 0.277777791023254;0.222222223877907 0.60958606004715 0.222222223877907;0.16666667163372 0.581699371337891 0.16666667163372;0.111111111938953 0.553812623023987 0.111111111938953;0.0555555559694767 0.525925934314728 0.0555555559694767;0 0.498039215803146 0;0.0153846153989434 0.475113123655319 0;0.0307692307978868 0.452187031507492 0;0.0461538471281528 0.429260939359665 0;0.0615384615957737 0.406334847211838 0;0.0769230797886848 0.383408755064011 0;0.0923076942563057 0.360482662916183 0;0.107692308723927 0.337556570768356 0;0.123076923191547 0.314630478620529 0;0.138461545109749 0.291704386472702 0;0.15384615957737 0.268778294324875 0;0.169230774044991 0.245852187275887 0;0.184615388512611 0.222926095128059 0;0.200000002980232 0.200000002980232 0];
    %fig1 = figure('Name', 'MCA c', 'Colormap', rg_cmap, 'Position', [1 900 850 850]);
    fig1 = figure('Name', 'MCA c','Position', [1 900 850 850]);
    edge_alpha = 0.2;

    C = mca_c';
    C(:, I_c_rem) = [];     % delete the concentrations
    C(I_v_rem, :) = [];     % delete the fluxes

    n1_names = names_v();
    n2_names = names_s();
    n1_names(I_v_rem) = [];
    n2_names(I_c_rem) = [];

    [n1, n2] = size(C);
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
    %set(gca, 'EdgeAlpha', 0.2)
    %caxis([0.5 1.5])
    axis('square')
    
    set(gcf, 'PaperPositionMode', 'auto')
    fig_file = strcat(mpars.out_file, '_mca_v.png')
    saveas(fig1, fig_file,'png'); 
    

    %fig2 = figure('Name', 'MCA v', 'Colormap', rg_cmap,'Position', [1 900 850 850]);
    fig2 = figure('Name', 'MCA v', 'Position', [1 900 850 850]);
    C = mca_v';
    C(I_v_rem, :) = [];
    C(:, I_v_rem) = [];
    n1_names = names_v();
    n2_names = names_v();
    n1_names(I_v_rem) = [];
    n2_names(I_v_rem) = [];

    [n1, n2] = size(C);
    C = [C zeros(n1,1); [zeros(1,n2) -1]];
    X = 0.5:1:n2+0.5;
    Y = 0.5:1:n1+0.5;

    p2 = pcolor(X, Y, C);
    set(p2, 'EdgeAlpha', edge_alpha)
    colorbar()

    set(gca, 'YTick', 1:n1) 
    set(gca,'YTickLabel',n1_names())
    set(gca, 'XTick', 1:n2) 
    xticklabel_rotate90(1:n2, n2_names())
    %caxis([0.5 1.5])
    axis('square')
    set(gca, 'XAxisLocation', 'bottom')
    
    set(gcf, 'PaperPositionMode', 'auto')
    fig_file = strcat(mpars.out_file, '_mca_c.png')
    saveas(fig2, fig_file,'png'); 
end



%%%%%
return




glc_ext = 9;    % [mM]
%[mca_c, mca_v] = sim_mca_glycolysis(3)
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110709_data/mca';
mpars.out_file  = strcat(out_folder, '/mca_', glc_ext);
load(mpars.out_file)

figure(11)
%pcolor(mca_c')
subplot(1,2,1)
C = mca_c';
n1_names = names_v();
n2_names = names_s();

[n1, n2] = size(C);
C = [C zeros(n1,1); [zeros(1,n2) -1]];
X = 0.5:1:n2+0.5;
Y = 0.5:1:n1+0.5;
pcolor(X, Y, C), colormap('hot')
colorbar()

set(gca, 'YTick', 1:n1) 
set(gca,'YTickLabel',n1_names())
set(gca, 'XTick', 1:n2) 
xticklabel_rotate90(1:n2, n2_names())
%set(gca,'Ydir','reverse')
caxis([0.5 1.5])
axis('square')
set(gca, 'XAxisLocation', 'bottom')

subplot(1,2,2)
C = mca_v';
n1_names = names_v();
n2_names = names_v();

[n1, n2] = size(C);
C = [C zeros(n1,1); [zeros(1,n2) -1]];
X = 0.5:1:n2+0.5;
Y = 0.5:1:n1+0.5;
pcolor(X, Y, C), colormap('hot')
colorbar()

set(gca, 'YTick', 1:n1) 
set(gca,'YTickLabel',n1_names())
set(gca, 'XTick', 1:n2) 
xticklabel_rotate90(1:n2, n2_names())
%set(gca,'Ydir','reverse')
caxis([0.5 1.5])
axis('square')
set(gca, 'XAxisLocation', 'bottom')
%%%%%


figure(1)
subplot(3,2,1)
pcolor(mca_c')
xlabel('c')
ylabel('Vmax')
set(gca, 'YTick', 1:v_num) 
set(gca,'YTickLabel',names_v())


subplot(3,2,2)
pcolor(mca_v')
xlabel('v')
ylabel('Vmax')


glc_ext = 6;    % [mM]
%[mca_c, mca_v] = sim_mca_glycolysis(glc_ext)
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110709_data/mca';
mpars.out_file  = strcat(out_folder, '/mca_', glc_ext);
load(mpars.out_file)

figure(1)
subplot(3,2,3)
pcolor(mca_c')
xlabel('c')
ylabel('Vmax')

subplot(3,2,4)
pcolor(mca_v')
xlabel('v')
ylabel('Vmax')


glc_ext = 9;    % [mM]
%[mca_c, mca_v] = sim_mca_glycolysis(glc_ext)
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110709_data/mca';
mpars.out_file  = strcat(out_folder, '/mca_', glc_ext);
load(mpars.out_file)

subplot(3,2,5)
pcolor(mca_c')
xlabel('c')
ylabel('Vmax')

subplot(3,2,6)
pcolor(mca_v')
xlabel('v')
ylabel('Vmax')
