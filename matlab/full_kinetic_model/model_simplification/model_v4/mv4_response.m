function [] = mv4_response()
% Calculate the full response of the mv4 model
% Varying external glucose (GE), external lactate (LE) and glycogen (GY)
disp('Calculate MV4 response')
%method = 'Euler'
method = 'ODE'
GE = linspace(0, 15,  101);
GY = linspace(0, 500, 101);
LE = linspace(0, 1, 3);

calculate = 1
if calculate == 1
    v = zeros(length(GE), length(GY), length(LE), 4);
    counter = 1;
    counter_tot = length(GE)*length(GY)*length(LE);
    for h=1:length(GE)
        counter/counter_tot * 100
        for k=1:length(GY)
            for i=1:length(LE)
                [f_res, c_res, v_res] = mv4_solve_f(GE(h), GY(k), LE(i), method);
                v(h, k, i, :) = v_res;
                counter = counter + 1;
            end

        end
    end
    save('mv4_response.mat', 'GE', 'GY', 'LE', 'v')
else
   load('mv4_response.mat', 'GE', 'GY', 'LE', 'v')
end


%% Display the results
close all

map_min = -0.06;
map_max = 0.06;
map_rg = colormap_gwr(-1, 1);
clines = -0.1:0.01:0.10;
ccolor = [0.2, 0.2, 0.2];

fig1 = figure('Name', 'MV4 response', 'Color', [1 1 1]);
set(fig1, 'Colormap', map_rg);
edge_alpha = 0.0;

x = GE;
y = GY;

counter = 1
for i=1:length(LE)
    for k=1:4            
        sp = subplot(length(LE), 4, counter);   
        z = v(:,:,i,k);
        ptmp = pcolor(x, y, z'); hold on;
        [C,h] = contour(x,y,z',clines, 'k-', 'LineColor', ccolor); hold off
        text_handle = clabel(C, h, clines, 'Rotation', 90, 'LabelSpacing', 500);
        set(text_handle,'Color',ccolor);
        set(ptmp, 'EdgeAlpha', edge_alpha);
        counter = counter+1;
        axis square
        if i==1
           switch k
               case 1
                   title('v1 (glucose import) [mmol/s]', 'FontWeight', 'bold')
               case 2
                   title('v2 (lactate import) [mmol/s]', 'FontWeight', 'bold')
               case 3
                   title('v3 (gluconeogenesis) [mmol/s]', 'FontWeight', 'bold')
               case 4
                   title('v4 (glycogen synthesis) [mmol/s]', 'FontWeight', 'bold')
                   %colorbar('peer', sp);
           end
        end
        
        if i==length(LE)
            xlabel('glucose_{ext} [mM]', 'FontWeight', 'bold')
        end
        if k==1
            ylabel('glycogen [mM]', 'FontWeight', 'bold')
        end
        caxis([map_min map_max])
    end
end


%% Ideal model response based on response curves
fig2 = figure('Name', 'Model response curves', 'Color', [1 1 1]);
set(fig2, 'Colormap', map_rg);
x = GE;
y = GY;
v_gly = zeros(length(x), length(y));
v_glys = zeros(length(x), length(y));
for k=1:length(x)
    for i=1:length(y)
        v_gly(k,i) = v_gly_f(x(k), y(i));
        v_glys(k,i) = v_glys_f(x(k), y(i));
    end
end
for k=1:2
    sp = subplot(1,2,k);
    switch k
        case 1
            p_tmp = pcolor(GE, GY, v_gly'); hold on;
            [C,h] = contour(x,y,v_gly',clines, 'k-', 'LineColor', ccolor); hold off
            title('Glycolysis [mmol/s]', 'FontWeight', 'bold')
            ylabel('glycogen [mM]', 'FontWeight', 'bold')
        case 2
            p_tmp = pcolor(GE, GY, v_glys'); hold on;           
            [C,h] = contour(x,y,v_glys',clines, 'k-', 'LineColor', ccolor); hold off
            title('Glycogen Synthesis [mmol/s]', 'FontWeight', 'bold')
           
    end
    text_handle = clabel(C, h, clines, 'Rotation', 90, 'LabelSpacing', 500);
    set(text_handle,'Color',ccolor);
    set(ptmp, 'EdgeAlpha', edge_alpha);
            
    colorbar('peer', sp);
    xlabel('glucose_{ext} [mM]', 'FontWeight', 'bold')
    set(p_tmp, 'EdgeAlpha', edge_alpha)
    axis square
    caxis([map_min map_max])
end



function [v_gly] = v_gly_f(x,y)
        C = [  -0.013260401508103  -0.000078240970095   0.478235644004833  ...
                0.000002861605817   0.000932752106971  -2.492569641130055  ...
                0.000000166945924  -0.000125285017396   0.015354944655784  ...
               -4.975026288067225];
    v_gly = 90E-3 * 1/60 *( ... 
                C(1)*x^3 + C(2)*x^2*y + C(3)*x^2 + C(4)*x*y^2 + C(5)*x*y ...
                +C(6)*x + C(7)*y^3 + C(8)*y^2 + C(9)*y + C(10) );
    % adaption of gluconeogenesis rate for low lactate
    p_KLE = 0.1;    % [mM]
    p_n  = 2;      
    v_gly(v_gly<0) = x^p_n/(x^p_n + p_KLE^p_n) * v_gly(v_gly<0);
end

function [v_glys] = v_glys_f(x,y)
        C = [   0.015298362033754  -0.000289250010776  -0.547536679729713  ...
               -0.000005684726209   0.010350112006466   6.232845830004314  ...
               -0.000000348461291   0.000282613503037  -0.115405862243966  ...
              -13.439952615163973];
    v_glys = 90E-3 * 1/60 *( ...
            C(1)*x^3 + C(2)*x^2*y + C(3)*x^2 + C(4)*x*y^2 + C(5)*x*y ...
            +C(6)*x + C(7)*y^3 + C(8)*y^2 + C(9)*y + C(10) );
    % adaption of glycogenolysis rate for low glycogen and
    % adaption of glycogen synthesis rate for high glycogen (has to reach zero)
    % due to polynom fit not absolute zero
    p_GY = 5;
    p_C = 500;
    p_n  = 2;
    v_glys(v_glys<0) = y^p_n/(y^p_n + p_GY^p_n) * ...
         (p_C-y)^p_n/((p_C-y)^p_n + p_GY^p_n) * ...
         v_glys(v_glys<0);
end

end
