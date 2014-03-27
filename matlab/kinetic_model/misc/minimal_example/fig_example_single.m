function [] = fig_example_single(t, c, v, mpars)
%% FIG_PPP_SINGLE Generates images for simple simulation.
%   Graphical analysis of solution.
%   Called with the results of the integration procedure.
%
%       t:      time vector
%       c:      concentration matrix
%       v:      flux matrix
%       mpars:  parameters for simulation
%
%   author: Matthias König (matthias.koenig@charite.de)
%   date:   110614


%% Offset to not show initial phase
offset = 0;
offset_ind = find(t>offset);
if numel(offset_ind) == 0
    offset = 1;
else
    offset = offset_ind(1);
end

%% Create figures
s_name = names_example_s();
v_name = names_example_v();
close all

% All concentrations
fig1 = figure('Name','Results', 'Color',[1 1 1]);
set(fig1, 'OuterPosition', [1 1 1280 400])

for k=1:length(s_name)
    y = c(:,k);
    subplot(2,5,k)  
    y_upper =  max(y) + 0.5;
    y_lower = -0.5;
    
    if numel(find(imag(y))) > 0
       warning('!!! Imaginary concentrations !!!') 
    end
    
    p_tmp = plot(t(offset:end), y(offset:end, :)); axis([t(1) t(end) y_lower y_upper]);
    axis square
    title(strcat(s_name{k}, ' [mM]'), 'FontWeight', 'bold')
    xlabel('time [s]')
    ylabel(strcat(s_name{k}, ' [mM]'), 'FontWeight', 'bold')
end


% All fluxes
%fig2 = figure('Name','Fluxes', 'Color',[1 1 1]);

for k=1:( length(v_name) )
    y = v(:,k);
    
    if numel(find(imag(y))) > 0
       warning('!!! Imaginary fluxes !!!') 
    end
    
    subplot(2,5,k+5)  
    p_tmp = plot(t(offset:end), y(offset:end, :)); 
    axis square
    title(v_name{k}, 'FontWeight', 'bold')
    xlabel('time [s]')
    ylabel(v_name{k}, 'FontWeight', 'bold')
end

