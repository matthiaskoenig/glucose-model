function [] = fig_single_matt(t, c, v, mpars)
%% FIG_PPP_SINGLE Generates images for simple simulation.
%   Graphical analysis of solution.
%   Called with the results of the integration procedure.
%       t:      time vector
%       c:      concentration matrix
%       v:      flux matrix
%       mpars:  parameters for simulation
%
%   author: Matthias Koenig (matthias.koenig@charite.de)
%   date:   110821

close all

%% Offset to not show initial phase
offset = 0;
offset_ind = find(t>offset);
if numel(offset_ind) == 0
    offset = 1;
else
    offset = offset_ind(1);
end

c_data = {
    'h_{cyto}',    5        %1
    'na_{cyto}',   1        %2
    'k_{cyto}',    2        %3
    'cl_{cyto}',   3        %4
    'ca_{cyto}',   4        %5
    'h_{mito}',    55        %6
    'na_{mito}',   58        %7
    'k_{mito}',    57        %8
    'cl_{mito}',   56        %9
    'ca_{mito}',   59        %10
    'vmm',         60        %11
    'o2_{ext}',    68        %12
    'o2',          69        %13
    'q_{mm}',      70        %14
    'qh2_{mm}',    71        %15
    'cytcox_{mm}', 72        %16
    'cytcred_{mm}',73        %17
    'atp',         13        %18
    'adp',         14        %19
    'p',           24        %20
    'atp_{mito}',  64        %21
    'adp_{mito}',  65        %22
    'p_{mito}',    67        %23
    'nad_{mito}',  94        %24
    'nadh_{mito}', 95        %25
    'suc_{mito}',  89        %26
    'fum_{mito}',  90        %27
}


%% Create figures
if nargin == 4
    s_name = mpars.x_names;
    v_name = mpars.v_names;
else
   s_name = c_data(:,1);
   v_name = s_name;
   Ic = cell2mat(c_data(:,2));
   Iv = Ic;
   c = c(:, Ic);
   v = v(:, Iv);
end

% All concentrations
fig1 = figure('Name','Concentrations', 'Color',[1 1 1]);
set(fig1, 'OuterPosition', [1 1 800 1000]);

for k=1:length(s_name)
    y = c(:,k);
    subplot(5,6,k);  
    y_upper = 1.05*max(y);
    y_lower = -0.01;
    
    if numel(find(imag(y))) > 0
       warning('!!! Imaginary concentrations !!!') 
    end
    
    plot( t(offset:end), y(offset:end, :), '-o');
    %axis([t(1) t(end) y_lower y_upper]);
    
    title(strcat(s_name{k}, ' [mM]'), 'FontWeight', 'bold')
end

% All fluxes
fig2 = figure('Name','Fluxes', 'Color',[1 1 1]);
set(fig2, 'OuterPosition', [801 1 800 1000]);

for k=1:( length(v_name) )
    y = v(:,k);
    
    if numel(find(imag(y))) > 0
       warning('!!! Imaginary fluxes !!!') 
    end
    
    subplot(6,6,k)
    plot(t(offset:end), y(offset:end, :), '-o'); 
    title(v_name{k}, 'FontWeight', 'bold')
end
