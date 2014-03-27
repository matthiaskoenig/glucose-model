% Figures for the glycogen synthesis and glycogenolyis
close all, clear all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [1] glycogenolysis
% load simulation data
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/111031_data/glucose_dependency/T2DM_500'
condition  = 'normal'
in_file = strcat(out_folder, '/glucose_dependency_', condition);
load(in_file);

% plot range
t_offset = 1;           % offset for t (very rapid changes in first minute not shown)
edge_alpha_val = 0;
pcolor_edge_alpha = 0;

% plot boundaries
glc_min = 3.5;
glc_max = 5;
t_max = 3900; 

% indeces of plot boundaries
glc_ext = mpars.glc_ext;
t_span  = mpars.t_span; 
tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
tmp = find(t_span>=t_max); t_max_ind = tmp(1);
t_min_ind = t_offset;
t_min = 0;

x1 = glc_ext(glc_min_ind:glc_max_ind);
y1 = t_span(t_offset:t_max_ind)/60;      % time in [h]

z1 = c_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 17);

%% variable external glucose over time
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/111031_data/glucose_dependency/T2DM_500_var'
condition  = 'normal'
in_file = strcat(out_folder, '/glucose_dependency_', condition);
load(in_file);

% indeces of plot boundaries
glc_ext = mpars.glc_ext;
t_span  = mpars.t_span; 
tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
tmp = find(t_span>=t_max); t_max_ind = tmp(1);
t_min_ind = t_offset;
t_min = 0;

x1_var = glc_ext(glc_min_ind:glc_max_ind);
y1_var = t_span(t_offset:t_max_ind)/60;      % time in [h]

z1_var = c_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 17);

%% diabetes
% load simulation data
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/111031_data/glucose_dependency/T2DM_500'
condition  = 'diabetes'
in_file = strcat(out_folder, '/glucose_dependency_', condition);
load(in_file);

% plot boundaries
glc_min = 3.5;
glc_max = 6;
t_max = 3900; 

% indeces of plot boundaries
glc_ext = mpars.glc_ext;
t_span  = mpars.t_span; 
tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
tmp = find(t_span>=t_max); t_max_ind = tmp(1);
t_min_ind = t_offset;
t_min = 0;

x1_T2DM = glc_ext(glc_min_ind:glc_max_ind);
y1_T2DM = t_span(t_offset:t_max_ind)/60;      % time in [h]

z1_T2DM = c_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 17);

%% variable external glucose over time
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/111031_data/glucose_dependency/T2DM_500_var2'
condition  = 'diabetes'
in_file = strcat(out_folder, '/glucose_dependency_', condition);
load(in_file);

% indeces of plot boundaries
glc_ext = mpars.glc_ext;
t_span  = mpars.t_span; 
tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
tmp = find(t_span>=t_max); t_max_ind = tmp(1);
t_min_ind = t_offset;
t_min = 0;

x1_var_T2DM = glc_ext(glc_min_ind:glc_max_ind);
y1_var_T2DM = t_span(t_offset:t_max_ind)/60;      % time in [h]

z1_var_T2DM = c_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 17);


%% variable external glucose over time
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/111031_data/glucose_dependency/T2DM_200_var2'
condition  = 'diabetes'
in_file = strcat(out_folder, '/glucose_dependency_', condition);
load(in_file);

% indeces of plot boundaries
glc_ext = mpars.glc_ext;
t_span  = mpars.t_span; 
tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
tmp = find(t_span>=t_max); t_max_ind = tmp(1);
t_min_ind = t_offset;
t_min = 0;

x1_var2_T2DM = glc_ext(glc_min_ind:glc_max_ind);
y1_var2_T2DM = t_span(t_offset:t_max_ind)/60;      % time in [h]

z1_var2_T2DM = c_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 17);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [2] glycogen synthesis
% load simulation data
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/111031_data/glucose_dependency/T2DM_200'
condition  = 'normal'
in_file = strcat(out_folder, '/glucose_dependency_', condition);
load(in_file);

% plot range
t_offset = 1;           % offset for t (very rapid changes in first minute not shown)
edge_alpha_val = 0;
pcolor_edge_alpha = 0;

% plot boundaries
glc_min = 5.5;
glc_max = 8;
t_max = 300; 

% indeces of plot boundaries
glc_ext = mpars.glc_ext;
t_span  = mpars.t_span; 
tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
tmp = find(t_span>=t_max); t_max_ind = tmp(1);
t_min_ind = t_offset;
t_min = 0;

x2 = glc_ext(glc_min_ind:glc_max_ind);
y2 = t_span(t_offset:t_max_ind)/60;      % time in [h]

z2 = c_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 17);

% load diabetes data glycogen synthesis
condition  = 'diabetes'
in_file = strcat(out_folder, '/glucose_dependency_', condition);
load(in_file);

% plot boundaries
glc_min = 5.5;
glc_max = 8;
t_max = 300; 

% indeces of plot boundaries
glc_ext = mpars.glc_ext;
t_span  = mpars.t_span; 
tmp = find(glc_ext>=glc_min); glc_min_ind = tmp(1);
tmp = find(glc_ext<=glc_max); glc_max_ind = tmp(end);
tmp = find(t_span>=t_max); t_max_ind = tmp(1);
t_min_ind = t_offset;
t_min = 0;

x2_T2DM = glc_ext(glc_min_ind:glc_max_ind);
y2_T2DM = t_span(t_offset:t_max_ind)/60;      % time in [h]

z2_T2DM = c_full(glc_min_ind:glc_max_ind, t_offset:t_max_ind, 17);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Experimental data for glycogenolysis
% Rothman 1991
rothman1991 = [
3.9758	369.097	3.88951	373.845	4.04596	483.752	NaN	NaN	NaN	NaN	3.88969	372.489	4.5773	354.855
6.81345	287.032	6.55356	308.739	NaN	NaN	7.05665	388.798	7.40293	361.664	6.81015	311.455	6.98301	299.923
9.89522	299.948	9.72079	323.013	9.61854	445.807	9.89604	293.842	10.4874	354.905	9.72299	306.731	10.0712	265.35
13.1554	259.948	12.8064	307.435	12.8796	399.702	13.0723	241.63	NaN	NaN	12.7287	248.411	NaN	NaN
15.9038	205.019	15.7378	165.669	15.7974	358.343	15.6468	205.017	16.4027	315.607	15.7281	237.582	14.534	200.258
21.7464	70.0617	21.8198	160.971	21.7184	276.982	22.0807	131.801	22.0694	215.248	22.0786	147.405	NaN	NaN
28.0852	66.7233	27.6523	101.319	27.3765	240.395	28.0791	111.499	28.2365	214.622	27.6523	101.319	27.303	150.163
39.9951	36.2951	39.9069	55.2903	39.8212	55.2895	40.1592	89.2138	40.1567	108.21	39.9925	55.291	39.7355	55.9672
45.6464	49.9115	45.7296	67.5513	45.6465	49.2331	45.7305	60.7671	46.5819	98.7662	45.4751	49.2317	45.7306	60.0886
51.469	62.851	51.7255	66.2453	51.4658	86.5959	52.0709	45.8955	51.8109	68.2813	51.5544	64.887	51.5596	26.2167
63.9771	42.6043	63.5493	39.2085	63.2936	29.7084	64.4928	29.7185	64.1416	92.8093	63.6352	37.174	63.8092	17.5011
];

magnusson1992 = [
4	282.446	60.566
13.5	163.062	43.094
17	113.561	33.194
19.5	124.626	26.206
22.5	96.6722	22.7118
];

magnusson1992_T2DM = [
    4	129.285	19.218
    13.5	94.9251	15.1419
    17	71.0483	15.7238
    19.5    78.619	17.4709
    22.5	67.5541	14.5591
];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Experimental data for glycogen synthesis
radziuk2001 = [
    1.59234	200.986	1.59347	200.659	1.59461	200.331
29.6751	232.499	119.513	248.682	59.5685	201.718
59.4327	241.062	148.735	258.229	90.3629	218.152
89.1893	249.954	178.453	278.268	119.031	234.255
119.492	254.584	238.493	297.691	149.327	240.852
149.229	269.377	NaN	NaN	179.046	260.564
179.503	282.204	NaN	NaN	208.773	277.98
209.244	295.685	NaN	NaN	238.52	289.822
238.976	311.79	NaN	NaN	NaN	NaN
];

taylor1996 = [
    0	206.604	21.132
120	247.358	17.359
150	259.434	18.113
180	279.057	19.622
260	295.66	21.887
];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
color_data = [0.6 0.6 0.6];
color_data_T2DM = [0 0 1];

figure(1)
subplot(1,2,1)
psim = plot(y1, z1(2:end,:), '--', 'Color', color_data), hold on
psim = plot(y1, z1(1,:), '--', 'Color', color_data,'LineWidth', 2.0); hold on
psim = plot(y1, z1(end,:), '--', 'Color', color_data, 'LineWidth', 2.0); hold on
psim = plot(y1_var, z1_var(1,:), '--', 'Color', color_data, 'LineWidth', 2.0); hold on
for k=1:7
    xtmp = rothman1991(:,2*(k-1)+1);
    ytmp = rothman1991(:,2*(k-1)+2);
    pdata = plot(xtmp(~isnan(xtmp)), ytmp(~isnan(ytmp)), '-s', ...
        'MarkerSize',4.0, 'MarkerEdgeColor', [0.2 0.2 0.2]);
    set(pdata, 'Color', color_data);
    set(pdata, 'MarkerFaceColor', color_data);
end

hp1 = plot(magnusson1992(:,1), magnusson1992(:,2), '-s', 'MarkerSize',4.0, 'MarkerEdgeColor', [0.2 0.2 0.2]);
he1 =errorbar(magnusson1992(:,1), magnusson1992(:,2), magnusson1992(:,3),'.');
set(hp1,'Color', color_data);
set(hp1, 'MarkerFaceColor', color_data);
set(he1,'Color', color_data);
set(he1,'MarkerSize',2.0);

psim_T2DM = plot(y1_T2DM, z1_T2DM(2:end,:), '--', 'Color', color_data_T2DM), hold on
psim_T2DM = plot(y1_T2DM, z1_T2DM(1,:), '--', 'Color', color_data_T2DM,'LineWidth', 2.0); hold on
psim_T2DM = plot(y1_T2DM, z1_T2DM(end,:), '--', 'Color', color_data_T2DM, 'LineWidth', 2.0); hold on
psim_T2DM = plot(y1_var_T2DM, z1_var_T2DM(1,:), '--', 'Color', color_data_T2DM, 'LineWidth', 2.0); hold on
psim_T2DM = plot(y1_var2_T2DM, z1_var2_T2DM(1,:), '--', 'Color', [1 0 0], 'LineWidth', 2.0); hold on

hp1_T2DM = plot(magnusson1992_T2DM(:,1), magnusson1992_T2DM(:,2), '-s', 'MarkerSize',4.0, 'MarkerEdgeColor', [0.2 0.2 0.2]);
he1_T2DM = errorbar(magnusson1992_T2DM(:,1), magnusson1992_T2DM(:,2), magnusson1992_T2DM(:,3),'.');
set(hp1_T2DM,'Color', color_data_T2DM);
set(hp1_T2DM, 'MarkerFaceColor', color_data_T2DM);
set(he1_T2DM,'MarkerSize',2.0);
set(he1_T2DM,'Color', color_data_T2DM);

hold off

%title('Glycogenolysis [3.2-6mM glucose]', 'FontWeight', 'bold')
xlabel('time [h]', 'FontWeight', 'bold')
ylabel('glycogen [mM]', 'FontWeight', 'bold')
axis square
axis([0 65 0 500])
set(gca, 'FontWeight', 'bold')
x1


%%
%figure(2)
subplot(1,2,2)
p2 = plot(y2*60, z2(2:end, :), '--', 'Color', color_data), hold on
p2 = plot(y2*60, z2(1,:), '--', 'Color', color_data,'LineWidth', 2.0); hold on
p2 = plot(y2*60, z2(end,:), '--', 'Color', color_data, 'LineWidth', 2.0); hold on
p2 = plot(y2*60, z2(4,:), '--', 'Color', color_data, 'LineWidth', 2.0); hold on

%title('Glycogen synthesis [5-10mM glucose]', 'FontWeight', 'bold')
for k=1:3
    xtmp = radziuk2001(:,2*(k-1)+1);
    ytmp = radziuk2001(:,2*(k-1)+2);
    p1 = plot(xtmp(~isnan(xtmp)), ytmp(~isnan(ytmp)), '-s', ...
                'MarkerSize',4.0, 'MarkerEdgeColor', [0.2 0.2 0.2]);
    set(p1, 'Color', color_data );
    set(p1, 'MarkerFaceColor', color_data );
end
hp1 = plot(taylor1996(:,1), taylor1996(:,2), '-s', 'MarkerSize', 4.0, 'MarkerEdgeColor', [0.2 0.2 0.2]);
he1 =errorbar(taylor1996(:,1), taylor1996(:,2), taylor1996(:,3),'.');
set(hp1,'Color',color_data);
set(hp1, 'MarkerFaceColor', color_data);
set(he1,'MarkerSize',4.0);
set(he1,'Color', color_data);


p2_T2DM = plot(y2_T2DM*60, z2_T2DM(2:end, :), '--', 'Color', color_data_T2DM), hold on
p2_T2DM = plot(y2_T2DM*60, z2_T2DM(1,:), '--', 'Color', color_data_T2DM,'LineWidth', 2.0); hold on
p2_T2DM = plot(y2_T2DM*60, z2_T2DM(end,:), '--', 'Color', color_data_T2DM, 'LineWidth', 2.0); hold on
p2_T2DM = plot(y2_T2DM*60, z2_T2DM(4,:), '--', 'Color', color_data_T2DM, 'LineWidth', 2.0); hold on



xlabel('time [min]', 'FontWeight', 'bold')
ylabel('glycogen [mM]', 'FontWeight', 'bold')
axis square
axis([-10 300 180 340])
set(gca, 'FontWeight', 'bold')
x2