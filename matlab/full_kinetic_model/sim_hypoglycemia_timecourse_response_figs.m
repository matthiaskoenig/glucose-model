function [] = sim_hypoglycemia_timecourse_response_figs()
intervals = [linspace(5, 60, 12)]
additions = linspace(1, 10, 10)
conditions = {  'normal'
                'diabetes'
                'insulin_restored'
                'glucagon_restored'
                'linear_insulin_1'
                'linear_insulin_4'
                'additive_insulin_1'
                'additive_insulin_4'
              };

Ni = length(intervals);
Na = length(additions);
Nc = length(conditions);

% load the single data files and calculate the resutling values
hgp_base = zeros(Ni, Na, Nc);
hgp_max = zeros(Ni, Na, Nc);
glc_min = zeros(Ni, Na, Nc);

% the time constants are also of interest for the increase and decrease
for k=1:Ni
    interval = intervals(k);
    for p=1:Na
        % load the data for the given simulation
        gu_addition = additions(p);
        name = strcat('hypoglycemia_i', num2str(interval), ...
                          '_a', num2str(gu_addition));
        file = strcat('/home/mkoenig/Desktop/kinetic_model_results/simulations/120507_data/Hypoglycemia/', name, '.mat')
        load(file, 'fdata', 't_data');
        for q=1:Nc
            % get the data for the different cases
            condition = conditions{q};
            data = getfield(fdata, condition);
            % calculate the interesting values from the data
            hgp_base(k, p, q) = hgp_base_f(data);
            hgp_max(k, p, q) = hgp_max_f(data);
            glc_min(k,p,q) = glc_min_f(data);
        end
    end
end

hgp_delta = hgp_max - hgp_base;
% 'Colormap',[0.0416666679084301 0 0;0.108782678842545 0.0133986929431558 0;0.17589870095253 0.0267973858863115 0;0.243014708161354 0.0401960797607899 0;0.310130715370178 0.0535947717726231 0;0.377246737480164 0.0669934675097466 0;0.444362759590149 0.0803921595215797 0;0.511478781700134 0.0937908515334129 0;0.57859480381012 0.107189543545246 0;0.64571076631546 0.12058824300766 0;0.712826788425446 0.133986935019493 0;0.779942810535431 0.147385627031326 0;0.847058832645416 0.160784319043159 0;0.864052295684814 0.165141612291336 0.0222222227603197;0.881045758724213 0.169498920440674 0.0444444455206394;0.898039221763611 0.17385621368885 0.0666666701436043;0.915032684803009 0.178213506937027 0.0888888910412788;0.932026147842407 0.182570815086365 0.111111111938953;0.949019610881805 0.186928108334541 0.133333340287209;0.966013073921204 0.191285401582718 0.155555561184883;0.983006536960602 0.195642709732056 0.177777782082558;1 0.200000002980232 0.200000002980232;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;1 1 0;0.959999978542328 0.984000027179718 0;0.920000016689301 0.967999994754791 0;0.879999995231628 0.952000021934509 0;0.839999973773956 0.935999989509583 0;0.800000011920929 0.920000016689301 0;0.759999990463257 0.903999984264374 0;0.720000028610229 0.888000011444092 0;0.680000007152557 0.871999979019165 0;0.639999985694885 0.856000006198883 0;0.600000023841858 0.840000033378601 0;0.560000002384186 0.824000000953674 0;0.519999980926514 0.808000028133392 0;0.479999989271164 0.791999995708466 0;0.439999997615814 0.776000022888184 0;0.400000005960464 0.759999990463257 0;0.360000014305115 0.744000017642975 0;0.319999992847443 0.728000044822693 0;0.280000001192093 0.712000012397766 0;0.239999994635582 0.696000039577484 0;0.200000002980232 0.680000007152557 0;0.159999996423721 0.664000034332275 0;0.119999997317791 0.648000001907349 0;0.0799999982118607 0.632000029087067 0;0.0399999991059303 0.61599999666214 0;0 0.600000023841858 0]);
glc_map = [0.0416666679084301 0 0;0.108782678842545 0.0133986929431558 0;0.17589870095253 0.0267973858863115 0;0.243014708161354 0.0401960797607899 0;0.310130715370178 0.0535947717726231 0;0.377246737480164 0.0669934675097466 0;0.444362759590149 0.0803921595215797 0;0.511478781700134 0.0937908515334129 0;0.57859480381012 0.107189543545246 0;0.64571076631546 0.12058824300766 0;0.712826788425446 0.133986935019493 0;0.779942810535431 0.147385627031326 0;0.847058832645416 0.160784319043159 0;0.864052295684814 0.187363833189011 0.0222222227603197;0.881045758724213 0.213943362236023 0.0444444455206394;0.898039221763611 0.240522876381874 0.0666666701436043;0.915032684803009 0.267102390527725 0.0888888910412788;0.932026147842407 0.293681919574738 0.111111111938953;0.949019610881805 0.32026144862175 0.133333340287209;0.966013073921204 0.346840977668762 0.155555561184883;0.983006536960602 0.373420476913452 0.177777782082558;1 0.400000005960464 0.200000002980232;1 0.43529412150383 0.18823529779911;1 0.470588237047195 0.176470592617989;1 0.505882382392883 0.164705887436867;1 0.541176497936249 0.152941182255745;1 0.576470613479614 0.141176477074623;1 0.61176472902298 0.129411771893501;1 0.647058844566345 0.117647059261799;1 0.682352960109711 0.105882354080677;1 0.717647075653076 0.0941176488995552;1 0.752941191196442 0.0823529437184334;1 0.788235306739807 0.0705882385373116;1 0.823529422283173 0.0588235296308994;1 0.858823537826538 0.0470588244497776;1 0.894117653369904 0.0352941192686558;1 0.929411768913269 0.0235294122248888;1 0.964705884456635 0.0117647061124444;1 1 0;0.959999978542328 0.984000027179718 0;0.920000016689301 0.967999994754791 0;0.879999995231628 0.952000021934509 0;0.839999973773956 0.935999989509583 0;0.800000011920929 0.920000016689301 0;0.759999990463257 0.903999984264374 0;0.720000028610229 0.888000011444092 0;0.680000007152557 0.871999979019165 0;0.639999985694885 0.856000006198883 0;0.600000023841858 0.840000033378601 0;0.560000002384186 0.824000000953674 0;0.519999980926514 0.808000028133392 0;0.479999989271164 0.791999995708466 0;0.439999997615814 0.776000022888184 0;0.400000005960464 0.759999990463257 0;0.360000014305115 0.744000017642975 0;0.319999992847443 0.728000044822693 0;0.280000001192093 0.712000012397766 0;0.239999994635582 0.696000039577484 0;0.200000002980232 0.680000007152557 0;0.159999996423721 0.664000034332275 0;0.119999997317791 0.648000001907349 0;0.0799999982118607 0.632000029087067 0;0.0399999991059303 0.61599999666214 0;0 0.600000023841858 0];
%% Figure 1 - glc_min
ealpha = 0.1;
fig1 = figure('Name', 'Glucose Min', 'Position', [0 0 300 1050], 'Color', [1 1 1], ...
    'Colormap',glc_map);
%set(fig1, 'ColorMap', colormap('hot'))
for k=1:Nc
   subplot(Nc,1,k)
   z = glc_min(:,:,k)';
   p = pcolor(intervals, additions, z);
   set(p, 'EdgeAlpha', ealpha)
   colorbar
   xlabel('\Delta t [min]')
   ylabel({'\Delta GU', '[µmol/kg/min]'})
   axis square
   caxis([2.5 4])
   if (k==1)
       title('Minimal Glucose [mM]')
   end
   %shading interp
end

%% Figure 3 - glc_min
% Generate the response figures for all the conditions
ealpha = 0.1;
for k=1:Nc
   close all
   name = conditions{k};
   fig_tmp = figure('Name', strcat(name, '_Glucose_Min'), 'Color', [1 1 1], ...
            'Position', [0 0 300 300], 'Colormap', glc_map);
   z = glc_min(:,:,k)';
   p = pcolor(intervals, additions, z);
   set(p, 'EdgeAlpha', ealpha)
   colorbar
   xlabel('\Delta t [min]')
   ylabel({'\Delta GU', '[µmol/kg/min]'})
   axis square
   caxis([2.5 4])
   %shading interp
   
   bold_subplots();
   %save the picture
   file_tmp = strcat('/home/mkoenig/Desktop/figures/', name, '.tif');
   set(gcf,'PaperPositionMode','auto')
   print(fig_tmp, file_tmp, '-dtiff', '-r600')
end



    function [res] = hgp_base_f(data)
        res = data.gp_sim(1);
    end

    function [res] = hgp_max_f(data)
        res = max(data.gp_sim);
    end

    function [res] = glc_min_f(data)
        res = min(data.glc_sim(1:end-1));
    end
end