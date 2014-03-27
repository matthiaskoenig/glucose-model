%% insulin and glucagon switches
% insulin and glucagon are calculated from the external glucose level
% usage of available dose response curves
clear all
close all
% [1] overnight fast (12-16h)
% glucose_ext:  5 mM
% lactate_ext:  0.8 mM
% insulin:      60 pmol/l
% glucagon:     100 ng/l

% [2] moderate fast (30-60h)
% glucose_ext:  4 mM
% lactate_ext:  0.8 mM
% insulin:      40 pmol/l
% glucagon:     150 ng/l

% [3] prolonged fast (> 1 week)
% glucose_ext:  3 mM
% lactate_ext:  0.7 mM
% insulin:      20 pmol/l
% glucagon:     150 ng/l

%% Linear dose response curve
% insulin and glucagon follow imediatly to the external glucose level in a 
% linear dose, response curve
glucose_ext = 3:0.1:20;

% normal ranges for glucose, insulin and glucagon:
glucose_norm = 5        % [mM/l]
insulin_norm = 60       % [pmol/l]
glucagon_norm = 14      % [pmol/l]

% linear approximation of the curve
% increase from 60 to 360 pmol/l insulin as response to 5 - 9 mM glucose
% decrease from 40 to 30 fmol/l glucagon as response to 5 - 9 mM glucose
m_insulin = 300/4; 
m_glucagon = - 10/4;
insulin_lin_f = @(glucose_ext) insulin_norm + m_insulin*(glucose_ext-glucose_norm);
glucagon_lin_f = @(glucose_ext) glucagon_norm + m_glucagon*(glucose_ext-glucose_norm); 

%% Sigmoidal dose response curves for insulin and glucagon
% Plot of the insulin and glucagon response curves with experimental data

% Insulin data from Gerich1993 and Calbet2002
x_ins = [3 4 5 9]           % [mM] glucose
y_ins = [20 40 60 360]      % [pM] insulin
x_ins_dia = [10 16 18]      % [mM] glucose
y_ins_dia = [80 200 240]    % [pM] insulin

% Glucagon data from Gerich1993 and Calbet2002
x_glu = [3 4 5 6.5 10];     % [mM] glucose
y_glu = [21 21 14 12 12];   % [pM] glucagon
x_glu_dia = [3 4 5 6.5];    % [mM] glucose
y_glu_dia = [25 25 25 25];  % [pM] glucagon

% insulin dose response
figure(4)
subplot(1,2,1)
plot(glucose_ext, insulin_f(glucose_ext), x_ins, y_ins, 'o', glucose_ext, insulin_f(glucose_ext, 'dia'), x_ins_dia, y_ins_dia, 's')
%title('Dose response curve insulin to glucose for normal and diabetes person after oral glucose load [Gerich1993]')
title('insulin dose-response curve', 'FontSize',12, 'FontWeight','bold')
xlabel('glucose blood [mM]', 'FontSize',12)
ylabel('insulin blood [pmol/l]', 'FontSize',12)
legend('insulin response normal', 'data normal', 'insulin response diabetes II', 'data diabetes')

% glucagon dose response
subplot(1,2,2)
plot(glucose_ext, glucagon_f(glucose_ext), x_glu, y_glu, 'o', glucose_ext, glucagon_f(glucose_ext, 'dia'), x_glu_dia, y_glu_dia, 's')
%title('Dose response curve glucagon to glucose for normal and diabetes person after oral glucose load [Gerich1993]')
title('glucagon dose-response curve', 'FontSize',12, 'FontWeight','bold')
xlabel('glucose blood [mM]', 'FontSize',12)
ylabel('glucagon blood [pmol/l]', 'FontSize',12)
legend('glucagon response normal', 'data normal', 'glucagon response diabetes II', 'data diabetes')
axis([glucose_ext(1) glucose_ext(end) 11 26])

% quotient insulin / glucagon
%subplot(1,3,3)
%plot(glucose_ext, insulin_f(glucose_ext)./glucagon_f(glucose_ext), glucose_ext, insulin_f(glucose_ext, 'dia')./glucagon_f(glucose_ext, 'dia'))
%xlabel('glucose blood [mM]')
%ylabel('insulin/glucagon')
%legend('insulin / glucagon normal', 'insulin / glucagon diabetes II')


%% Insulin - Glucagon figure for publication
fig3 = figure(3);
% insulin and glucagon curves in one panel


[AX, H1, H2] = plotyy(glucose_ext, insulin_f(glucose_ext), glucose_ext, glucagon_f(glucose_ext)); hold on;
[AX, H1, H2] = plotyy(glucose_ext, insulin_f(glucose_ext, 'dia'), glucose_ext, glucagon_f(glucose_ext, 'dia')); hold on;
[AX, H1, H2] = plotyy(x_ins, y_ins, x_glu, y_glu); hold on;
[AX, H1, H2] = plotyy(x_ins_dia, y_ins_dia, x_glu_dia, y_glu_dia); hold on;


hold off
xlabel('glucose blood [mM]', 'FontSize',12)
title('Insulin & Glucagon Dose Response Curves','FontSize', 14) 
set(get(AX(1),'Ylabel'),'String','insulin blood [pmol/l]')
set(get(AX(1),'Ylabel'),'FontSize',12)
set(get(AX(2),'Ylabel'),'String','glucagon blood [pmol/l]')
set(get(AX(2),'Ylabel'),'FontSize',12) 


%set(H1,'LineWidth',3,'Color',[1 0 0])
%set(H2,'LineWidth',3,'Color',[0 0 1])
%set(AX(1),'FontSize',FontSize,'YColor',[1 0 0]);
%set(AX(2),'FontSize',FontSize,'YColor',[0 0 1]); 


%axis(ax1,[glucose_ext(1) glucose_ext(end) 0 600]);
%axis(ax2,[glucose_ext(1) glucose_ext(end) 0 26]); 





%% Simulation of a typical meal
t = -60:1:300;   % [min]
t_0 = 61;        % [min]    Start of glucose
t_max = 106;     % [min]    End of raise phase
t_end = 241;     % [min]    End of falling phase
gluc = ones(length(t), 1) * glucose_norm;

% raising glucose
vmax = 5;
k1 = 7;
gluc(t_0:t_max) = glucose_norm + vmax*t(t_0:t_max)./(k1 + t(t_0:t_max));

% falling glucose
tau = 50;
gluc(t_max+1:t_end) = glucose_norm + (gluc(t_max)-glucose_norm)* exp(- ( t(t_max+1:t_end) - t(t_max))/tau);

figure(2)
% blood glucose
subplot(411)
plot(t, gluc)
title('Blood glucose after meal')
xlabel('time [min]')
ylabel('glucose [mM/l]')
%axis([-60 300 0 15])

% blood insulin
subplot(412)
plot(t, insulin_f(gluc))
title('Insulin after meal')
xlabel('time [min]')
ylabel('insulin [pmol/l]')
%axis([-60 300 0 400])

% blood glucagon
subplot(413)
plot(t, glucagon_f(gluc))
title('Glucagon after meal')
xlabel('time [min]')
ylabel('glucagon [fmol/l]')
%axis([-60 300 0 45])

% insulin to glucagon ratio
subplot(414)
plot(t, insulin_f(gluc)/glucagon_f(gluc))
title('insulin to glucagon after meal')
xlabel('time [min]')








