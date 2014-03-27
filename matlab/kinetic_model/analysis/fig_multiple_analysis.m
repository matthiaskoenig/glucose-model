function [] = fig_multiple_analysis(t, concentrations, fluxes, pars)
%% SIM_SINGLE_ANALYSIS Generates images for simple simulation.
%   Graphical analysis of solution.
%   Called with the results of the integration procedure.
%       t:      time vector
%       c:      concentration matrix
%       v:      flux matrix
%       mpars:  parameters for simulation
%
%   author: Matthias König (matthias.koenig@charite.de)
%   date:   110211
close all

tend = 1000;
xtick_vals = 0:2:tend/60;
offset = 1;
tmp = find(t>=offset);
offset_ind = tmp(1);
offset = offset_ind(1);


tmp = find(t>tend); tend_ind = tmp(1); 
% timeaxis in h used for all the plots
x = t(offset:tend_ind)/60;

%% Offset to not show initial phase



%% Create figures
s_name = names_s();
v_name = names_v();
close all

% All concentrations
fig1 = figure('Name','c(t) all', 'Color',[0.9 0.9 0.9]);
cfnames = fieldnames(concentrations);
yupper = zeros(length(s_name));
ylower = -0.01;
for k=1:length(s_name)
    for dind = 1:length(cfnames)
        c = concentrations.(cfnames{dind});
        y = c(:,k);
        if numel(find(imag(y))) > 0
           warning('!!! Imaginary concentrations !!!') 
        end
        
        subplot(7,7,k)  
        yupper(k) = max(1.2*max(y), yupper(k));
        ptmp = plot(x, y(offset:tend_ind, :));
        switch dind
            case 1
                linecolor = [1 0 0];
            case 2
                linecolor = [0 0.5 0];
            case 3
                linecolor = [0 0 1];
            case 4
                linecolor = [1 1 0];
        end    
        set(ptmp, 'Color', linecolor);
        hold on
    end
    title(strcat(s_name{k}, ''), 'FontWeight', 'bold')
    axis([t(1)/60 tend/60 ylower yupper(k)])
    grid off
    axis square
    set(gca, 'Box', 'off')
    
    % normal set point value for concentration
    plot(x, y(1)*ones(1,length(x)), 'k--');
    hold off
    
    set(gca, 'XTick', xtick_vals);
    %label('time [min]')
    %ylabel(strcat(s_name{k}, ' [mM]'), 'FontWeight', 'bold')
end
hold off


% All fluxes
vfnames = fieldnames(fluxes);
fig2 = figure('Name','v(t) all', 'Color',[0.9 0.9 0.9]);
for k=1:( length(v_name)-3 )
    for dind = 1:length(vfnames)
        v = fluxes.(vfnames{dind});
        y = v(:,k);
        if numel(find(imag(y))) > 0
           warning('!!! Imaginary fluxes !!!') 
        end
        subplot(5,7,k)  
        ptmp = plot(x, y(offset:tend_ind, :));
        switch dind
            case 1
                linecolor = [1 0 0];
            case 2
                linecolor = [0 0.5 0];
            case 3
                linecolor = [0 0 1];
            case 4
                linecolor = [1 1 0];
        end  
        set(ptmp, 'Color', linecolor);
        hold on;
    end
    title(v_name{k}, 'FontWeight', 'bold')
    grid off
    axis square
    %xlabel('time [min]')
    %ylabel(v_name{k}, 'FontWeight', 'bold')
    set(gca, 'xlim', [t(1)/60 tend/60]);
    set(gca, 'XTick', xtick_vals);
    set(gca, 'Box', 'off')
end
hold off;

% Important concentrations
fig3 = figure('Name','c(t) main', 'Color',[0.9 0.9 0.9]);
s_interest = [4 5 11 15:29 31 36 37 39 43 44];
for p=1:length(s_interest)
    for dind = 1:length(cfnames)
        c = concentrations.(cfnames{dind});
        k = s_interest(p);
        y = c(:,k);
        subplot(5,5,p)  
        ptmp = plot(x, y(offset:tend_ind, :));
        switch dind
            case 1
                linecolor = [1 0 0];
            case 2
                linecolor = [0 0.5 0];
            case 3
                linecolor = [0 0 1];
            case 4
                linecolor = [1 1 0];
        end    
        set(ptmp, 'Color', linecolor);
        hold on
    end
    grid off
    axis square
    set(gca, 'Box', 'off')
    
    % normal set point value for concentration
    plot(x, y(1)*ones(1,length(x)), 'k--');
    hold off
    
    %ylabel(strcat(s_name{k},' [mM]'), 'FontWeight', 'bold')
    title(s_name{k}, 'FontWeight', 'bold')
    axis([t(1)/60 tend/60 ylower yupper(k)])
    %xlabel('time [min]')
    set(gca, 'xlim', [t(1)/60 tend/60]);
    set(gca, 'XTick', xtick_vals);
    set(gca, 'Box', 'off')
end

% Switch analysis
fig4 = figure('Name','Futile Cycles', 'Color',[0.9 0.9 0.9]);

titles = {'Glucose', 'Glycogen', 'PFK - FBP', 'PK - PEPCK'};
legends = { 'GK', 'G6Pase', 'GK-G6Pase'
            'GS', 'GP', 'GS-GP'
            'PFK1', 'FBP1', 'PFK1-FBP1'
            'PK', 'PEPCK', 'PK-PEPCK'
            };
for k=1:4
    subplot(2,2,k)
    for dind = 1:length(vfnames)
        v = fluxes.(vfnames{dind});
        inds = offset:tend_ind;
        switch k
            case 1
                %y = [v(:, 2), v(:,3), (v(:,2)-v(:,3))];
                ptmp = plot(x, v(inds, 2), '--', x, v(inds,3), '-.', x, (v(inds,2)-v(inds,3)), '-');
            case 2
                %y = [v(:, 8) v(:,9), v(:,8)-v(:,9)];
                ptmp = plot(x, v(inds, 8), '--', x, v(inds,9), '-.', x, (v(inds,8)-v(inds,9)), '-');
            case 3
                %y = [v(:, 15) v(:,16), v(:,15)-v(:,16)];
                ptmp = plot(x, v(inds, 15), '--', x, v(inds,16), '-.', x, (v(inds,15)-v(inds,16)), '-');
            case 4
                %y = [v(:, 23) v(:,25), v(:,23)-v(:,25)];
                ptmp = plot(x, v(inds, 23), '--', x, v(inds,25), '-.', x, (v(inds,23)-v(inds,25)), '-');
        end
        %ptmp = plot(x, y(offset:tend_ind, :));
        switch dind
            case 1
                linecolor = [1 0 0];
            case 2
                linecolor = [0 0.5 0];
            case 3
                linecolor = [0 0 1];
            case 4
                linecolor = [1 1 0];
        end    
        set(ptmp, 'Color', linecolor);
        set(ptmp, 'LineWidth', 2);
        hold on;
    end
    hold off
    
    legend( legends{k, :} );
    title(strcat(titles{k}, 'switch'), 'FontWeight', 'bold');
    xlabel('time [h]', 'FontWeight', 'bold')
    ylabel('v [µmol/kg/min]', 'FontWeight', 'bold')
    grid off
    axis square
    set(gca, 'xlim', [t(1)/60 tend/60]);
    set(gca, 'Box', 'off')
end
