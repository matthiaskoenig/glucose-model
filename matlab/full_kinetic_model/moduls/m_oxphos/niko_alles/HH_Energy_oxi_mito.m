%HH_Energie_oxi_2.m

function [ V_ion_in_oxi,... 
           V_vol_zelle_oxi,... 
           V_ATP_oxi,... 
           v_P_in_oxi,...
           V_elec_mito_oxi,... 
           V_NAD_mito_oxi,... 
           V_ATP_mito_oxi,...
           H_buff_oxi,...
           V_P_mito_oxi,...
           V_resp_oxi... 
         ] = HH_Energy_oxi_mito(t,x,z);

n=1000;
%Variablen 

Na_in     = x(1); %Na_cyt
K_in      = x(2);
C_in      = x(3); %Cl_cyt
Ca_in     = x(4);
H_in      = x(5);

Vol_zelle = x(12); 


ATP_in    = x(13);
ADP_in    = x(14);


P_in      = x(24); %Pi_cyt

H_mito    = x(55);
C_mito    = x(56); %Cl_mito
K_mito    = x(57);
Na_mito   = x(58);
Ca_mito   = x(59);

V_mm      = x(60);
Vol_mito  = x(61);

%NAD_mito  = x(62);
%NADH_mito = x(63);

NAD_mito  = x(94);
NADH_mito = x(95);

ATP_mito  = x(64);
ADP_mito  = x(65);

H_buff    = x(66);

P_mito    = x(67);
O2_ex     = x(68);
O2_in     = x(69);
Q         = x(70);
QH2       = x(71);
cytC_ox   = x(72);
cytC_red  = x(73);

Q_n       = x(74);
Q_p       = x(75);

%NAD       = x(79); %NAD_in
%NADH      = x(80); %NADH_in

%ATP_in    = x(86); %x(21);
%ADP_in    = x(87); %x(22);

Suc_mito  = x(89);

% Membrankapazit�t in Farad / cm*cm
c_m=1e-6;

%Startgeometrie
r0=6.36;% %in 10^-6 m
A0=1.6*4*pi*r0*r0/(1.0e8); % in cm*cm 
Vol_zelle0=4.0/3.0*pi*r0*r0*r0/(1.0e15); %in liter

%n <=> # Anzahl der Mitochondrien;
r_m=.35;
A_m=n*1.0*4*pi*r_m*r_m/(1.0e8);% in cm*cm
Vol_mito0=n*4.0/3.0*pi*r_m*r_m*r_m/(1.0e15); %in liter

%A_m=50*1.4/(1.0e8);%in cm*cm;
%Vol_mito=50*0.065/(1.0e15);%in liter
%Energiekopplung
%ATP=3;    % mM

%Konstanten
F=96490.0;  % C/mol
R=8.3;      % J/K*mol
T=293.0;    % K

% Membrankapazit�t in Farad / cm*cm
c_m=0.9e-6;

%Permeabilit�tskoeffizienten in m/s

% P_H  = 3e-3;
% P_C  = 5e-9;
% P_K  = 2e-9;
% P_Na = 1e-9;
% P_Ca =  1e-9;
P_H  = 4e-4;
P_C  = 0.5e-9;
P_K  = 0.2e-9;
P_Na = 0.1e-9;

% if z==10
%     k=1;
% else
%     k=0;
% end

P_Ca = 0.1e-10;% + 0.3e-11*(Ca_in*1e3).^2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Str�me (in 10^-4 A)
U = V_mm/1000.0*F/R/T;

%in A=cm*cm, P=m/s, F=C/Mol, X_in/out/sub=mMol/liter=Mol/m^3
%=> cm*cm*m/s*C/Mol*Mol/m3=10^-4 m^3/s*C*Mol/Mol/m^3=10-4 C/s =10^4 A

%Calcium
% Ca-Pumpe
Ca0  = 1.0e-3;
k_Ca = 4.0e-13;    

%I_CaP = k_Ca*A_m*F/(1+(Ca0/Ca_mito)^1);
I_Ca_P  = 1e-7*(Ca_mito - 3e6*Ca_in.^3);%
I_Ca_ED = 2.0*A_m*P_Ca*U*F*(Ca_in-Ca_mito*exp(2.0*U))/(1-exp(2.0*U));%-2.0*A_m*P_Ca.*U*F*Ca_in;%
I_Ca    = I_Ca_ED + I_Ca_P;%

%Chlorid
I_C_ED  = A_m*P_C*U*F*(C_in-C_mito*exp(-U))/(1-exp(-U));
I_C     = I_C_ED;

%Kalium
K0 = 140;
%I_K_P = -2*A_m/((1+K0/K_mito)^3);%;
I_K_P  = n*3e-8*(K_in*H_mito-K_mito*H_in);                                          % mehr spielen!!!!
I_K_ED = -A_m*P_K*U*F*(K_in-K_mito*exp(U))/(1-exp(U));
I_K    = I_K_ED + I_K_P;

%Na-pumpe
Na0=10;
%I_Na_P = -.32*A_m/((1+Na0/Na_mito)^4);
I_Na_P  = n*2e-7*(Na_in*H_mito-Na_mito*H_in);
I_Na_ED = -A_m*P_Na*U*F*(Na_in-Na_mito*exp(U))/(1-exp(U));
I_Na    = I_Na_ED + I_Na_P; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ATP-Synthetase in 10^-4 A

%dG_syn = -31900 + R*T * log(ATP_mito./(ADP_mito.*P_mito)) + 4*(-V_mm/1000*F + R*T* log(H_in./H_mito));
%v_syn1 = H_mito - 4e-5;
%v_syn  = -1e-11*dG_syn;%1e-1*v_syn1;%*(ADP_mito/ATP_mito*(sign(v_syn1)<0) + (ATP_mito/ADP_mito*(sign(v_syn1)>0)));
%v_syn= -10e-7*ADP_mito;%-2e-5*sign(dG_syn)*abs(dG_syn)^1/(abs(dG_syn)+3000)^1;%*( P_mito/(P_mito + 3)*ADP_mito^6/(ADP_mito + 3)^6*(sign(dG_syn)>0));

K_syn = 2.5;
v_syn = -n*6*10e-9*ADP_mito^8/(ADP_mito + K_syn)^8;%*P_mito/(P_mito + 0.5)
 
%v_syn = 0;%-2e-4*sign(dG_syn)*abs(dG_syn)^1/(abs(dG_syn)+3000)^1*((ATP_mito/(ATP_mito + 0.1))*(sign(dG_syn)<0) + P_mito/(P_mito + 3)*ADP_mito^6/(ADP_mito + 3)^6*(sign(dG_syn)>0));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ADP_in -> ATP_mito exchanger in 10^-4 A

K1 = 0.4;
%v_ex = 8e1*Vol_mito*F*10^(-0.65*V_mm/120)*ADP_in/(ADP_in + K1)*ATP_mito/(ATP_mito + 0.1);  %brauchen besseres
%v_ex = 12e-10*n*(ADP_in./(ADP_in + ATP_in*exp(0.12*(-150)/1000*F/R/T)) - ADP_mito./(ADP_mito + ATP_mito*exp(-0.88*(-150)/1000*F/R/T)));

v_ex = 8e-10*n*1.33* ADP_in.^2./(ADP_in.^2 + (0.37*ATP_in).^2.*ATP_mito./(ATP_mito+0.4)); %falsch!!!!!!!!! Neuro �ndern
%v_ex = 8e-10*n*1.33* ADP_in.^2./(ADP_in.^2 + (0.5).^2.*ATP_mito./(ATP_mito+0.4)); %falsch!!!!!!!!! Neuro �ndern
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Phosphattransport in 10^-4 A

v_Phos =  n*1e5*F*Vol_mito*(P_in*H_in - P_mito*H_mito);%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Protonen
% proton motive force in J/mol

%I_H_P =  -1e7*A_m/((1+1e-4/H_mito)^15);%

%I_H  = (-A_m*P_H*U*F*(H_in-H_mito*exp(U))/(1-exp(U))+ I_H_P  - I_Na_P - I_K_P + v_Phos - 3*v_syn); %  %  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Thermodynamic

dGpH = + R*T/F*1000*log(H_in./H_mito);
dGp = -V_mm + R*T/F*1000*log(H_in./H_mito);

Em_N = -291 + 0.5*R*T/F*1000*log(NAD_mito./NADH_mito);%-276 + 0.5*R*T/F*1000*log(NAD_mito/NADH_mito);
Em_Q = 87 + 0.5*R*T/F*1000*log(Q./QH2);%102 + 0.5*R*T/F*1000*log(Q/QH2);%
Em_C = 221 + R*T/F*1000*log(cytC_ox./cytC_red);%229 + R*T/F*1000*log(cytC_ox/cytC_red);

%Complex1 NADH + Q -> NAD + QH2
dG1 = Em_Q - Em_N - 2*dGp;% 
v1 = A_m*33*(dG1)*1e-5;

%Complex2 : Q -> QH2
v_succdh = 0.11*5*Suc_mito/(Suc_mito + 1.6);%(1+0.5*z)*
v_c2 = 0;%v_succdh*1e1*F.*Vol_mito;

%Complex3 QH2 + cyt_ox -> Q + cyt_red
dG3 = Em_C - Em_Q  - dGp;% 
v3 = A_m*51*(dG3)*1e-5;

%Complex3 + Radikale 

% X = 90;
% Y = 102 -X;
% 
% v3a = 1e-6*(X + R*T/F*1000*log(QH2./Q_n));
% 
% v3b = 5e-1*(V_mm + R*T/F*1000*log(Q_n./Q_p));
% 
% v3c = 1e-7*(Y + 0.5*R*T/F*1000*log(Q_p.^2./(Q.*QH2)));

%Complex4 cyt_red + O2 -> H2O
v4 =A_m*15e7*1e-1./((1+H_in./H_mito).^12).*cytC_red./(cytC_red +0.01);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% I_H_P in 1e-4 A %%%%%%%%%

%I_H_P =  -2e7*A_m/((1+1e-4/H_mito)^15)/(1+0.025/NADH_mito);

I_H_P = -(4*v1+2*v3+4*v4); 

%I_H_P = -(4*v1 + 2*v3a +4*v4);

I_H_ED = -A_m*P_H*U*F*(H_in-H_mito*exp(U))/(1-exp(U));

% I_H  = (I_H_ED + I_H_P  - I_Na_P - I_K_P + v_Phos - 3*v_syn);
I_H  = (I_H_ED + I_H_P  - I_Na_P - I_K_P - I_Ca + v_Phos - 3*v_syn);   % [CHANGE MATTHIAS]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gesamt�nderungen
%Ionenkonzentrationen in mM 
%I_X=10^-4 A = 10^-4 C/s; I_X / F= 10^-4 C/s / C/Mol = 10^-4 Mol/s;
%I_X/F / Vol = 10^-4 Mol/s / liter = 10^-4 M/s = 10^-1 mM/s daher:
%1e-1* I_X/F/Vol = mM/s 

v_H_buff_oxi = 0;%1e5*( (10-H_buff)./( (10-H_buff) + 1)*(max(0,H_mito - 4e-5)) - 3e-7*H_buff);

v_H_in   = -1e-1*I_H/F/Vol_zelle;
v_H_mito =  1e-1*I_H/F/Vol_mito;% - v_H_buff_oxi;

v_K_in   = -1e-1*I_K/F/Vol_zelle;
v_K_mito =  1e-1*I_K/F/Vol_mito;

v_C_in   = -1e-1*I_C/F/Vol_zelle;
v_C_mito =  1e-1*I_C/F/Vol_mito;

v_Na_in   = -1e-1*I_Na/F/Vol_zelle;
v_Na_mito =  1e-1*I_Na/F/Vol_mito;

v_Ca_in   =   1/2.0 * 1e-1*I_Ca/F/Vol_zelle;    % [CHANGE MATTHIAS] -> current to change in concentration k=2
v_Ca_mito =  -1/2.0 * 1e-1*I_Ca/F/Vol_mito;
%v_Ca_in   =   1e-1*I_Ca/F/Vol_zelle;
%v_Ca_mito =  -1e-1*I_Ca/F/Vol_mito;


%Membranspannung 1/c_m*A=1/F*cm*cm/cm*cm=1/F=1/C/V=V/C; I_X=10^-4 A =10^-4 C/s
%=>1/(cm*A)*I_X = 10^-4 V/s; v_V soll in 10^-3 V/s gemessen werden:
%=>10^-4 V/s =10^-1 * 10^-3 V/s, daher:

v_V_mm =  1e-1*1/(c_m*A_m)*(-I_C + I_K + I_H + I_Na - v_Phos + v_ex);%  

%Volumen
v_Vol_zelle = 0;
v_Vol_mito = 0;

%Metabolite
%ATP

v_ATP_use =   0.8*n*1e-4*0.85*ATP_in/(ATP_in + 0.1);
v_ATP_in =    - v_ATP_use + 1e-1*v_ex/(Vol_zelle*F);
v_ADP_in =    + v_ATP_use - 1e-1*v_ex/(Vol_zelle*F); 

v_ATP_mito = - 1e-1*v_ex/(Vol_mito*F) - 1e-1*v_syn/(Vol_mito*F);
v_ADP_mito =   1e-1*v_ex/(Vol_mito*F) + 1e-1*v_syn/(Vol_mito*F);


% if z>0;
%     p=1;
% else
%     p=0;
% end

v_NAD_mito  =   v1*1e-1/F/Vol_mito;
v_NADH_mito = - v1*1e-1/F/Vol_mito;
v_P_in = -1e-1*(v_Phos)/F/Vol_zelle + v_ATP_use;%;
v_P_mito = 1e-1*(v_Phos + v_syn)/F/Vol_mito;%

k_O2=2e1/A0;
v_O2_ex = 0;%-v4*1e-3*1e-1/F/Vol_zelle;
v_O2_in = k_O2*A0*(O2_ex-O2_in) + 0.05*I_H_P*1e-1/F/Vol_zelle;% 

v_Q   = 1e7*(-v1 - v_c2 + v3); %(v3c - v1)*1e4; %
v_QH2 = 1e7*(+v1 + v_c2 - v3); %(v3c + v1 - 2*v3a)*1e4;%

v_cytC_ox = 1e7*(-v3 + v4); %(-2*v3a + v4)*1e4; %
v_cytC_red = 1e7*(+v3 - v4); %(2*v3a - v4)*1e4; %

v_Q_n = 0;%v1 - 5*v_c2;%(2*v5_CAC + I_H_P*0.1*1e-1/F/Vol_zelle)*Vol_zelle/Vol_mito*p; 
v_Q_p = 0;%5*v_c2;


v_P_in_oxi = v_P_in;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scale_oxi = 15;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%1-5:
% V_ion_in_oxi = [ v_Na_in;      
%                  v_K_in; 
%                  v_C_in;
%                  v_Ca_in;
%                  v_H_in;
%                 ]*scale_oxi;

V_ion_in_oxi = zeros(5,1);                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
%12:
V_vol_zelle_oxi = 0; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%13-14:
V_ATP_oxi =  [ v_ATP_in; 
               v_ADP_in;
             ]*scale_oxi;

%V_ATP_oxi = zeros(2,1);             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             
%24:
% v_P_in_oxi = v_P_in_oxi;
   
v_P_in_oxi = 0*scale_oxi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%55-61:
V_elec_mito_oxi = [ v_H_mito  
                    v_C_mito; 
                    v_K_mito; 
                    v_Na_mito; 
                    v_Ca_mito; 
                    v_V_mm;      
                    v_Vol_mito;
                  ]*scale_oxi;
                  
 %V_elec_mito_oxi = zeros(7,1);                 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%62-63:
 V_NAD_mito_oxi = [ v_NAD_mito; 
                    v_NADH_mito;
                  ]*scale_oxi;
                 
%V_NAD_mito_oxi = zeros(2,1);  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                  

%64-65:
V_ATP_mito_oxi = [v_ATP_mito; 
                  v_ADP_mito; 
                 ]*scale_oxi;  
                  
%V_ATP_mito_oxi = zeros(2,1);  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%66:
H_buff_oxi = v_H_buff_oxi*scale_oxi;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%67:
V_P_mito_oxi  =   v_P_mito*scale_oxi;  
 
%V_P_mito_oxi = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%68-75:
V_resp_oxi = [ v_O2_ex; 
               v_O2_in; 
               v_Q;
               v_QH2;
               v_cytC_ox;
               v_cytC_red;
               v_Q_n;
               v_Q_p;
              ]*scale_oxi;
              
%V_resp_oxi = zeros(8,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                       

             
