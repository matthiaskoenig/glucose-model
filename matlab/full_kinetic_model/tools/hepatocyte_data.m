% Constants and data for the hepatocyte model
% Diameter hepatocyte: 20 - 40 µm (Radius 10-20 µm)
R1 = 10E-6                             % in m
R2 = 20E-6
V1 = 4/3*pi*power(R1,3)*10E3         % in l 
V2 = 4/3*pi*power(R2,3)*10E3
V = mean([V1, V2])