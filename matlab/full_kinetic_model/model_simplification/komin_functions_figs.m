function [] = komin_functions_figs()
% Displaying the main fluxes depending on glucose_ext, glycogen and
% lactate_ext
% author: Matthias Koenig
% contact: matthias.koenig@charite.de
% date: 03 April 2012
close all, clear all, format compact

disp('*** Plot of the glucose response functions ***')
disp('* calculate response *')
x1 = 0:0.5:12;      % x1 : glucose ext
x2 = 0:25:500;       % x2 : glycogen
x3 = 0:0.2:0.8;    % x3 : lactate 
N1 = length(x1);
N2 = length(x2);
N3 = length(x3);

% Get the response functions
[fz1, fz2, fz3] = komin_functions();

% Calculate the response over wide range of concentrations
z1 = zeros(N1, N2, N3);
z2 = zeros(N1, N2, N3);
z3 = zeros(N1, N2, N3);
for i=1:N1
    for j=1:N2
        for k=1:N3
            z1(i,j,k) = fz1(x1(i), x2(j), x3(k));
            z2(i,j,k) = fz2(x1(i), x2(j), x3(k));
            z3(i,j,k) = fz3(x1(i), x2(j), x3(k));
        end
    end
end
%return

 %% Plot the test data and the resulting fit
 disp('* generate figures *')
 edge_alpha = 0.1;
 figure('Name', '3D polynomal fit', 'Color', [1 1 1], 'OuterPosition', [0 0 800 1600])
 counter = 0;
  for p = 1:N3 
    for k=1:3
   
        counter = counter +1;
        subplot(N3,3,counter)
        switch k
          case 1
            % panel 1 - HGP and HGU
            p1 = surf(x1,x2,z1(:,:,p)');
            title('z1', 'FontWeight', 'bold')
          case 2
            % panel 2 - glycolysis and gluconeogenesis
            p1 = surf(x1,x2,z2(:,:,p)');
            title('z2', 'FontWeight', 'bold')
          case 3
            % panel 3 - glycogenolyis and glycogen synthesis
            p1 = surf(x1,x2,z3(:,:,p)');
            title('z3', 'FontWeight', 'bold')
            %zlim([-30 30])
        end
        set(p1, 'EdgeAlpha', edge_alpha)
        xlabel('x1 glucose [mM]')
        ylabel('x2 glycogen [mM]')
        zlabel('v [µmol/kg/min]')
        axis square
        xlim([0, 12])
        ylim([0, 500])
     end
 end

 