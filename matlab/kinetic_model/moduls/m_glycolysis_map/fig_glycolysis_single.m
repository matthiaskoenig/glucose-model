function [] = fig_glycolysis_single(t, c, v, mpars)
%% FIG_PPP_SINGLE Generates images for simple simulation.
%   Graphical analysis of solution.
%   Called with the results of the integration procedure.
%       t:      time vector
%       c:      concentration matrix
%       v:      flux matrix
%       mpars:  parameters for simulation
%
%   author: Matthias König (matthias.koenig@charite.de)
%   date:   110523

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
s_name = mpars.x_names;
v_name = mpars.v_names;

% All concentrations
fig1 = figure('Name','Concentrations', 'Color',[1 1 1]);
set(fig1, 'OuterPosition', [1 1 800 1000]);

for k=1:length(s_name)
    y = c(:,k);
    subplot(7,7,k);  
    y_upper = 1.05*max(y);
    y_lower = -0.01;
    
    if numel(find(imag(y))) > 0
       warning('!!! Imaginary concentrations !!!') 
    end
    
    plot( t(offset:end), y(offset:end, :), '-o');
    axis([t(1) t(end) y_lower y_upper]);
    
    title(strcat(s_name{k}, ' [mM]'), 'FontWeight', 'bold')
end

% All fluxes
fig2 = figure('Name','Fluxes', 'Color',[1 1 1]);
set(fig2, 'OuterPosition', [801 1 800 1000]);

for k=1:( length(v_name) )
    name = v_name{k};
    y = v(:,k);
    
    if numel(find(imag(y))) > 0
       warning('!!! Imaginary fluxes !!!') 
    end
    
    subplot(6,6,k)
    p_tmp = plot(t(offset:end), y(offset:end, :), '-o'); 
    title(name, 'FontWeight', 'bold')
end
