function [] = fig_futile_cycle_effect(t, c, v, t2, c2, v2)
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

%% Offset to not show initial phase
offset = 0;
offset_ind = find(t>offset);
if numel(offset_ind) == 0
    offset = 1;
else
    offset = offset_ind(1);
end


%% Create figures
s_name = names_s();
v_name = names_v();
close all

% All concentrations
fig1 = figure('Name','Concentrations', 'Color',[1 1 1]);
for k=1:length(s_name)
    y = c(:,k);
    y2 = c2(:,k);
    subplot(5,10,k)  
    y_upper = 1.05*max(y);
    y_lower = -0.01;
    
    if numel(find(imag(y))) > 0
       warning('!!! Imaginary concentrations !!!') 
    end
    
    plot(t2(offset:end), y2(offset:end, :), 'r--' )
    plot(t(offset:end), y(offset:end, :), 'k-'), axis([t(1) t(end) y_lower y_upper]), hold on
    
    title(strcat(s_name{k}, ' [mM]'), 'FontWeight', 'bold')
    axis square
    %label('time [min]')
    %ylabel(strcat(s_name{k}, ' [mM]'), 'FontWeight', 'bold')
end

% All fluxes
fig2 = figure('Name','Fluxes', 'Color',[1 1 1]);
for k=1:( length(v_name)-3 )
    y = v(:,k);
    y2 = v2(:,k);
    
    if numel(find(imag(y))) > 0
       warning('!!! Imaginary fluxes !!!') 
    end
    
    subplot(5,7,k)  
    plot(t(offset:end), y(offset:end, :), 'k-'), hold on
    plot(t2(offset:end), y2(offset:end, :), 'r-'), hold off
    
    title(v_name{k}, 'FontWeight', 'bold')
    %xlabel('time [min]')
    %ylabel(v_name{k}, 'FontWeight', 'bold')
end


% Important concentrations
shift_t = 5;


fig3 = figure('Name','Important Concentrations', 'Color',[1 1 1]);
s_interest = [32 4 5 15:29 31 37 39 43 44];
for p=1:length(s_interest)
    k = s_interest(p);
    y = c(:,k);
    y2 = c2(:,k);
    
    subplot(5,5,p)  
    plot(t(offset:end)-shift_t, y(offset:end, :), 'k-'), hold on
    plot(t2(offset:end)-shift_t, y2(offset:end, :), 'r-'), hold off
    %ylabel(strcat(s_name{k},' [mM]'), 'FontWeight', 'bold')
    title(s_name{k}, 'FontWeight', 'bold')
    %xlabel('time [min]')
    xlim([-4 25])
    
    if mod(p, 5) == 1
       ylabel('c [mM]'); 
    end
    if p >= 20
        xlabel('time [min]')
    end
    axis square
end
bold_subplots()
scale_subplots(1.01)

fig3 = figure('Name','Important Fluxes', 'Color',[1 1 1]);
s_interest = [1:9 11 13:23 25 26 29:33];
for p=1:length(s_interest)
    k = s_interest(p);
    y = v(:,k);
    y2 = v2(:,k);
    
    subplot(4,7,p)  
    plot(t(offset:end)-shift_t, y(offset:end, :), 'k-'), hold on
    plot(t2(offset:end)-shift_t, y2(offset:end, :), 'r-'), hold off
    %ylabel(strcat(s_name{k},' [mM]'), 'FontWeight', 'bold')
    title(v_name{k}, 'FontWeight', 'bold')
    %xlabel('time [min]')
    xlim([-4 25])
    
    %if strcmp (v_name{k}, 'LDH')
    %    ylim([-40 -41])
    %end
    %if strcmp (v_name{k}, 'LDH')
    %    ylim([-40 -41])
    %end
    
    if mod(p, 7) == 1
       ylabel('v [µmol/min/kg]'); 
    end
    if p >= 22
        xlabel('time [min]')
    end
    axis square
end
bold_subplots()
scale_subplots(1.01)
