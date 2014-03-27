% Analyse gamma switches depending on insulin and glucagon.
% The switch variable gamma is in [0,1] and a function of the insulin and
% glucagon concentrations. To have comparable influence of insulin and
% glucagon the relative responses are used.
% gamma = f(ins, gluc)
% Relative insulin and relative glucagon in [0,1].
clear all
close all

%% Different gamma functions:
% calculate the gamma switch variable depending on the insulin and glucagon
ins = 0:0.05:1;
gluc = 0:0.02:1;

% differenct response curves
gamma = zeros(length(ins), length(gluc));
gamma2 = zeros(length(ins), length(gluc));
gamma3 = zeros(length(ins), length(gluc));
gamma4 = zeros(length(ins), length(gluc));
gamma5 = zeros(length(ins), length(gluc));
gamma6 = zeros(length(ins), length(gluc));
gamma7 = zeros(length(ins), length(gluc));
for i=1:length(ins)
    for k=1:length(gluc)
        % quotient
        gamma(i,k) = gluc(k)/ins(i);
        % multiplicative combination of one dimensional effects
        n=2;
        gamma2(i,k) = (1 - ins(i)^n/(ins(i)^n + 0.5^n) ) * gluc(k)^n/(gluc(k)^n + 0.5^n);
        % linear response
        gamma3(i,k) = 0.5 - 0.5 * ins(i) + 0.5 * gluc(k);
        %gamma3(i,k) = 0.5 - 0.5 * ins(i) + 0.5 * 1.2 *gluc(k)/(0.2 + gluc(k));
        % hill response
        n = 2;
        gamma4(i,k) = 0.5 - 0.5 * ins(i)^n/(ins(i)^n + 0.5^n) / (1/( 1 + 0.5^n) ) + 0.5 * gluc(k)^n/(gluc(k)^n + 0.5^n)/(1/( 1 + 0.5^n) );
        n = 3;
        gamma5(i,k) = 0.5 - 0.5 * ins(i)^n/(ins(i)^n + 0.5^n) / (1/( 1 + 0.5^n) ) + 0.5 * gluc(k)^n/(gluc(k)^n + 0.5^n)/(1/( 1 + 0.5^n) );
        n = 4;
        gamma6(i,k) = 0.5 - 0.5 * ins(i)^n/(ins(i)^n + 0.5^n) / (1/( 1 + 0.5^n) ) + 0.5 * gluc(k)^n/(gluc(k)^n + 0.5^n)/(1/( 1 + 0.5^n) );
        n = 8;
        gamma7(i,k) = 0.5 - 0.5 * ins(i)^n/(ins(i)^n + 0.5^n) / (1/( 1 + 0.5^n) ) + 0.5 * gluc(k)^n/(gluc(k)^n + 0.5^n)/(1/( 1 + 0.5^n) );
    end
end

% plot the gammas
figure(1)
subplot(1,4,1)
surf(gluc, ins, gamma)
title('Quotient relative insulin / relative glucagon')
xlabel('glucagon')
ylabel('insulin')
subplot(1,4,2)
surf(gluc, ins, gamma2)
title('Multiplicative combinations')
xlabel('glucagon')
ylabel('insulin')
subplot(1,4,3)
surf(gluc, ins, gamma3)
title('Linear response')
xlabel('glucagon')
ylabel('insulin')
subplot(1,4,4)
surf(gluc, ins, gamma4)
title('Hill response')
xlabel('glucagon')
ylabel('insulin')

% hill responses
figure(3)
subplot(1,5,1)
surf(gluc, ins, gamma3)
title('Linear response')
xlabel('glucagon')
ylabel('insulin')
subplot(1,5,2)
surf(gluc, ins, gamma4)
title('Hill n=2')
xlabel('glucagon')
ylabel('insulin')
subplot(1,5,3)
surf(gluc, ins, gamma5)
title('Hill n=3')
xlabel('glucagon')
ylabel('insulin')
subplot(1,5,4)
surf(gluc, ins, gamma6)
title('Hill n=4')
xlabel('glucagon')
ylabel('insulin')
subplot(1,5,5)
surf(gluc, ins, gamma7)
title('Hill n=8')
xlabel('glucagon')
ylabel('insulin')



%% Analysis of the changes in blood glucose concentrations on the switch
%% behaviour
glucose_ext = 3:0.2:15;     % [mM] external glucose

% Calculation of the normed insulin and glucagon responses
% normal
insulin = insulin_f(glucose_ext);
glucagon = glucagon_f(glucose_ext);
rel_insulin = insulin_rel(glucose_ext);
rel_glucagon = glucagon_rel(glucose_ext);
gamma = gamma_f(rel_insulin, rel_glucagon);
% diabetes
insulin_dia = insulin_f(glucose_ext, 'dia');
glucagon_dia = glucagon_f(glucose_ext, 'dia');
rel_insulin_dia = insulin_rel(glucose_ext, 'dia');
rel_glucagon_dia = glucagon_rel(glucose_ext, 'dia');
gamma_dia = gamma_f(rel_insulin_dia, rel_glucagon_dia);

% path on surface, depending on blood glucose
z = gamma_f(rel_insulin, rel_glucagon);
z_dia = gamma_f(rel_insulin_dia, rel_glucagon_dia);

figure(2)
% insulin
subplot(3,2,1)
plot(glucose_ext, rel_insulin, glucose_ext, rel_insulin_dia)
xlabel('glucose [mM]')
ylabel('normed insulin')
axis([glucose_ext(1) glucose_ext(end) 0 1.05])
subplot(3,2,2)
plot(glucose_ext, insulin, glucose_ext, insulin_dia)
xlabel('glucose [mM]')
ylabel('insulin [pmol/l]')
axis([glucose_ext(1) glucose_ext(end) 0 600])

% glucagon
subplot(3,2,3)
plot(glucose_ext, rel_glucagon, glucose_ext, rel_glucagon_dia)
xlabel('glucose [mM]')
ylabel('normed glucagon')
axis([glucose_ext(1) glucose_ext(end) 0 1.05])
subplot(3,2,4)
plot(glucose_ext, glucagon, glucose_ext, glucagon_dia)
xlabel('glucose [mM]')
ylabel('glucagon [pmol/l]')
axis([glucose_ext(1) glucose_ext(end) 11 25.5])

% gamma
subplot(3,2,5)
plot(glucose_ext, gamma, glucose_ext, gamma_dia)
xlabel('glucose [mM]')
ylabel('gamma switch')
axis([glucose_ext(1) glucose_ext(end) 0 1.05])

% plot the path on the surface
subplot(3,2,6)
surf(gluc, ins, gamma3)
xlabel('glucagon')
ylabel('insulin')
zlabel('gamma')
hold on
plot3(rel_glucagon, rel_insulin, z, 'o',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','y',...
                'MarkerSize',5 )
hold on
plot3(rel_glucagon, rel_insulin, 0*rel_glucagon, 'o',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','y',...
                'MarkerSize',5 )
hold on
plot3(rel_glucagon_dia, rel_insulin_dia, z_dia, 'o',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','r',...
                'MarkerSize',5 )
hold on
plot3(rel_glucagon_dia, rel_insulin_dia, 0*rel_glucagon_dia, 'o',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','r',...
                'MarkerSize',5 )
colormap('gray')


            
%% plot the path on the switch surface
figure(4)
plot3(rel_glucagon, rel_insulin, z, 'o',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','y',...
                'MarkerSize',10 )
hold on
plot3(rel_glucagon_dia, rel_insulin_dia, z_dia, 'o',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','r',...
                'MarkerSize',10 )
hold on
plot3(rel_glucagon_dia, rel_insulin_dia, 0*rel_glucagon_dia, 'o',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','r',...
                'MarkerSize',10 )
hold on
plot3(rel_glucagon, rel_insulin, 0*rel_glucagon, 'o',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','y',...
                'MarkerSize',10 )
hold on
rel_data = 0:0.1:1;
surf(gluc, ins, gamma3)
xlabel('glucagon', 'FontSize', 11, 'FontWeight', 'bold')
ylabel('insulin', 'FontSize', 11, 'FontWeight', 'bold')
zlabel('\gamma', 'FontSize', 11, 'FontWeight', 'bold')
legend('normal', 'diabetes')
grid
colormap('gray')
colorbar('peer',gca);

%% 

figure(5)
g0 = gamma_f(rel_insulin, rel_glucagon);
g2 = gamma_f(rel_insulin, rel_glucagon, 'hill', 2);
g3 = gamma_f(rel_insulin, rel_glucagon, 'hill', 3);
g4 = gamma_f(rel_insulin, rel_glucagon, 'hill', 4);
g5 = gamma_f(rel_insulin, rel_glucagon, 'hill', 8);

plot(glucose_ext, g0, glucose_ext, g2, glucose_ext, g3, glucose_ext, g4, glucose_ext, g5)
xlabel('glucose [mM]')
ylabel('gamma')
legend('linear', 'n=2', 'n=3', 'n=4', 'n=8') 



% figure(5)
% % path on surface, depending on blood glucose
% subplot(1,4,1)
% z1 = gamma_f(rel_insulin, rel_glucagon);
% z1_dia = gamma_f(rel_insulin_dia, rel_glucagon_dia);
% 
% plot3(rel_glucagon, rel_insulin, z, 'o',...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','y',...
%                 'MarkerSize',5 )
% hold on
% plot3(rel_glucagon, rel_insulin, 0*rel_glucagon, 'o',...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','y',...
%                 'MarkerSize',5 )
% hold on
% plot3(rel_glucagon_dia, rel_insulin_dia, z_dia, 'o',...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','r',...
%                 'MarkerSize',5 )
% hold on
% plot3(rel_glucagon_dia, rel_insulin_dia, 0*rel_glucagon_dia, 'o',...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','r',...
%                 'MarkerSize',5 )
% hold on
% rel_data = 0:0.1:1;
% surf(gluc, ins, gamma3)
% xlabel('glucagon')
% ylabel('insulin')
% zlabel('gamma')
% colormap('gray')


% Plot of different gamma functions
figure(7)
% insulin
subplot(2,2,1)
plot(glucose_ext, rel_insulin, glucose_ext, rel_insulin_dia)
xlabel('glucose [mM]', 'FontWeight', 'bold', 'FontSize', 11)
ylabel('relative insulin', 'FontWeight', 'bold', 'FontSize', 11)
axis([glucose_ext(1) glucose_ext(end) -0.05 1.05])
legend('normal', 'diabetes')

% glucagon
subplot(2,2,2)
plot(glucose_ext, rel_glucagon, glucose_ext, rel_glucagon_dia)
xlabel('glucose [mM]', 'FontWeight', 'bold', 'FontSize', 11)
ylabel('relative glucagon', 'FontWeight', 'bold', 'FontSize', 11)
axis([glucose_ext(1) glucose_ext(end) -0.05 1.05])
legend('normal', 'diabetes')

% gamma
subplot(2,2,3)
plot(glucose_ext, gamma, glucose_ext, gamma_dia)
xlabel('glucose [mM]', 'FontWeight', 'bold', 'FontSize', 11)
ylabel('\gamma', 'FontWeight', 'bold', 'FontSize', 16)
axis([glucose_ext(1) glucose_ext(end) -0.05 1.05])
legend('normal', 'diabetes')

% different gammas
subplot(2,2,4)
plot(glucose_ext, g0, glucose_ext, g2, glucose_ext, g4, glucose_ext, g5)
xlabel('glucose [mM]', 'FontWeight', 'bold', 'FontSize', 11)
ylabel('\gamma', 'FontWeight', 'bold', 'FontSize', 16)
legend('linear', 'n=2', 'n=4', 'n=8')
axis([glucose_ext(1) glucose_ext(end) -0.05 1.05])


%% Plot of gamma
figure(8)

% gamma
plot(glucose_ext, gamma, glucose_ext, gamma_dia)
title('Phosphorylation State \gamma', 'FontWeight', 'bold', 'FontSize', 14)
xlabel('glucose [mM]', 'FontWeight', 'bold', 'FontSize', 12)
ylabel('\gamma', 'FontWeight', 'bold', 'FontSize', 16)
axis([glucose_ext(1) glucose_ext(end) -0.05 1.05])
legend('normal', 'diabetes')







