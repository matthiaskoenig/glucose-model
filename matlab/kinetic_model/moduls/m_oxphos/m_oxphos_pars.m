%Konstanten
F=96490.0;  % C/mol
R=8.3;      % J/K*mol
T=293.0;    % K

%Startgeometrie
r0=6.36;% %in 10^-6 m
A0=1.6*4*pi*r0*r0/(1.0e8); % in cm*cm 
Vol_zelle0=4.0/3.0*pi*r0*r0*r0/(1.0e15); %in liter
%A_m=1.4/(1.0e8);%in cm*cm
%Vol_mito0=0.065/(1.0e15);%in liter
n=1000;
%n <=> # Anzahl der Mitochondrien;
r_m=.35;
A_m=n*1.0*4*pi*r_m.*r_m/(1.0e8);% in cm*cm
Vol_mito0=n*4.0/3.0*pi*r_m.*r_m.*r_m/(1.0e15); %in liter