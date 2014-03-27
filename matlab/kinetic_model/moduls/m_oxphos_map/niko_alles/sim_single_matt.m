%file HH_ode.m
clear;
neu=6
tic;
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




%            1       2      3       4       5      6       7      8        9       10      11    12             %
%            Na_cyt  K_cyt  Cl_cyt  Ca_cyt  H_cyt  Na_out  K_out  Cl_out   Ca_out  H_out   V_m   Vol_zelle      %
Ion_start = [10       140   8       0.003   1e-4   145     4      150      2       0.5e-4  -70   Vol_zelle0];

%               13        14       15       16       17       18       19       20       21        22        23         24      25       26       27        %
%               ATP_cyt   ADP_cyt  AMP_cyt  UTP_cyt  UDP_cyt  GTP_cyt  GDP_cyt  NAD_cyt  NADH_cyt  NADP_cyt  NADPH_cyt  Pi_cyt  PPi_cyt  H2O_cyt  Co2_cyt   %
Energy_start = [2         1        0        0        0        0        0        0        0         0         0          3       0        0        0];

%            28    29      30       31      %
%            Glc   Glc1P   UdpGlc   Glyco   %
Glycagon_start = [0     0       0        0];

%            32      33      34      35       36      37      38      39     40     41    42    43      44      %
%            Glc6P   Fru6P   Fru16P  Fru26P   DhaP    G3P     Bpg13   Pg3    Pg2    Pep   Oxa   Pyr     Lac     % 
Glu_start = [0       0       0       0        0       0       0       0      0      0     0     0       0];

%             45     46      47    48    49     50      51      52      53      %
%             PG6    Ru5P    X5P   R5P   S7P    E4P     dummy   dummy   dummy   %   
Pent_start = [0      0       0     0     0      0       0       0       0];

%                            54      55        56       57        58        59       60      61                %           
%                            H_in    H_mito    C_mito   K_mito    N_mito    Ca_mito  V_mm    Vol_mito          %             
oxi_mito_electro_start = [   1e-4    0.3e-4      10       140       10        2.0      -155    Vol_mito0];     %

    
%               62          63          64         65        66      67      68      69      70          71         72         73         74        75   %
%               NAD_mito    NADH_mito   ATP_mito   ADP_mito  H_buff  P_mito  O2_ex   O2_in   Q           QH2        cytC_ox    cytC_red   Q_n       Q_p  %
oxi_mito_start= [0.015      0.035       2.5        2.5       0       8       0.4     0.2     0.25*1e-3   0.75*1e-3  0.90*1e-3  0.1*1e-3   0         0];

%                        76      77        78                  %
%                        Cit_in  AcCoA_in  Mal_CoA_in          %
Cit_Pyr_shuttle_start = [0.1    0          1];

%                    79       80       81      82         %
%                    NAD_in   NADH_in  Oxa_in  Isocit_in  %
shuttle_cyt_start = [0.075    0.013    0.01    0];

%             83        84           85        86            87           88           89         90         91         92        %           
%             Pyr_mito  AcCoA_mito   Cit_mito  IsoCit_mito   a_keto_mito  SucCoA_mito  Suc_mito   Fum_mito   Mal_mito   Oxa_mito  %
cac_start =  [0.131     0.0051       2.5       0.12          1            0.005        2          0.4        1.5        0.035];   %

%          93       %
%          Pyr_in   %
ex_start = [0.2];

%             94         95         %
%             NAD_mito   NADH_mito  %
omni_start = [0.033      0.017];

%             96       97       98       99         100         101             %        
%             GTP_mito GDP_mito k_drain  free1      v_P_mito    Glutamate_mito  %
rest_start = [0.3      0.2      0        0          8           13.5];

%                102       103     104             105      106         %
%                Asp_mito  Asp_in  Glutamat_in     Mal_in   a_keto_in   %
shuttle_start = [0.3       2.8     4               0.3      0.1];

%            107   108      %
%            CO2   CoA_mito %
CO2_start = [0.5   0.01];

%               109       110       %
%               ADP_mito  ATP_mito  %
adenin_start = [3         2];


%                    111         112           113      114        115      116      %
%                    ACoADh_FAD  ACoADh_FADH2  ETP_FAD  ETP_FADH2  ETFP_ox  ETFP_red %
Lipid_ox_et_start = [0.1         0.1           0.1      0.1        0.1      0.1];

%                    117   118    119      120     121     122    123    %
%                    C4    C6     C8       C10     C12     C14    C16    %  
Acyl_CoA_start =    [2e-3  3e-3   5.5e-4   3e-3    2e-3    0.013  0.025] ; % total CoA-contenet in liver: The relationship between metabolic state and total CoA content ...(Smith, Cano, Potyraj) % 
%Acyl_CoA_start =    [0.1   0.1    0.1      0.05    0.3     1      0.6] ; 
%Acyl_CoA_start =   [-     -      0.07     0.05    0.3     2.5     6] ;  % Redox control of beta oxidation in rat liver mitochondria (EATON...)%
%Acyl_CoA_start =   [             0.2      0.1     0.4     0.7    10] ;  % Intramitochondrial control of the oxidation of hexadecanoate in skeletal muscle (EATON...) %
%Acyl_CoA_start =   [                              0.05    0.56   27] ;  % Intermediates of myocardial mitochondrial betaoxidation: possible... (EATON...) %
%Acyl_CoA_start =   [                              0.14    1      24] ;  % The effect of respiratory chain impairment on beta-oxidation in rat heart mitochondria (EATON...    %   

%                       124    125     126    127    128    129    130    %
%                       C4:1   C6:1    C8:1   C10:1  C12:1  C14:1  C16:1  %  
Trans_Enoyl_CoA_start = [5e-6  11e-6   9e-6   8e-6   10e-6  13e-6  4e-3 ];
%Trans_Enoyl_CoA_start = [0.05  0.05    0.05   0.05   0.05   0.1    0.5];
%Trans_Enoyl_CoA_start = [                          0.05   0.1    0.5];   % Redox control of beta oxidation in rat liver mitochondria (EATON...)%
%Trans_Enoyl_CoA_start = [                          0.1    0.2    1  ];   % Intramitochondrial control of the oxidation of hexadecanoate in skeletal muscle (EATON...) %
%Trans_Enoyl_CoA_start = [                          0.01   0.02   0.11];  % Intermediates of myocardial mitochondrial betaoxidation: possible... (EATON...) %
%Trans_Enoyl_CoA_start = [                          0.06   0.026  0.436]; % The effect of respiratory chain impairment on beta-oxidation in rat heart mitochondria (EATON...    %   

%                            131    132    133     134      135     136     137     %
%                            C4_OH  C6_OH  C8_OH   C10_OH   C12_OH  C14_OH  C16_OH  % 
L_3_Hydroxyacyl_CoA_start = [5e-4   4e-5   3e-4    7e-5     7e-5    7e-5    2.5e-3]; 
%L_3_Hydroxyacyl_CoA_start = [0.05   0.02   0.02    0.02     0.05    0.05    0.2   ]; 
%L_3_Hydroxyacyl_CoA_start = [                              0.05    0.05    0.2   ]; % Redox control of beta oxidation in rat liver mitochondria (EATON...)%
%L_3_Hydroxyacyl_CoA_start = [                              0.1     0.1     0.5];    % Intramitochondrial control of the oxidation of hexadecanoate in skeletal muscle (EATON...) %
%L_3_Hydroxyacyl_CoA_start = [                                      0.01    0.04];   % Intermediates of myocardial mitochondrial betaoxidation: possible... (EATON...) %
%L_3_Hydroxyacyl_CoA_start = [                                      0.09    0.125];  % The effect of respiratory chain impairment on beta-oxidation in rat heart mitochondria (EATON...    %   

%                    138    139    140    141    142    143    144    %
%                    C4     C6     C8     C10    C12    C14    C16   
Ketoacyl_CoA_start= [3e-4   3e-4   3e-4   3e-4   3e-4   3e-4   3e-4];         % never detected % minireview: mitochondrail b-oxidaton (EATON...)%

%                                145          146          147       148       149           150      %   
%                                C16_CoA_cyt  C16_Car_cyt  Car_cyt   CoA_cyt   C16_Car_mito  Car_mito %
Lipid_Carnitin_shuttle_start =  [ 0.04        0.1          0.2       0.17      0.1           0.1];  % Respiration of mitochondria and state of phosphorylation ...(Panov, ...)(total CoA-content)

%                        151                152           153           154      %
%                        S3H3MG_CoA_mito    AcAc_mito     R3HBut_mito   dummy1   %
Ketone_start = [         0                  0             0             0];


%x_start0=[cac_start ex_start omni_start rest_start shuttle_start CO2_start adenin_start shuttle_cyt_start Lipid_ox_et_start  Acyl_CoA_start  Trans_Enoyl_CoA_start  L_3_Hydroxyacyl_CoA_start  Ketoacyl_CoA_start  Lipid_Carnitin_shuttle_start  Cit_Pyr_shuttle_start Ketone_start];



x_start0=[ Ion_start...
           Energy_start...
           Glycagon_start...
           Glu_start...
           Pent_start...
           oxi_mito_electro_start...
           oxi_mito_start...
           Cit_Pyr_shuttle_start...
           shuttle_cyt_start...
           cac_start... 
           ex_start...
           omni_start...
           rest_start...
           shuttle_start...
           CO2_start...
           adenin_start...
           Lipid_ox_et_start...
           Acyl_CoA_start...
           Trans_Enoyl_CoA_start...
           L_3_Hydroxyacyl_CoA_start...
           Ketoacyl_CoA_start...
           Lipid_Carnitin_shuttle_start...
           Ketone_start           
        ];

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ONLY SIMULATION OF OXPHOS    
%Startpunkt festlegen
opt=odeset;
z = 0;
[t,x]=ode15s(@HH_Energy_Abl_CAC,[0 1e5],x_start0,opt,z);
dd=size(x);
x0=x(dd(1),:); %Ruhezustand

dxdt = zeros(size(x));
for k=1:length(t)
   dxdt(k,:) = HH_Energy_Abl_CAC(t, x(k,:), z);
end

% Generate Figure
fig_single_matt(t, x, dxdt)
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%integrate for t_ruhe sec (Ruhezustand)
t_ruhe=100
[t,x] = ode15s(@HH_Energy_Abl_CAC,[0 t_ruhe],x0,opt,0); 
dd=size(x);
S_rest=x(dd(1),:);
xrest=x;
trest=t;

%t_oxi_weg  f"ur t_oxi sec 
t_oxi=1000
[t,x] = ode15s(@HH_Energy_Abl_CAC,[0 t_oxi],S_rest,opt,0);%
dd=size(x);
S_deoxi=x(dd(1),:); %startwerte nach deoxigenierung 
x_deoxi=x;
t_deoxi=t+t_ruhe;

%t_reoxigenierung sec erregung
t_erregung=1899
[t,x] = ode15s(@HH_Energy_Abl_CAC,[0 t_erregung],S_deoxi,opt,0.9);
dd=size(x);
S_reoxi=x(dd(1),:); %startwerte anch erregung 
x_reoxi=x;
t_reoxi=t+t_ruhe+t_oxi;

tall=[trest; t_deoxi; t_reoxi];
xall=[xrest; x_deoxi; x_reoxi];
 


%Auslese1

Na_cyt        = xall(:,1);
K_cyt         = xall(:,2);
Cl_cyt        = xall(:,3);
Ca_cyt        = xall(:,4);
H_cyt         = xall(:,5);

Na_out        = xall(:,6);
K_out         = xall(:,7);
Cl_out        = xall(:,8);
Ca_out        = xall(:,9);
H_out         = xall(:,10);

V_m           = xall(:,11);
Vol_zelle     = xall(:,12);

ATP_cyt       = xall(:,13);
ADP_cyt       = xall(:,14);
AMP_cyt       = xall(:,15);

UTP_cyt       = xall(:,16);
UDP_cyt       = xall(:,17);

GTP_cyt       = xall(:,18);
GDP_cyt       = xall(:,19);

NAD_cyt       = xall(:,20);
NADH_cyt      = xall(:,21);
NADP_cyt      = xall(:,22);
NADPH_cyt     = xall(:,23);

Pi_cyt        = xall(:,24);
PPi_cyt       = xall(:,25);
H2O_cyt       = xall(:,26);
Co2_cyt       = xall(:,27);

Glc           = xall(:,28);
Glc1P         = xall(:,29);
UdpGlc        = xall(:,30);
Glyco         = xall(:,31);

Glc6P         = xall(:,32);
Fru6P         = xall(:,33);
Fru16P        = xall(:,34);
Fru26P        = xall(:,35);
DhaP          = xall(:,36);
G3P           = xall(:,37);
Bpg13         = xall(:,38);
Pg3           = xall(:,39);
Pg2           = xall(:,40);
Pep           = xall(:,41);
Oxa           = xall(:,42);
Pyr           = xall(:,43);
Lac           = xall(:,44);

PG6           = xall(:,45);
Ru5P          = xall(:,46);
X5P           = xall(:,47);
R5P           = xall(:,48);
S7P           = xall(:,49);
E4P           = xall(:,50);

dummy1        = xall(:,51);
dummy2        = xall(:,52);
dummy3        = xall(:,53);

H_in          = xall(:,54); %H_cyt

H_mito        = xall(:,55);
Cl_mito       = xall(:,56);
K_mito        = xall(:,57);
Na_mito       = xall(:,58);
Ca_mito       = xall(:,59);

V_mm          = xall(:,60);
Vol_mito      = xall(:,61);

NAD_mito_oxi  = xall(:,62); % soll identisch 93 werden
NADH_mito_oxi = xall(:,63); % soll identisch 94 werden
ATP_mito      = xall(:,64);
ADP_mito      = xall(:,65);

H_buff        = xall(:,66);

P_mito        = xall(:,67);

O2_ex         = xall(:,68);
O2_in         = xall(:,69);

Q             = xall(:,70);
QH2           = xall(:,71);
cytC_ox       = xall(:,72);
cytC_red      = xall(:,73);
Q_n           = xall(:,74);
Q_p           = xall(:,75);

Cit_in        = xall(:,76);
AcCoA_in      = xall(:,77);
Mal_CoA_in    = xall(:,78);

NAD_in        = xall(:,79);
NADH_in       = xall(:,80);

Oxa_in        = xall(:,81);
Isocit_in     = xall(:,82);  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scale_cac =  1;
scale_oxi = 15;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Pyr_mito      = xall(:,83);
AcCoA_mito    = xall(:,84);
Cit_mito      = xall(:,85);
IsoCit_mito   = xall(:,86);
a_keto_mito   = xall(:,87);
SucCoA_mito   = xall(:,88);
Suc_mito      = xall(:,89);
Fum_mito      = xall(:,90);
Mal_mito      = xall(:,91);
Oxa_mito      = xall(:,92);

Pyr_in       = xall(:,93);

NAD_mito     = xall(:,94); % soll identisch 62 werden
NADH_mito    = xall(:,95); % soll identisch 63 werden

GTP_mito     = xall(:,96); 
GDP_mito     = xall(:,97);

k_drain      = xall(:,98);
free1        = xall(:,99);

%v_P_mito       = xall(:,100);

Gluta_mito   = xall(:,101);

Asp_mito     = xall(:,102);
Asp_in       = xall(:,103);
Gluta_in     = xall(:,104);
Mal_in       = xall(:,105);
a_keto_in    = xall(:,106);

CO2          = xall(:,107);
CoA_mito     = xall(:,108);

%ATP_mito     = xall(:,109);        %identisch 64
%ADP_mito     = xall(:,110);        %identisch 65

% NAD_in        = xall(:,79);
% NADH_in       = xall(:,80);
% Oxa_in        = xall(:,81);

ACoADh_FAD   = xall(:,111);
ACoADh_FADH2 = xall(:,112);

ETP_FAD      = xall(:,113);
ETP_FADH2    = xall(:,114);

ETFP_ox      = xall(:,115);
ETFP_red     = xall(:,116);

C4_CoA       = xall(:,117);
C6_CoA       = xall(:,118);
C8_CoA       = xall(:,119);
C10_CoA      = xall(:,120);
C12_CoA      = xall(:,121);
C14_CoA      = xall(:,122);
C16_CoA      = xall(:,123);

E_C4_CoA     = xall(:,124);
E_C6_CoA     = xall(:,125);
E_C8_CoA     = xall(:,126);
E_C10_CoA    = xall(:,127);
E_C12_CoA    = xall(:,128);
E_C14_CoA    = xall(:,129);
E_C16_CoA    = xall(:,130);

L_C4_CoA     = xall(:,131);
L_C6_CoA     = xall(:,132);
L_C8_CoA     = xall(:,133);
L_C10_CoA    = xall(:,134);
L_C12_CoA    = xall(:,135);
L_C14_CoA    = xall(:,136);
L_C16_CoA    = xall(:,137);

K_C4_CoA     = xall(:,138);
K_C6_CoA     = xall(:,139);
K_C8_CoA     = xall(:,140);
K_C10_CoA    = xall(:,141);
K_C12_CoA    = xall(:,142);
K_C14_CoA    = xall(:,143);
K_C16_CoA    = xall(:,144);

C16_CoA_cyt  = xall(:,145);
C16_Car_cyt  = xall(:,146);
Car_cyt      = xall(:,147);
CoA_cyt      = xall(:,148);
C16_Car_mito = xall(:,149);
Car_mito     = xall(:,150);

% Cit_in        = xall(:,76);
% AcCoA_in      = xall(:,77);
% Mal_CoA_in    = xall(:,78);

S3H3MG_CoA_mito = xall(:,151);
AcAc_mito       = xall(:,152);
R3HBut_mito     = xall(:,153);

dummy1 =  xall(:,154);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%% Fl�sse %%%%%%%%%%%%%%%%%%%%%%

Ca = 0.05 + (k_drain-1)*2.5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pyrovatedehydrogenase complex
% Pyr_mito + CoA -> AcCoA + Co2
v_pdhc = (1-min(1,free1))*20.*Pyr_mito./(0.017 + Pyr_mito).*NAD_mito./(0.036 + NAD_mito).*CoA_mito./(0.0047 + CoA_mito);

v_pdhc_pyr = Pyr_mito./(0.017 + Pyr_mito);
v_pdhc_nad = NAD_mito./(0.036 + NAD_mito);
v_pdhc_coa = CoA_mito./(0.0047 + CoA_mito);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% citrate synthase
K_eq_cs = 2.03e5;
%v_cs = 1.6*1e4*(Oxa_mito.*AcCoA_mito )./( (1 + Oxa_mito/0.002).*(1 + AcCoA_mito/0.016) + (1 + Cit_mito/0.42).*(1 + CoA_mito/0.07) -1);
v_cs = 40*Oxa_mito./(0.0361 + Oxa_mito).*AcCoA_mito./(0.016 + AcCoA_mito);

v_cs_oxa   = Oxa_mito./(0.0361 + Oxa_mito);
v_cs_accoa = AcCoA_mito./(0.016 + AcCoA_mito);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%aconitase
K_eq_ac = 0.05;
v_ac = 1e7*(Cit_mito - IsoCit_mito/K_eq_ac)./(1 + Cit_mito/0.45 + IsoCit_mito/0.1);

v_ac_eq = (Cit_mito - IsoCit_mito/K_eq_ac)./(1 + Cit_mito/0.45 + IsoCit_mito/0.1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%isocitrate dehydrogenase
K_m_iso_icdg = 0.24*(1.5-Ca./(Ca+0.5)).*(1.5-ADP_mito./(ADP_mito+0.1));
K_m_nad_icdh = 0.051;%0.0081*(1-IsoCit_mito.^1.8./(IsoCit_mito.^1.8 + 1.^1.8)).*(1+NADH_mito/0.0041);

v_icdh = 20*IsoCit_mito.^2./(IsoCit_mito.^2 + K_m_iso_icdg.^2).*NAD_mito./(NAD_mito + K_m_nad_icdh);

v_icdh_iso = IsoCit_mito.^2./(IsoCit_mito.^2 + K_m_iso_icdg.^2);
v_icdh_nad = NAD_mito./(NAD_mito + K_m_nad_icdh);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%alpha-ketoglutarate dehydrogenase complex

f_Ca =1.5-Ca./(Ca + 0.5);
f_NAD = 1+NADH_mito./(0.0127*(NAD_mito./(NAD_mito + 0.0053)));
f_ADP = 1-ADP_mito./(ADP_mito + 0.45.*(1+ATP_mito/1));
f_Pi = 1-P_mito./(P_mito + 5);

K_akdhc_aketo = 2*f_Ca;%1.3.*f_Ca.*f_NAD.*f_ADP.*f_Pi;
K_akdhc_CoA = 0.0013*(1 + SucCoA_mito/0.004);
K_akdhc_NAD = 0.021*(1+NADH_mito/0.0045);

v_akdhc = 50*a_keto_mito./(a_keto_mito + K_akdhc_aketo).*NAD_mito./(NAD_mito + K_akdhc_NAD).*CoA_mito./(CoA_mito + K_akdhc_CoA);;

v_akdhc_aketo = a_keto_mito./(a_keto_mito + K_akdhc_aketo);
v_akdhc_coa   = CoA_mito./(CoA_mito + K_akdhc_CoA);
v_akdhc_nad   = NAD_mito./(NAD_mito + K_akdhc_NAD);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%succinyl-CoA-synthetase
V_max = 5;
K_eq_suc = 3.8; 

K_ATP      =  0.055;
K_Succ     =  5.1;
K_CoA      =  0.032;
K_ADP      =  0.25;
K_SucCoA   =  0.041;
K_P        =  0.72;

f_P_suc_atp = (1 + 1.2*P_mito.^3./(P_mito.^3 + 2.5^3));

v_succoas_atp = V_max*f_P_suc_atp./(K_SucCoA*K_ADP*K_P).*(SucCoA_mito.*ADP_mito.*P_mito-1/K_eq_suc*Suc_mito.*CoA_mito.*ATP_mito)./((1+SucCoA_mito/K_SucCoA).*(1+ADP_mito/K_ADP).*(1+P_mito/K_P)+(1+Suc_mito/K_Succ).*(1+CoA_mito/K_CoA).*(1+ATP_mito/K_ATP)-1);
            
K_GTP      =  0.036;
K_Succ     =  0.49;
K_CoA      =  0.036;
K_GDP      =  0.007;
K_SucCoA   =  0.086;
K_P        =  2.26;  

f_P_suc_gtp = (1 + 1.2*P_mito.^3./(P_mito.^3 + 2.5^3));
            
v_succoas_gtp = V_max*f_P_suc_gtp./(K_SucCoA*K_GDP*K_P).*(SucCoA_mito.*GDP_mito.*P_mito-1/K_eq_suc*Suc_mito.*CoA_mito.*GTP_mito)./((1+SucCoA_mito/K_SucCoA).*(1+GDP_mito/K_GDP).*(1+P_mito/K_P)+(1+Suc_mito/K_Succ).*(1+CoA_mito/K_CoA).*(1+GTP_mito/K_GTP)-1);     

v_succoas = v_succoas_atp + v_succoas_gtp;

v_succoa_eq1 = (SucCoA_mito.*GDP_mito.*P_mito-1/K_eq_suc*Suc_mito.*CoA_mito.*GTP_mito);
v_succoa_eq2 = (SucCoA_mito.*ADP_mito.*P_mito-1/K_eq_suc*Suc_mito.*CoA_mito.*ATP_mito);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%succinyl-dehydrogenase
%v_succdh = 1*Suc_mito./(Suc_mito +1.6).*(1.7 - Oxa_mito./(Oxa_mito + 0.01));
v_succdh = 14*Suc_mito./(Suc_mito + 1.6);

v_succdh_suc = Suc_mito./(Suc_mito + 1.6);
v_succdh_oxa = 0;%(1.7 - Oxa_mito./(Oxa_mito + 0.01));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%fumerase
K_eq_fum = 4.4;
v_fum    = 2e7*(Fum_mito - 1/K_eq_fum*Mal_mito)./(1 + Fum_mito/(0.14) + Mal_mito/(0.3)); 
v_fum_eq = 2.35*(Fum_mito - 1/K_eq_fum*Mal_mito);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%malate dehydrogenase
K_eq_mdh = 1e-3;
v_mdh    = 1e5*(Mal_mito.*NAD_mito-1/K_eq_mdh*Oxa_mito.*NADH_mito)./( (1 + Mal_mito/1.4).*(1 + NAD_mito/0.1) + (1 + Oxa_mito/0.04).*(1 + NADH_mito/0.05) -1 );
v_mdh_eq = (Mal_mito.*NAD_mito-1/K_eq_mdh*Oxa_mito.*NADH_mito);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Malate-a_keto_gluterate-carrier
v_Mal_a_keto = 3*NAD_mito./NADH_mito.*(Mal_in.*a_keto_mito - Mal_mito.*a_keto_in);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%cytosol. Malatedehydrogenase
v_mdh_in = 1e3/(1.4)*(Mal_in.*NAD_in-1/K_eq_mdh*Oxa_in.*NADH_in)./( (1 + Mal_in/1.4).*(1 + NAD_in/0.1) + (1 + Oxa_in/0.04).*(1 + NADH_in/0.05) -1 );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Amino??transferase
K_eq_AAT = 0.147;
v_AAT_mito = Asp_mito.*a_keto_mito - 1/K_eq_AAT*Oxa_mito.*Gluta_mito;
v_AAT_in   = Asp_in.*a_keto_in - 1/K_eq_AAT*Oxa_in.*Gluta_in;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Malate-a_keto-carrier
v_Mal_a_keto = 0;%1e2*(Mal_in.*a_keto_mito - Mal_mito.*a_keto_in);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Aspartate-Glutamate carrier
v_Asp_Gluta = 0;%1e2*(Asp_mito.*Gluta_in - 1/100*Asp_in.*Gluta_mito);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% Lipidtransport %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Carnitinpalmitoyltransferase 1 (inhibiert durch Malonyl-CoA und Hauptregulationspunkt f�r Acetyl-CoA Eintritt in Mitochondrien (Bartlett, Eaton: Mitochondrial beta-oxidation))
% C16-CoA_cyt + Car_cyt -> C16-Car_cyt + CoA_cyt
%v_CPT1  = 4*1e-2*23*C16_CoA_cyt./(C16_CoA_cyt + 0.02.*(1+Mal_CoA_in/0.0027)).*Car_cyt./(Car_cyt + 0.1).*(1 - (Mal_CoA_in > 0.05)); % Effects of Fasting and MalonylCoa on the Kinetics of carnitin ...(Saggerson, Carpenter), Dissertation

v_CPT1  = 10*1e-2*23*C16_CoA_cyt./(C16_CoA_cyt + 0.02*(1+Mal_CoA_in/0.0027)).*Car_cyt./(Car_cyt + 0.1).*(1-min(1,Mal_CoA_in/0.01));

Km_CPT1_C16_CoA = 0.02.*(1+Mal_CoA_in/0.0027);
v_CPT1_C16_CoA  = C16_CoA_cyt./(C16_CoA_cyt + Km_CPT1_C16_CoA );%
v_CPT1_Car      = Car_cyt./(Car_cyt + 0.1);
v_CPT1_Mal_CoA  = (1-min(1,Mal_CoA_in/0.01));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Carnitin-AcylCarnitintranslocase
% C16-Car_cyt + Car_mito -> C16-Car_mito + Car_cyt
%v_CACT = 5e-1*Car_mito/(Car_mito + 1.8).*C16_Car_cyt/(C16_Car_cyt + 1); % Enhancement of Mitochondrial Carnitin and Carnitin AcylCarnitin Translocase-mediates... (Parvin,Pande)
%v_CACT = 5e-1*Car_mito/(Car_mito + ?).*C16_Car_cyt/(C16_Car_cyt + 0.002); %Mechanism of Carnitine Acylcarnitine Translocase-catalyzed Import of Acylcarnitines into Mitochondria   (Murthy, Pande) %
v_CACT = 5e-1*23*Car_mito./(Car_mito + 0.1).*C16_Car_cyt./(C16_Car_cyt + 0.2); % Enhancement of Mitochondrial Carnitin and Carnitin AcylCarnitin Translocase-mediates... (Parvin,Pande)

v_CACT_Car_mito = Car_mito./(Car_mito + 0.1);
v_CACT_C16_Car  = C16_Car_cyt./(C16_Car_cyt + 0.2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Carnitinpalmitoyltransferase 2
% C16-Car_mito + CoA_mito -> C16-CoA_mito + Car_mito
KeqCPT2 = 0.7;
%v_CPT2 = (C16_Car_mito*CoA_mito - 1/KeqCPT2*C16_CoA_mitoCar_mito)/((C16_Car_mito + 0.1)*(CoA_mito + 0.01) +(C16_CoA_mito + 0.007)*(Car_mito + ) -1); % ??????? Reines Raten!!!1
v_CPT2 = 10*23*1e-2*C16_Car_mito./(C16_Car_mito + 0.1).* CoA_mito./(CoA_mito + 0.01);

v_CPT2_C16_Car = C16_Car_mito./(C16_Car_mito + 0.1);
v_CPT2_CoA = CoA_mito./(CoA_mito + 0.01);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Acyl-CoA- Dehydrogenase %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Short-chain Acyl-CoA-Dehydrogenase
% C4_CoA -> T_C4_CoA 
v_C4_CoA_SC = 23*30*3e-5*1000*C4_CoA./(C4_CoA + 0.01); % Biochemical and Electrochemical Characterization of two variant human ....(Saenger, Nguyen, Vockley, Stankovich)

% Medium-chain Acyl-CoA-Dehydrogenase
% C4_CoA -> T_C4_CoA 
%v_C4_CoA_MC = 500*C4_CoA/(C4_CoA + 0.175); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)
% C6_CoA -> T_C6_CoA 
v_C6_CoA_MC = 23*30*3e-5*1010*C6_CoA./(C6_CoA + 0.015); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)
% C8_CoA -> T_C8_CoA 
v_C8_CoA_MC = 23*30*3e-5*1200*C8_CoA./(C8_CoA + 0.0034); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)
% C10_CoA -> T_C10_CoA 
%v_C10_CoA_MC = 580*C10_CoA/(C10_CoA + 0.0025); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)
% C12_CoA -> T_C12_CoA 
%v_C12_CoA_MC = 550*C12_CoA/(C12_CoA + 0.0025); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)
% C14_CoA -> T_C14_CoA 
%v_C14_CoA_MC = 280*C14_CoA/(C14_CoA + 0.0023); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)
% C16_CoA -> T_C16_CoA 
%v_C16_CoA_MC = 140*C16_CoA/(C16_CoA + 0.0024); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)

% Long-chain Acyl-CoA-Dehydrogenase
% C8_CoA -> T_C8_CoA 
%v_C8_CoA_LC = 255*C8_CoA/(C8_CoA + 0.0045); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)
% C10_CoA -> T_C10_CoA 
v_C10_CoA_LC = 23*30*3e-5*755*C10_CoA./(C10_CoA + 0.0116); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)
% C12_CoA -> T_C12_CoA 
v_C12_CoA_LC = 23*30*3e-5*627*C12_CoA./(C12_CoA + 0.0058); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)
% C14_CoA -> T_C14_CoA 
v_C14_CoA_LC = 23*30*3e-5*331*C14_CoA./(C14_CoA + 0.0129); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)
% C16_CoA -> T_C16_CoA 
v_C16_CoA_LC = 23*30*3e-5*194*C16_CoA./(C16_CoA + 0.0041); %Struktur und Funktion humaner Acyl-CoA Dehydrogenasen, Doktorarbeit (Kr�utle)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Enoyl-CoA- Hydratase %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Crotonase
% % T_C4_CoA -> L_C4_CoA
% v_E_hyd_C4_CoA_MC = 30*3e-4*40*2300*E_C4_CoA./(E_C4_CoA + 0.03); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% % T_C6_CoA -> L_C6_CoA
% v_E_hyd_C6_CoA_MC = 30*3e-4*40*530*E_C6_CoA./(E_C6_CoA + 0.015); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% % T_C8_CoA -> L_C8_CoA
% v_E_hyd_C8_CoA_MC = 30*3e-4*40*400*E_C8_CoA./(E_C8_CoA + 0.009); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% % T_C10_CoA -> L_C10_CoA
% v_E_hyd_C10_CoA_MC = 30*3e-4*40*360*E_C10_CoA./(E_C10_CoA + 0.007); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% % T_C12_CoA -> L_C12_CoA
% v_E_hyd_C12_CoA_MC = 30*3e-4*40*210*E_C12_CoA./(E_C12_CoA + 0.005); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% % T_C14_CoA -> L_C14_CoA
% v_E_hyd_C14_CoA_MC = 30*3e-4*40*149*E_C14_CoA./(E_C14_CoA + 0.005); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% % T_C16_CoA -> L_C16_CoA
% v_E_hyd_C16_CoA_MC = 30*3e-4*40*E_C16_CoA./(E_C16_CoA + 0.0055); % Intermediate channeling on the trifunctional beta-oxidation complex from pig heart mitochondria (Yao, Schulz) 

%Crotonase
% T_C4_CoA <-> L_C4_CoA
v_E_hyd_C4_CoA_MC = 23*30*3e4*40*2300*(E_C4_CoA - L_C4_CoA)./(E_C4_CoA + 0.03); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% T_C6_CoA -> L_C6_CoA
v_E_hyd_C6_CoA_MC = 23*30*3e4*40*530*(E_C6_CoA - L_C6_CoA)./(E_C6_CoA + 0.015); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% T_C8_CoA -> L_C8_CoA
v_E_hyd_C8_CoA_MC = 23*30*3e4*40*400*(E_C8_CoA - L_C8_CoA)./(E_C8_CoA + 0.009); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% T_C10_CoA -> L_C10_CoA
v_E_hyd_C10_CoA_MC = 23*30*3e4*40*360*(E_C10_CoA - L_C10_CoA)./(E_C10_CoA + 0.007); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% T_C12_CoA -> L_C12_CoA
v_E_hyd_C12_CoA_MC = 23*30*3e4*40*210*(E_C12_CoA - L_C12_CoA)./(E_C12_CoA + 0.005); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% T_C14_CoA -> L_C14_CoA
v_E_hyd_C14_CoA_MC = 23*30*3e4*40*149*(E_C14_CoA - L_C14_CoA)./(E_C14_CoA + 0.005); %Purification and Properties of Human D-3-Hydroxyacyl-CoA Dehydratase: ... (Jiang, Kobayashi ...)
% T_C16_CoA -> L_C16_CoA
v_E_hyd_C16_CoA_MC = 23*30*3e4*40*(E_C16_CoA - L_C16_CoA)./(E_C16_CoA + 0.0055); % Intermediate channeling on the trifunctional beta-oxidation complex from pig heart mitochondria (Yao, Schulz) 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3-Hydroxyacyl-CoA dehdrogenase %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % L_C4_CoA + NAD <-> K_C4_CoA + NADH
% % v_L_C4_CoA = L_C4_CoA/(L_C4_CoA + 0.025)*NAD/(NAD+0.1);  %eigentlich reversible K_eq=?; Role of short chain hydroxyacyl CoA dehydrogenase in .... (Filling, Keller, ...)
% % L_C4_CoA + NAD <-> K_C4_CoA + NADH
% v_3HdH_C4_CoA = 30*3e-3*40*L_C4_CoA./(L_C4_CoA + 0.0072).*NAD_mito./(NAD_mito+0.015);  % Assay of L-3-Hydroxyacyl-Coenzyme A Dehydrogenase with ... (Xue-Ying He, Song-Yu Yang, and Horst Schulz)
% % L_C6_CoA + NAD <-> K_C6_CoA + NADH
% v_3HdH_C6_CoA = 30*3e-3*70*L_C6_CoA./(L_C6_CoA + 0.001).*NAD_mito./(NAD_mito+0.015); % ???
% % L_C8_CoA + NAD <-> K_C8_CoA + NADH
% v_3HdH_C8_CoA = 30*3e-3*80*L_C8_CoA./(L_C8_CoA + 0.01).*NAD_mito./(NAD_mito+0.013); % eigentlich reversible K_eq=?; Structure of D-3-Hydroxyacyl-CoA Dehydratase ... (Jiang,Miyazawa,Souri,Hashimoto)
% % L_C10_CoA + NAD <-> K_C10_CoA + NADH
% v_3HdH_C10_CoA = 30*3e-3*101*L_C10_CoA./(L_C10_CoA + 0.0029).*NAD_mito./(NAD_mito+0.01); % Assay of L-3-Hydroxyacyl-Coenzyme A Dehydrogenase with ... (Xue-Ying He, Song-Yu Yang, and Horst Schulz)
% % L_C12_CoA + NAD <-> K_C12_CoA + NADH
% v_3HdH_C12_CoA = 30*3e-3*100*L_C12_CoA./(L_C12_CoA + 0.003).*NAD_mito./(NAD_mito+0.01); %???
% % L_C14_CoA + NAD <-> K_C14_CoA + NADH
% v_3HdH_C14_CoA = 30*3e-3*100*L_C14_CoA./(L_C14_CoA + 0.003).*NAD_mito./(NAD_mito+0.01); %???
% % L_C16_CoA + NAD <-> K_C16_CoA + NADH
% v_3HdH_C16_CoA = 30*3e-3*5.8*L_C16_CoA./(L_C16_CoA + 0.003).*NAD_mito./(NAD_mito+0.0145); % Assay of L-3-Hydroxyacyl-Coenzyme A Dehydrogenase with ... (Xue-Ying He, Song-Yu Yang, and Horst Schulz)


%reversible:
% L_C4_CoA + NAD <-> K_C4_CoA + NADH
v_3HdH_C4_CoA = 23*1e3*(L_C4_CoA.*NAD_mito - 1/100*K_C4_CoA.*NADH_mito)./((1 + L_C4_CoA/0.0699).*(1 + NAD_mito/0.0585) + (1 + K_C4_CoA/0.0169).*(1 + NADH_mito/0.0054) - 1); %Purification and Properties of Mitochondrial and Peroxisaml 3-Hydroxyacyl-CoA... (Osumi, Hashimoto)
% L_C6_CoA + NAD <-> K_C6_CoA + NADH
v_3HdH_C6_CoA = 23*1e3*(L_C6_CoA.*NAD_mito - 1/100*K_C6_CoA.*NADH_mito)./((1 + L_C6_CoA/0.0286).*(1 + NAD_mito/0.0585) + (1 + K_C6_CoA/0.02).*(1 + NADH_mito/0.0054) - 1); %Purification and Properties of Mitochondrial and Peroxisaml 3-Hydroxyacyl-CoA... (Osumi, Hashimoto)
% L_C8_CoA + NAD <-> K_C8_CoA + NADH
v_3HdH_C8_CoA = 23*1e3*(L_C8_CoA.*NAD_mito - 1/100*K_C8_CoA.*NADH_mito)./((1 + L_C8_CoA/0.0163).*(1 + NAD_mito/0.0585) + (1 + K_C8_CoA/0.02).*(1 + NADH_mito/0.0054) - 1);%Purification and Properties of Mitochondrial and Peroxisaml 3-Hydroxyacyl-CoA... (Osumi, Hashimoto)
% L_C10_CoA + NAD <-> K_C10_CoA + NADH
v_3HdH_C10_CoA = 23*1e3*(L_C10_CoA.*NAD_mito - 1/100*K_C10_CoA.*NADH_mito)./((1 + L_C10_CoA/0.0088).*(1 + NAD_mito/0.0585) + (1 + K_C10_CoA/0.02).*(1 + NADH_mito/0.0054) - 1);%Purification and Properties of Mitochondrial and Peroxisaml 3-Hydroxyacyl-CoA... (Osumi, Hashimoto)
% L_C12_CoA + NAD <-> K_C12_CoA + NADH
v_3HdH_C12_CoA = 23*1e3*(L_C12_CoA.*NAD_mito - 1/100*K_C12_CoA.*NADH_mito)./((1 + L_C12_CoA/0.0088).*(1 + NAD_mito/0.0585) + (1 + K_C12_CoA/0.02).*(1 + NADH_mito/0.0054) - 1); %???
% L_C14_CoA + NAD <-> K_C14_CoA + NADH
v_3HdH_C14_CoA = 23*1e3*(L_C14_CoA.*NAD_mito - 1/100*K_C14_CoA.*NADH_mito)./((1 + L_C14_CoA/0.0088).*(1 + NAD_mito/0.0585) + (1 + K_C14_CoA/0.02).*(1 + NADH_mito/0.0054) - 1); %???
% L_C16_CoA + NAD <-> K_C16_CoA + NADH
v_3HdH_C16_CoA = 23*1e4*(L_C16_CoA.*NAD_mito - 1/100*K_C16_CoA.*NADH_mito)./((1 + L_C16_CoA/0.003).*(1 + NAD_mito/0.0145) + (1 + K_C16_CoA/0.02).*(1 + NADH_mito/0.0054) - 1); %???

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% 3-ketoacyl-CoA-thiolase %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% K_C4_CoA + CoA -> AcCoA + AcCoA;
%v_3KT_C4 = 23*30*3e-1*CoA_mito./(CoA_mito + 0.05).*K_C4_CoA./(K_C4_CoA +0.006); %Crystallographoc and Kinetic Studies of Human Mitochondrial Acetoacetyl-CoA Thiolase ....(Haapalainen)
v_3KT_C4 = 1e6*(CoA_mito.*K_C4_CoA - 1/10^(26.94/5.7)*AcCoA_mito.^2);
% K_C6_CoA + CoA -> C4_CoA + AcCoA;
v_3KT_C6 = 23*30*3e-1*CoA_mito./(CoA_mito + 0.05).*K_C6_CoA./(K_C6_CoA +0.006);
% K_C8_CoA + CoA -> C6_CoA + AcCoA;
v_3KT_C8 = 23*30*3e-1*CoA_mito./(CoA_mito + 0.05).*K_C8_CoA./(K_C8_CoA +0.006);
% K_C10_CoA + CoA -> C8_CoA + AcCoA;
v_3KT_C10 = 23*30*3e-1*CoA_mito./(CoA_mito + 0.05).*K_C10_CoA./(K_C10_CoA +0.006);
% K_C12_CoA + CoA -> C10_CoA + AcCoA;
v_3KT_C12 = 23*30*3e-1*CoA_mito./(CoA_mito + 0.05).*K_C12_CoA./(K_C12_CoA +0.006);
% K_C14_CoA + CoA -> C12_CoA + AcCoA;
v_3KT_C14 = 23*30*3e-1*CoA_mito./(CoA_mito + 0.05).*K_C14_CoA./(K_C14_CoA +0.006);
% K_C16_CoA + CoA -> C14_CoA + AcCoA;
v_3KT_C16 = 23*30*3e-1*CoA_mito./(CoA_mito + 0.05).*K_C16_CoA./(K_C16_CoA +0.006);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

v_Cit_Mal = 1e-1*(Cit_mito.*Mal_in - 0.1*Cit_in.*Mal_mito)./( (1 + Cit_mito/0.13).*(1 + Mal_in/0.78) + (1+Cit_in/0.13).*(1+Mal_mito/0.78) -1 );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ATP_in = 3;
v_Cit_Lys = 1*(Cit_in./(Cit_in + 0.104).*ATP_in./(ATP_in + 0.041).*CoA_cyt./(CoA_cyt + 0.002));

v_Cit_Lys_Cit =  Cit_in./(Cit_in + 0.104);
v_Cit_Lys_ATP =  ATP_in./(ATP_in + 0.041);
v_Cit_Lys_CoA =  CoA_cyt./(CoA_cyt + 0.002);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ATP_in = 3;
v_AcCoAcarb = 1e-3*(1 + 2.5*Cit_in.^1.5./(Cit_in.^1.5 + 0.05)).*ATP_in./(ATP_in + 0.12).*AcCoA_in./(AcCoA_in + 0.058).*(1-Mal_CoA_in./(Mal_CoA_in + 0.009));

v_AcCoAcarb_Cit = (1 + 2.5*Cit_in.^1.5./(Cit_in.^1.5 + 0.05));
v_AcCoAcarb_ATP = ATP_in./(ATP_in + 0.12);
v_AcCoAcarb_AcCoA = AcCoA_in./(AcCoA_in + 0.058);
v_AcCoAcarb_Mal_CoA_in = (1-Mal_CoA_in./(Mal_CoA_in + 0.009));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

v_Mal_CoA_use = 5e-3*Mal_CoA_in./(Mal_CoA_in + 0.1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

v_Mal_CoA_dc = 1e-3*Mal_CoA_in./(Mal_CoA_in + 0.36);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Ketonk�rperbildung  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

v_HMG_CoA_synthase = 0*1e-3*(AcCoA_mito.*K_C4_CoA./( 0.00035*(1+K_C4_CoA/0.012).*AcCoA_mito + 0.029*K_C4_CoA + AcCoA_mito.*K_C4_CoA));
v_HMG_CoA_lyase = 1e-3*S3H3MG_CoA_mito./(S3H3MG_CoA_mito + 0.048);
v_bHBDH = (AcAc_mito.*NADH_mito - 1/(10.^(15.7424/5.7))*R3HBut_mito.*NAD_mito)./((1 + NADH_mito/0.017.*(1+NAD_mito/0.121)).*(1 + AcAc_mito/0.204) + (1 + R3HBut_mito/1.604).*(1 + NAD_mito/0.067.*(1+NADH_mito/0.066)) - 1); 

v_AcAc_mito_ex   = 1e1*(AcAc_mito./(AcAc_mito + 0.1));
v_R3HBut_mito_ex = 1e1*(R3HBut_mito./(R3HBut_mito + 0.1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;

subplot(3,10,1), plot(tall,Cit_mito ,'g'); legend('Cit_{mito}',0);
subplot(3,10,2), plot(tall,IsoCit_mito ,'m'); legend('IsoCit_{mito}',0);
subplot(3,10,3), plot(tall,a_keto_mito ,'r'); legend('a-keto_{mito}',0);
subplot(3,10,4), plot(tall,SucCoA_mito ,'k'); legend('SucCoA_{mito}',0);
subplot(3,10,5), plot(tall,Suc_mito ,'y'); legend('Suc_{mito}',0);
subplot(3,10,6), plot(tall,Fum_mito ,'c'); legend('Fum_{mito}',0);
subplot(3,10,7), plot(tall,Mal_mito ,'g'); legend('Mal_{mito}',0);
subplot(3,10,8), plot(tall,Oxa_mito ,'m'); legend('Oxa_{mito}',0);
subplot(3,10,9), plot(tall,AcCoA_mito ,'r'); legend('AcCoA_{mito}',0);
subplot(3,10,10), plot(tall,CoA_mito ,'r'); legend('CoA_{mito}',0);

subplot(6,3,7), plot(tall,NAD_mito ,'m'); legend('NAD_{mito}',0);
subplot(6,3,8), plot(tall,NADH_mito ,'m'); legend('NADH_{mito}',0);
subplot(6,3,9), plot(tall,NAD_mito./NADH_mito ,'r'); legend('NAD_{mito}/NADH_{mito}',0);

subplot(6,9,28), plot(tall,v_pdhc/v_pdhc(1),'g'); 
subplot(6,9,29), plot(tall,v_cs/v_cs(1),'g'); 
subplot(6,9,30), plot(tall,v_ac/v_ac(1),'m');
subplot(6,9,31), plot(tall,v_icdh/v_icdh(1),'r'); 
subplot(6,9,32), plot(tall,v_akdhc/v_akdhc(1),'k');
subplot(6,9,33), plot(tall,v_succoas/v_succoas(1),'y'); 
subplot(6,9,34), plot(tall,v_succdh/v_succdh(1),'c'); 
subplot(6,9,35), plot(tall,v_fum/v_fum(1),'g'); 
subplot(6,9,36), plot(tall,v_mdh/v_mdh(1),'m'); 

subplot(3,9,19), plot(tall,v_pdhc,'g'); legend('v_{pdhc}',0);
subplot(3,9,20), plot(tall,v_cs,'g'); legend('v_{cs}',0);
subplot(3,9,21), plot(tall,v_ac,'m'); legend('v_{ac}',0);
subplot(3,9,22), plot(tall,v_icdh,'r'); legend('v_{icdh}',0);
subplot(3,9,23), plot(tall,v_akdhc,'k'); legend('v_{akdhc}',0);
subplot(3,9,24), plot(tall,v_succoas,'y'); legend('v_{succoas}',0);
subplot(3,9,25), plot(tall,v_succdh,'c'); legend('v_{succdh}',0);
subplot(3,9,26), plot(tall,v_fum,'g'); legend('v_{fum}',0);
subplot(3,9,27), plot(tall,v_mdh,'m'); legend('v_{mdh}',0);

figure;
subplot(5,5,1), plot(tall,v_pdhc_pyr,'y'); legend('v_{pdhc-pyr}',0);
subplot(5,5,2), plot(tall,v_pdhc_nad,'y'); legend('v_{pdhc-nad}',0);
subplot(5,5,3), plot(tall,v_pdhc_coa,'y'); legend('v_{pdhc-coa}',0);
subplot(5,5,5), plot(tall,v_pdhc/v_pdhc(1),'y'); legend('v_{pdhc}',0);

subplot(5,5,6), plot(tall,v_cs_oxa ,'r'); legend('v_{cs-oxa}',0);
subplot(5,5,7), plot(tall,v_cs_accoa ,'r'); legend('v_{cs-aaccoa}',0);
subplot(5,5,10), plot(tall,v_cs/v_cs(1),'r'); legend('v_{cs}',0);

subplot(5,5,11), plot(tall,v_icdh_iso,'b'); legend('v_{icdh-iso}',0);
subplot(5,5,12), plot(tall,v_icdh_nad,'b'); legend('v_{icdh-nad}',0);
subplot(5,5,13), plot(tall,K_m_iso_icdg,'r');legend('K_{m-iso-icdh}',0);
subplot(5,5,15), plot(tall,v_icdh/v_icdh(1),'r');legend('v_{icdh}',0);

subplot(5,5,16), plot(tall,v_akdhc_aketo ,'g');legend('v_{akdhc-aketo}',0);
subplot(5,5,17), plot(tall,v_akdhc_nad ,'g');legend('v_{akdhc-nad}',0);
subplot(5,5,18), plot(tall,v_akdhc_coa ,'g');legend('v_{akdhc-coa}',0);
subplot(5,5,19), plot(tall,K_akdhc_aketo,'b',tall,K_akdhc_CoA*1e3,'r' );legend('K_{m-a-keto-akdhc}','K_{m-CoA-akdhc}*1e3',0);
subplot(5,5,20), plot(tall,v_akdhc/v_akdhc(1) ,'g');legend('v_{akdhc}',0);

subplot(5,5,21), plot(tall,v_succdh_suc,'k'); legend('v_{succdh-suc}',0);
subplot(5,5,22), plot(tall,v_succdh_oxa,'k'); legend('v_{succdh-oxa}',0);
subplot(5,5,25), plot(tall,v_succdh/v_succdh(1),'k'); legend('v_{succdh}',0);
% 
% 
figure; 
subplot(6,4,1), plot(tall,C16_CoA_cyt,'r');  legend('C16_{CoA-cyt}',0);  title('CPT I metabolites');
subplot(6,4,2), plot(tall,C16_Car_cyt,'b');  legend('C16_{Car-cyt}',0);
subplot(6,4,3), plot(tall,C16_CoA,'r');      legend('C16_{CoA}',0);
subplot(6,4,4), plot(tall,C16_Car_mito,'b'); legend('C16_{Car-mito}',0);

subplot(6,4,5), plot(tall,CoA_cyt,'r');  legend('CoA_{cyt}',0);    title('CPT II metabolites');
subplot(6,4,6), plot(tall,Car_cyt,'b');  legend('Car_{cyt}',0);
subplot(6,4,7), plot(tall,CoA_mito,'r'); legend('CoA_{mito}',0);
subplot(6,4,8), plot(tall,Car_mito,'b'); legend('Car_{mito}',0);

subplot(6,7,15), plot(tall,C4_CoA,'r');  legend('C4_{CoA-mito}',0);  %title('Acyl-CoA Concentration');
subplot(6,7,16), plot(tall,C6_CoA,'r');  legend('C6_{CoA-mito}',0);
subplot(6,7,17), plot(tall,C8_CoA,'r');  legend('C8_{CoA-mito}',0);
subplot(6,7,18), plot(tall,C10_CoA,'r'); legend('C10_{CoA-mito}',0);
subplot(6,7,19), plot(tall,C12_CoA,'r'); legend('C12_{CoA-mito}',0);
subplot(6,7,20), plot(tall,C14_CoA,'r'); legend('C14_{CoA-mito}',0);
subplot(6,7,21), plot(tall,C16_CoA,'r'); legend('C16_{CoA-mito}',0);

subplot(6,7,22), plot(tall,E_C4_CoA,'r');  legend('E-C4_{CoA-mito}',0);  %title('Enoyl-CoA Concentration');
subplot(6,7,23), plot(tall,E_C6_CoA,'r');  legend('E-C6_{CoA-mito}',0);
subplot(6,7,24), plot(tall,E_C8_CoA,'r');  legend('E-C8_{CoA-mito}',0);
subplot(6,7,25), plot(tall,E_C10_CoA,'r'); legend('E-C10_{CoA-mito}',0);
subplot(6,7,26), plot(tall,E_C12_CoA,'r'); legend('E-C12_{CoA-mito}',0);
subplot(6,7,27), plot(tall,E_C14_CoA,'r'); legend('E-C14_{CoA-mito}',0);
subplot(6,7,28), plot(tall,E_C16_CoA,'r'); legend('E-C16_{CoA-mito}',0);

subplot(6,7,29), plot(tall,L_C4_CoA,'r');  legend('L-C4_{CoA-mito}',0);  %title('L-3Hydroxyl-CoA Concentration');
subplot(6,7,30), plot(tall,L_C6_CoA,'r');  legend('L-C6_{CoA-mito}',0);
subplot(6,7,31), plot(tall,L_C8_CoA,'r');  legend('L-C8_{CoA-mito}',0);
subplot(6,7,32), plot(tall,L_C10_CoA,'r'); legend('L-C10_{CoA-mito}',0);
subplot(6,7,33), plot(tall,L_C12_CoA,'r'); legend('L-C12_{CoA-mito}',0);
subplot(6,7,34), plot(tall,L_C14_CoA,'r'); legend('L-C14_{CoA-mito}',0);
subplot(6,7,35), plot(tall,L_C16_CoA,'r'); legend('L-C16_{CoA-mito}',0);

subplot(6,7,36), plot(tall,K_C4_CoA,'r');  legend('K-C4_{CoA-mito}',0);  %title('3-Ketoacyl-CoA Concentration');
subplot(6,7,37), plot(tall,K_C6_CoA,'r');  legend('K-C6_{CoA-mito}',0);
subplot(6,7,38), plot(tall,K_C8_CoA,'r');  legend('K-C8_{CoA-mito}',0);
subplot(6,7,39), plot(tall,K_C10_CoA,'r'); legend('K-C10_{CoA-mito}',0);
subplot(6,7,40), plot(tall,K_C12_CoA,'r'); legend('K-C12_{CoA-mito}',0);
subplot(6,7,41), plot(tall,K_C14_CoA,'r'); legend('K-C14_{CoA-mito}',0);
subplot(6,7,42), plot(tall,K_C16_CoA,'r'); legend('K-C16_{CoA-mito}',0);


figure;
subplot(6,3,1), plot(tall,v_CPT1,'m'); legend('v_{CPT1}',0); title('Lipidtransport');
subplot(6,3,2), plot(tall,v_CACT,'r');  legend('v_{CACT}',0);
subplot(6,3,3), plot(tall,v_CPT2,'k');  legend('v_{CPT2}',0);


subplot(6,7,15), plot(tall,v_C4_CoA_SC/v_C4_CoA_SC(1),'r');  legend('v_{C4-CoA-SC}',0); %title('Acyl-CoA-Dehydrogenase');
subplot(6,7,16), plot(tall,v_C6_CoA_MC/v_C6_CoA_MC(1),'k');  legend('v_{C6-CoA-MC}',0);
subplot(6,7,17), plot(tall,v_C8_CoA_MC/v_C8_CoA_MC(1),'r');  legend('v_{C8-CoA-MC}',0);
subplot(6,7,18), plot(tall,v_C10_CoA_LC/v_C10_CoA_LC(1),'k'); legend('v_{C10-CoA-LC}',0);
subplot(6,7,19), plot(tall,v_C12_CoA_LC/v_C12_CoA_LC(1),'r'); legend('v_{C12-CoA-LC}',0);
subplot(6,7,20), plot(tall,v_C14_CoA_LC/v_C14_CoA_LC(1),'k'); legend('v_{C14-CoA-LC}',0);
subplot(6,7,21), plot(tall,v_C16_CoA_LC/v_C16_CoA_LC(1),'k'); legend('v_{C16-CoA-LC}',0);

subplot(6,7,22), plot(tall,v_E_hyd_C4_CoA_MC/v_E_hyd_C4_CoA_MC(1),'r');  legend('v_{E-hyd-C4-CoA-SC}',0); %title('Enoyl-CoA-Hydratase');
subplot(6,7,23), plot(tall,v_E_hyd_C6_CoA_MC/v_E_hyd_C6_CoA_MC(1),'k');  legend('v_{E-hyd-C6-CoA-SC}',0);
subplot(6,7,24), plot(tall,v_E_hyd_C8_CoA_MC/v_E_hyd_C8_CoA_MC(1),'r');  legend('v_{E-hyd-C8-CoA-SC}',0);
subplot(6,7,25), plot(tall,v_E_hyd_C10_CoA_MC/v_E_hyd_C10_CoA_MC(1),'k'); legend('v_{E-hyd-C10-CoA-SC}',0);
subplot(6,7,26), plot(tall,v_E_hyd_C12_CoA_MC/v_E_hyd_C12_CoA_MC(1),'r'); legend('v_{E-hyd-C12-CoA-SC}',0);
subplot(6,7,27), plot(tall,v_E_hyd_C14_CoA_MC/v_E_hyd_C14_CoA_MC(1),'k'); legend('v_{E-hyd-C14-CoA-SC}',0);
subplot(6,7,28), plot(tall,v_E_hyd_C16_CoA_MC/v_E_hyd_C16_CoA_MC(1),'k'); legend('v_{E-hyd-C16-CoA-SC}',0);

subplot(6,7,29), plot(tall,v_3HdH_C4_CoA/v_3HdH_C4_CoA(1),'r');  legend('v_{3HdH-C4-CoA}',0); %title('Hydroxyl-CoA-Dehydrogenase');
subplot(6,7,30), plot(tall,v_3HdH_C6_CoA/v_3HdH_C6_CoA(1),'k');  legend('v_{3HdH-C6-CoA}',0);
subplot(6,7,31), plot(tall,v_3HdH_C8_CoA/v_3HdH_C8_CoA(1),'r');  legend('v_{3HdH-C8-CoA}',0);
subplot(6,7,32), plot(tall,v_3HdH_C10_CoA/v_3HdH_C10_CoA(1),'k'); legend('v_{3HdH-C10-CoA}',0);
subplot(6,7,33), plot(tall,v_3HdH_C12_CoA/v_3HdH_C12_CoA(1),'r'); legend('v_{3HdH-C12-CoA}',0);
subplot(6,7,34), plot(tall,v_3HdH_C14_CoA/v_3HdH_C14_CoA(1),'k'); legend('v_{3HdH-C14-CoA}',0);
subplot(6,7,35), plot(tall,v_3HdH_C16_CoA/v_3HdH_C16_CoA(1),'k'); legend('v_{3HdH-C16-CoA}',0);

subplot(6,7,36), plot(tall,v_3KT_C4/v_3KT_C4(1),'r');  legend('v_{3KT-C4}',0); %title('B-Ketothiolase');
subplot(6,7,37), plot(tall,v_3KT_C6/v_3KT_C6(1),'k');  legend('v_{3KT-C6}',0);
subplot(6,7,38), plot(tall,v_3KT_C8/v_3KT_C8(1),'r');  legend('v_{3KT-C8}',0);
subplot(6,7,39), plot(tall,v_3KT_C10/v_3KT_C10(1),'k'); legend('v_{3KT-C10}',0);
subplot(6,7,40), plot(tall,v_3KT_C12/v_3KT_C12(1),'r'); legend('v_{3KT-C12}',0);
subplot(6,7,41), plot(tall,v_3KT_C14/v_3KT_C14(1),'k'); legend('v_{3KT-C14}',0);
subplot(6,7,42), plot(tall,v_3KT_C16/v_3KT_C16(1),'k'); legend('v_{3KT-C16}',0);

figure;
subplot(3,6,1), plot(tall,Km_CPT1_C16_CoA,'b'); legend('Km_{CPT1-C16-CoA}',0); 
subplot(3,6,2), plot(tall,v_CPT1_C16_CoA,'m'); legend('v_{CPT1-C16-CoA}',0);  title('FFA Transport rates');
subplot(3,6,3), plot(tall,v_CPT1_Car,'g'); legend('v_{CPT1-Car}',0); 
subplot(3,6,4), plot(tall,v_CPT1_Mal_CoA,'c'); legend('v_{CPT1-Mal-CoA}',0);
subplot(3,6,5), plot(tall,v_CPT1/v_CPT1(1),'m'); legend('v_{CPT1-rel}',0); 
subplot(3,6,6), plot(tall,v_CPT1,'r'); legend('v_{CPT1}',0);

subplot(3,4,5), plot(tall,v_CACT_C16_Car,'r');  legend('v_{CACT-C16-Car_{cyt}}',0);
subplot(3,4,6), plot(tall,v_CACT_Car_mito,'r');  legend('v_{CACT-Car_{mito}}',0);
subplot(3,4,7), plot(tall,v_CACT/v_CACT(1),'r');  legend('v_{CACT-rel}',0);
subplot(3,4,8), plot(tall,v_CACT,'k');  legend('v_{CACT}',0);

subplot(3,4,9), plot(tall,v_CPT2_C16_Car ,'k');  legend('v_{CPT2-C16-Car }',0);
subplot(3,4,10), plot(tall,v_CPT2_CoA,'k');  legend('v_{CPT2-CoA}',0);
subplot(3,4,11), plot(tall,v_CPT2/v_CPT2(1),'k');  legend('v_{CPT2-rel}',0);
subplot(3,4,12), plot(tall,v_CPT2,'y');  legend('v_{CPT2}',0);



v_CAC_NADH  = v_mdh + v_akdhc + v_icdh;
v_beta_NADH = v_3HdH_C4_CoA + v_3HdH_C6_CoA + v_3HdH_C8_CoA + v_3HdH_C10_CoA + v_3HdH_C12_CoA + v_3HdH_C14_CoA + v_3HdH_C16_CoA;
v_NADH_use = 0*5*k_drain.*NADH_mito./(NADH_mito + 1e-3);

% figure;
% 
% subplot(3,4,1), plot(tall,v_mdh,'m'); legend('v_{mdh}',0);  title('NAD - NADH Bilanz');
% subplot(3,4,2), plot(tall,v_akdhc,'m'); legend('v_{akdhc}',0); 
% subplot(3,4,3), plot(tall,v_icdh,'m'); legend('v_{icdh}',0); 
% subplot(3,4,4), plot(tall,v_CAC_NADH,'r'); legend('v_{CAC-NADH}',0); 
% 
% subplot(3,8,9), plot(tall,v_3HdH_C4_CoA,'m');  legend('v_{3HdH-C4-CoA}',0); 
% subplot(3,8,10), plot(tall,v_3HdH_C6_CoA,'m');  legend('v_{3HdH-C6-CoA}',0);
% subplot(3,8,11), plot(tall,v_3HdH_C8_CoA,'m');  legend('v_{3HdH-C8-CoA}',0);
% subplot(3,8,12), plot(tall,v_3HdH_C10_CoA,'m'); legend('v_{3HdH-C10-CoA}',0);
% subplot(3,8,13), plot(tall,v_3HdH_C12_CoA,'m'); legend('v_{3HdH-C12-CoA}',0);
% subplot(3,8,14), plot(tall,v_3HdH_C14_CoA,'m'); legend('v_{3HdH-C14-CoA}',0);
% subplot(3,8,15), plot(tall,v_3HdH_C16_CoA,'m'); legend('v_{3HdH-C16-CoA}',0);
% subplot(3,8,16), plot(tall,v_beta_NADH,'r'); legend('v_{beta-NADH}',0);
% 
% subplot(3,6,13), plot(tall,v_pdhc,'r'); legend('v_{pdhc-NADH-production}',0); 
% subplot(3,6,14), plot(tall,v_CAC_NADH,'r'); legend('v_{CAC-NADH-production}',0); 
% subplot(3,6,15), plot(tall,v_beta_NADH,'r'); legend('v_{beta-NADH-production}',0);  
% subplot(3,6,16), plot(tall,v_beta_NADH + v_pdhc + v_CAC_NADH,'m'); legend('v_{beta-NADH} + v_{pdhc} + v_{CAC-NADH},',0); 
% subplot(3,6,17), plot(tall, v_NADH_use,'b'); legend('v_{NADH-use}',0); 
% subplot(3,6,18), plot(tall, v_beta_NADH + v_pdhc + v_CAC_NADH - v_NADH_use,'b'); legend('v_{NADH-Bilanz}',0); 


figure;
subplot(5,3,1), plot(tall,AcCoA_mito,'b'); legend('AcCoA_{mito}',0);  title('Ketonk�rper');
subplot(5,3,2), plot(tall,CoA_mito,'r'); legend('CoA_{mito}',0); 
subplot(5,3,3), plot(tall,K_C4_CoA,'y'); legend('K-C4-CoA = AcAc-CoA_{mito}',0); 

subplot(5,2,3), plot(tall,v_3KT_C4,'b'); legend('v_{3KT-C4}',0);
subplot(5,2,4), plot(tall,CoA_mito.*K_C4_CoA./(AcCoA_mito.^2) ,'b'); legend('CoA_{mito}.*K-C4-CoA./(AcCoA_{mito}.^2)',0);

subplot(5,3,7), plot(tall,S3H3MG_CoA_mito,'r'); legend('S3H3MG-CoA_{mito}',0); 
subplot(5,3,8), plot(tall,AcAc_mito,'y'); legend('AcAc_{mito}',0); 
subplot(5,3,9), plot(tall,R3HBut_mito,'b'); legend('R3HBut_{mito}',0);


subplot(5,3,10), plot(tall,v_HMG_CoA_synthase,'r'); legend('v_{HMG-CoA-synthase}',0); 
subplot(5,3,11), plot(tall,v_HMG_CoA_lyase,'y'); legend('v-{HMG-CoA-lyase}',0); 
subplot(5,3,12), plot(tall,v_bHBDH,'b'); legend('v_{bHBDH}',0);

subplot(5,2,9), plot(tall,v_AcAc_mito_ex,'y'); legend('v_{AcAc-mito-ex}',0); 
subplot(5,2,10), plot(tall,v_R3HBut_mito_ex,'b'); legend('v_{R3HBut-mito-ex}',0);

Acyl_CoA_total = C4_CoA + C6_CoA + C8_CoA + C10_CoA + C12_CoA + C14_CoA + C16_CoA;
Enoyl_CoA_total = E_C4_CoA + E_C6_CoA + E_C8_CoA + E_C10_CoA + E_C12_CoA + E_C14_CoA + E_C16_CoA;
L_3_H_CoA_total = L_C4_CoA + L_C6_CoA + L_C8_CoA + L_C10_CoA + L_C12_CoA + L_C14_CoA + L_C16_CoA;
K_Acetyl_CoA_total = K_C4_CoA + K_C6_CoA + K_C8_CoA + K_C10_CoA + K_C12_CoA + K_C14_CoA + K_C16_CoA;
CoA_mito_total = Acyl_CoA_total + Enoyl_CoA_total + L_3_H_CoA_total + K_Acetyl_CoA_total + CoA_mito + AcCoA_mito + S3H3MG_CoA_mito + SucCoA_mito;

% figure;
% 
% subplot(3,4,1), plot(tall,Acyl_CoA_total,'r'); legend('Acyl-CoA-total',0);   title('CoA-Bilanz');
% subplot(3,4,2), plot(tall,Enoyl_CoA_total,'m'); legend('Enoyl-CoA-total',0);
% subplot(3,4,3), plot(tall,L_3_H_CoA_total,'c'); legend('L-3-H-CoA-total',0);
% subplot(3,4,4), plot(tall,K_Acetyl_CoA_total,'b'); legend('K-Acetyl-CoA-total',0);
% 
% subplot(3,8,9), plot(tall,Acyl_CoA_total./CoA_mito_total*100,'r'); legend('Acyl-CoA-total',0);
% subplot(3,8,10), plot(tall,Enoyl_CoA_total./CoA_mito_total*100,'m'); legend('Enoyl-CoA-total',0);
% subplot(3,8,11), plot(tall,L_3_H_CoA_total./CoA_mito_total*100,'c'); legend('L-3-H-CoA-total',0);
% subplot(3,8,12), plot(tall,K_Acetyl_CoA_total./CoA_mito_total*100,'b'); legend('K-Acetyl-CoA-total',0);
% subplot(3,8,13), plot(tall,CoA_mito./CoA_mito_total*100,'b'); legend('CoA_{mito}',0);
% subplot(3,8,14), plot(tall,AcCoA_mito./CoA_mito_total*100,'r'); legend('AcCoA_{mito}',0);
% subplot(3,8,15), plot(tall,S3H3MG_CoA_mito./CoA_mito_total*100,'k'); legend('S3H3MG-CoA_{mito}',0);
% subplot(3,8,16), plot(tall,SucCoA_mito./CoA_mito_total*100,'g'); legend('SucCoA_{mito}',0);
% 
% subplot(3,5,11), plot(tall,CoA_mito,'b'); legend('CoA_{mito}',0);
% subplot(3,5,12), plot(tall,AcCoA_mito,'r'); legend('AcCoA_{mito}',0);
% subplot(3,5,13), plot(tall,S3H3MG_CoA_mito,'k'); legend('S3H3MG-CoA_{mito}',0);
% subplot(3,5,14), plot(tall,SucCoA_mito,'g'); legend('SucCoA_{mito}',0);
% subplot(3,5,15), plot(tall,CoA_mito_total,'y'); legend('CoA_{mito}-total',0);



v_3KT = + v_3KT_C16 + v_3KT_C14 + v_3KT_C12 + v_3KT_C10 + v_3KT_C8 + v_3KT_C6 + v_3KT_C4 + v_3KT_C4;

v_AcCoA_total = v_pdhc + v_HMG_CoA_lyase + v_3KT - v_cs - v_HMG_CoA_synthase;
v_AcCoA_plus  = v_pdhc + v_HMG_CoA_lyase + v_3KT;
v_AcCoA_minus = v_cs + v_HMG_CoA_synthase;

% figure;
% 
% subplot(5,4,1), plot(tall,v_pdhc,'m'); legend('v_{pdhc}',0); title('AcCoA-Bilanz');
% subplot(5,4,2), plot(tall, v_3KT,'m'); legend('v_{3KT}',0);
% subplot(5,4,3), plot(tall,v_HMG_CoA_lyase,'m'); legend('v_{HMG-CoA-lyase}',0);
% subplot(5,4,4), plot(tall,v_AcCoA_plus,'r'); legend('v_{AcCoA-plus}',0);
% 
% subplot(5,4,5), plot(tall,v_pdhc./v_AcCoA_plus*100,'m'); legend('v_{pdhc}-rel',0);
% subplot(5,4,6), plot(tall, v_3KT./v_AcCoA_plus*100,'m'); legend('v_{3KT}-rel',0);
% subplot(5,4,7), plot(tall,v_HMG_CoA_lyase./v_AcCoA_plus*100,'m'); legend('v_{HMG-CoA-lyase}-rel',0);
% subplot(5,4,8), plot(tall,v_AcCoA_plus./v_AcCoA_plus*100,'r'); legend('v_{AcCoA-plus}-rel',0);
% 
% subplot(5,3,7), plot(tall,v_cs,'c'); legend('v_{cs}',0);
% subplot(5,3,8), plot(tall,v_HMG_CoA_synthase ,'c'); legend('v_{HMG-CoA-synthase}',0);
% subplot(5,3,9), plot(tall,v_AcCoA_minus,'b'); legend('v_{AcCoA-minus}',0);
% 
% subplot(5,3,10), plot(tall,v_cs./v_AcCoA_minus*100,'c'); legend('v_{cs}-rel',0);
% subplot(5,3,11), plot(tall,v_HMG_CoA_synthase./v_AcCoA_minus*100,'c'); legend('v_{HMG-CoA-synthase}-rel',0);
% subplot(5,3,12), plot(tall,v_AcCoA_minus./v_AcCoA_minus*100,'b'); legend('v_{AcCoA-minus}-rel',0);
% 
% subplot(5,4,17), plot(tall,v_AcCoA_plus,'r'); legend('v_{AcCoA-plus}',0);
% subplot(5,4,18), plot(tall,v_AcCoA_minus,'b'); legend('v_{AcCoA-minus}',0);
% subplot(5,4,19), plot(tall,v_AcCoA_total,'k'); legend('AcCoA-Bilanz',0);
% subplot(5,4,20), plot(tall,AcCoA_mito,'g'); legend('AcCoA_{mito}',0);  

figure;

subplot(6,2,1),plot(tall,free1,'r'); legend('free1',0);
subplot(6,2,2),plot(tall,dummy1,'m'); legend('dummy1',0);

subplot(6,5,6), plot(tall,v_AcCoAcarb_Cit,'r'); legend('v_{AcCoAcarb-Cit}',0);
subplot(6,5,7), plot(tall,v_AcCoAcarb_ATP,'b'); legend('v_{AcCoAcarb_ATP}',0);
subplot(6,5,8), plot(tall,v_AcCoAcarb_AcCoA ,'k'); legend('v_{AcCoAcarb-AcCoA}',0);
subplot(6,5,9), plot(tall,v_AcCoAcarb_Mal_CoA_in,'g'); legend('v_{AcCoAcarb-Mal-CoA_{in}}',0);  
subplot(6,5,10), plot(tall,v_AcCoAcarb,'g'); legend('v_{AcCoAcarb}',0);  

subplot(6,3,7), plot(tall,Mal_CoA_in,'r'); legend('MalCoA_{in}',0);
subplot(6,3,8), plot(tall,AcCoA_in,'b'); legend('AcCoA_{in}',0);
subplot(6,3,9), plot(tall,Oxa_in,'k'); legend('Oxa_{in}',0);

subplot(6,3,10), plot(tall,Cit_in,'r'); legend('Cit_{in}',0);
subplot(6,3,11), plot(tall,ATP_in,'b'); legend('ATP_{in}',0);
subplot(6,3,12), plot(tall,CoA_cyt,'k'); legend('CoA_{cyt}',0);

subplot(6,5,21), plot(tall,v_Cit_Lys_Cit,'r'); legend('v_{Cit-Lys-Cit}',0);
subplot(6,5,22), plot(tall,v_Cit_Lys_ATP,'b'); legend('v_{Cit_Lys-ATP}',0);
subplot(6,5,23), plot(tall,v_Cit_Lys_CoA,'k'); legend('v_{Cit-Lys-CoA}',0);
subplot(6,5,24), plot(tall,(1-min(1,free1)),'k'); legend('1-free1',0);
subplot(6,5,25), plot(tall,v_Cit_Lys.*(1-min(1,free1)),'k'); legend('v_{Cit-Lys}',0);

subplot(6,6,31), plot(tall,v_AcCoAcarb_Cit ,'r'); legend('v_{AcCoAcarb-Cit}',0);
subplot(6,6,32), plot(tall,v_AcCoAcarb_ATP,'b'); legend('v_{AcCoAcarb-ATP}',0);
subplot(6,6,33), plot(tall,v_AcCoAcarb_AcCoA,'c'); legend('v_{AcCoAcarb-AcCoA}',0);
subplot(6,6,34), plot(tall,v_AcCoAcarb_Mal_CoA_in,'y'); legend('v_{AcCoAcarb-Mal-CoA_{in}}',0);
subplot(6,6,35), plot(tall,1-min(1,free1),'k'); legend('1-free1',0);
subplot(6,6,36), plot(tall,v_AcCoAcarb.*(1-min(1,free1)),'k'); legend('v_{AcCoAcarb}',0);



pH_in = -log10(H_in*1e-3);
pH_mito = -log10(H_mito*1e-3);
dpH = pH_in - pH_mito;

% figure;
% 
% subplot(10,1,1), plot(tall,V_mm,'m'); legend('V_{mm}',0);
% %subplot(10,2,2), plot(tall,H_buff,'m'); legend('H_{buff}',0);
% 
% subplot(10,4,5), plot(tall,ATP_cyt,'r'); legend('ATP_{in}',0);
% subplot(10,4,6), plot(tall,ADP_cyt,'b'); legend('ADP_{in}',0);
% subplot(10,4,7), plot(tall,ATP_mito,'r'); legend('ATP_{mito}',0);
% subplot(10,4,8), plot(tall,ADP_mito,'b'); legend('ADP_{mito}',0);
% 
% %subplot(8,2,5), plot(tall,C_in,'k')
% %subplot(8,2,6), plot(tall,C_mito,'k')
% 
% subplot(10,4,9), plot(tall,NADH_cyt,'m'); legend('NADH_{in}',0);
% subplot(10,4,10), plot(tall,NAD_cyt,'b'); legend('NAD_{in}',0);
% subplot(10,4,11), plot(tall,NADH_mito_oxi,'m'); legend('NADH_{mito-oxi}',0);
% subplot(10,4,12), plot(tall,NAD_mito_oxi,'b'); legend('NAD_{mito-oxi}',0);
% 
% subplot(10,2,7), plot(tall,K_cyt,'c'); legend('K_{in}',0);
% subplot(10,2,8), plot(tall,K_mito,'c'); legend('K_{mito}',0);
% subplot(10,2,9), plot(tall,Na_cyt,'r'); legend('Na_{in}',0);
% subplot(10,2,10), plot(tall,Na_mito,'r'); legend('Na_{mito}',0);
% subplot(10,2,11), plot(tall,Ca_cyt,'b'); legend('Ca_{in}',0);
% subplot(10,2,12), plot(tall,Ca_mito,'b'); legend('Ca_{mito}',0);
% subplot(10,2,13), plot(tall,Pi_cyt,'y'); legend('P_{in}',0);
% subplot(10,2,14), plot(tall,P_mito,'y'); legend('P_{mito}',0);
% subplot(10,2,15), plot(tall,H_cyt,'m'); legend('H_{in}',0);
% subplot(10,2,16), plot(tall,H_mito,'m'); legend('H_{mito}',0);
% subplot(10,2,17), plot(tall,pH_in,'m',tall,pH_mito,'r'); legend('pH_{in}',0);
% subplot(10,2,18), plot(tall,dpH,'m'); legend('dpH',0);
% 
% subplot(10,9,82), plot(tall,P_mito,'c'); legend('P_{mito}',0);
% subplot(10,9,83), plot(tall,O2_ex ,'c'); legend('O2_{ex}',0);
% subplot(10,9,84), plot(tall,O2_in,'r'); legend('O2_{in}',0);
% subplot(10,9,85), plot(tall,Q,'r'); legend('Q',0);
% subplot(10,9,86), plot(tall,QH2 ,'b'); legend('QH2 ',0);
% subplot(10,9,87), plot(tall,cytC_ox,'b'); legend('cytC_{ox}',0);
% subplot(10,9,88), plot(tall,cytC_red,'y'); legend('cytC_{red}',0);
% subplot(10,9,89), plot(tall,Q_p,'y'); legend('Q_p',0);
% subplot(10,9,90), plot(tall,Q_n,'y'); legend('Q_n',0);



%Thermodynamic

dGpH = + R*T/F*1000*log(H_in./H_mito);
dGp = -V_mm + R*T/F*1000*log(H_in./H_mito);

Em_N = -291 + 0.5*R*T/F*1000*log(NAD_mito./NADH_mito);%-276 + 0.5*R*T/F*1000*log(NAD_mito/NADH_mito);
Em_Q = 87 + 0.5*R*T/F*1000*log(Q./QH2);%102 + 0.5*R*T/F*1000*log(Q/QH2);%
Em_C = 221 + R*T/F*1000*log(cytC_ox./cytC_red);%229 + R*T/F*1000*log(cytC_ox/cytC_red);

%Complex1 NADH + Q -> NAD + QH2
dG1 = Em_Q - Em_N - 2*dGp;% 
v1 = A_m*33*(dG1)*1e-5*scale_oxi;

%Complex2 : Q -> QH2
v_succdh = 0.55*Suc_mito./(Suc_mito + 1.6);%(1+0.5*z)*
v_c2 = 0*v_succdh.*1e1*F.*Vol_mito*scale_oxi;

%Complex3 QH2 + cyt_ox -> Q + cyt_red
dG3 = Em_C - Em_Q  - dGp;% 
v3 = A_m*51*(dG3)*1e-5*scale_oxi;

%Complex4 cyt_red + O2 -> H2O
v4 =A_m*15e7*1e-1./((1+H_in./H_mito).^12).*cytC_red./(cytC_red +0.01)*scale_oxi;

v_NAD_mito  =   v1.*1e-1/F./Vol_mito;

% figure;
% 
% subplot(5,2,1), plot(tall,dGpH,'m'); legend('dGpH',0);
% subplot(5,2,2), plot(tall,dGp ,'m'); legend('dGp',0);
% 
% subplot(5,3,4), plot(tall,Em_N,'r'); legend('Em_N',0);
% subplot(5,3,5), plot(tall,Em_Q,'r'); legend('Em_Q',0);
% subplot(5,3,6), plot(tall,Em_C  ,'b'); legend('Em_C ',0);
% 
% subplot(5,2,5), plot(tall,dG1,'r'); legend('dG1',0);
% subplot(5,2,6), plot(tall,dG3,'r'); legend('dG3',0);
% 
% subplot(5,5,16), plot(tall,v1,'b'); legend('v1',0);
% subplot(5,5,17), plot(tall,v_succdh,'y'); legend('v_{succdh}',0);
% subplot(5,5,18), plot(tall,v_c2,'y'); legend('v_{c2}',0);
% subplot(5,5,19), plot(tall,v3,'y'); legend('v3',0);
% subplot(5,5,20), plot(tall,v4,'y'); legend('v4',0);
% 
% subplot(5,2,9), plot(tall,v1 + v_c2 - v3,'r'); legend('v1 + v_{c2} - v3',0);
% subplot(5,2,10), plot(tall,-v3 + v4,'r'); legend('-v3 + v4',0);
%subplot(5,3,6), plot(tall,,'b'); legend('Em_C ',0);

%subplot(5,2,9), plot(tall,v_NAD_mito,'m'); legend('v_{NAD-mito}',0);
%subplot(5,2,10), plot(tall,v_NAD_mito./v_NAD_mito(1),'m'); legend('v_{NAD-mito}',0);




% P_Ca =  1e-9;
P_H  = 4e-4;
P_C  = 0.5e-9;
P_K  = 0.2e-9;
P_Na = 0.1e-9;


P_Ca = 0.1e-10;% + 0.3e-11*(Ca_in*1e3).^2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Str�me (in 10^-4 A)
U_mito=V_mm/1000.0*F/R/T;

%in A=cm*cm, P=m/s, F=C/Mol, X_in/out/sub=mMol/liter=Mol/m^3
%=> cm*cm*m/s*C/Mol*Mol/m3=10^-4 m^3/s*C*Mol/Mol/m^3=10-4 C/s =10^4 A

%Calcium
% Ca-Pumpe
Ca0  = 1.0e-3;
k_Ca = 4.0e-13;    

%I_CaP = k_Ca*A_m*F/(1+(Ca0/Ca_mito)^1);
I_Ca_P  = 1e-7*(Ca_mito - 3e6*Ca_cyt.^3);%
I_Ca_ED = 2.0*A_m*P_Ca*(U_mito)*F.*(Ca_cyt-Ca_mito.*exp(2.0*(U_mito)))./(1-exp(2.0*(U_mito)));%-2.0*A_m*P_Ca*U_mito*F.*Ca_cyt;%
I_Ca    = I_Ca_ED + I_Ca_P;%

%Chlorid
I_C  = A_m*P_C*U_mito*F.*(Cl_cyt-Cl_mito.*exp(-U_mito))./(1-exp(-U_mito));

%Kalium
K0 = 140;
%I_K_P = -2*A_m/((1+K0/K_mito)^3);%;
I_K_P  = n*3e-8*(K_cyt.*H_mito-K_mito.*H_cyt);                                          % mehr spielen!!!!
I_K_ED = -A_m*P_K*U_mito*F.*(K_cyt-K_mito.*exp(U_mito))./(1-exp(U_mito));
I_K    = I_K_ED + I_K_P;


%Na-pumpe
Na0=10;
%I_Na_P = -.32*A_m/((1+Na0/Na_mito)^4);
I_Na_P  = n*2e-7*(Na_cyt.*H_mito-Na_mito.*H_cyt);
I_Na_ED = -A_m*P_Na*U_mito*F.*(Na_cyt-Na_mito.*exp(U_mito));%./(1-exp(U_mito)); 
I_Na    = I_Na_ED + I_Na_P; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ATP-Synthetase in 10^-4 A

%dG_syn = -31900 + R*T * log(ATP_mito./(ADP_mito.*P_mito)) + 4*(-V_mm/1000*F + R*T* log(H_in./H_mito));
%v_syn1 = H_mito - 4e-5;
%v_syn  = -1e-11*dG_syn;%1e-1*v_syn1;%*(ADP_mito/ATP_mito*(sign(v_syn1)<0) + (ATP_mito/ADP_mito*(sign(v_syn1)>0)));
%v_syn= -10e-7*ADP_mito;%-2e-5*sign(dG_syn)*abs(dG_syn)^1/(abs(dG_syn)+3000)^1;%*( P_mito/(P_mito + 3)*ADP_mito^6/(ADP_mito + 3)^6*(sign(dG_syn)>0));

K_syn = 2.5;
v_syn = -n*6*10e-9*ADP_mito.^8./(ADP_mito + K_syn).^8;%*P_mito/(P_mito + 0.5)
 
%v_syn = 0;%-2e-4*sign(dG_syn)*abs(dG_syn)^1/(abs(dG_syn)+3000)^1*((ATP_mito/(ATP_mito + 0.1))*(sign(dG_syn)<0) + P_mito/(P_mito + 3)*ADP_mito^6/(ADP_mito + 3)^6*(sign(dG_syn)>0));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ADP_in -> ATP_mito exchanger in 10^-4 A

K1 = 0.4;
%v_ex = 8e1*Vol_mito*F*10^(-0.65*V_mm/120)*ADP_in/(ADP_in + K1)*ATP_mito/(ATP_mito + 0.1);  %brauchen besseres
%v_ex = 12e-10*n*(ADP_in./(ADP_in + ATP_in*exp(0.12*(-150)/1000*F/R/T)) - ADP_mito./(ADP_mito + ATP_mito*exp(-0.88*(-150)/1000*F/R/T)));

v_ex = 8e-10*n*1.33* ADP_cyt.^2./(ADP_cyt.^2 + (0.37*ATP_cyt).^2.*ATP_mito./(ATP_mito+0.4)); %falsch!!!!!!!!! Neuro �ndern
%v_ex = 8e-10*n*1.33* ADP_in.^2./(ADP_in.^2 + (0.5).^2.*ATP_mito./(ATP_mito+0.4)); %falsch!!!!!!!!! Neuro �ndern
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Phosphattransport in 10^-4 A

v_Phos =  n*1e5*F*Vol_mito.*(Pi_cyt.*H_cyt - P_mito.*H_mito);%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I_H_P = -(4*v1+2*v3+4*v4)/scale_oxi; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I_H_ED = -A_m*P_H*U_mito*F.*(H_cyt-H_mito.*exp(U_mito))./(1-exp(U_mito));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I_H  = ( I_H_ED + I_H_P  - I_Na_P - I_K_P + v_Phos - 3*v_syn );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

v_H_P_in = -1e-1*I_H_P/F./Vol_zelle;
v_H_ED_in = -1e-1*I_H_ED/F./Vol_zelle;
v_H_Na_P_in = 1e-1*I_Na_P/F./Vol_zelle;
v_H_K_P_in = 1e-1*I_K_P/F./Vol_zelle;
v_H_syn_in = 3*1e-1*v_syn/F./Vol_zelle;
v_H_Phos_in = -1e-1*v_Phos/F./Vol_zelle;
%v_H_Pyr_in = -v_pyr_ex_mito.*Vol_mito./Vol_zelle;;


v_H_P_mito = -1e-1*I_H_P/F./Vol_mito;
v_H_ED_mito = -1e-1*I_H_ED/F./Vol_mito;
v_H_Na_P_mito = 1e-1*I_Na_P/F./Vol_mito;
v_H_K_P_mito = 1e-1*I_K_P/F./Vol_mito;
v_H_syn_mito = 3*1e-1*v_syn/F./Vol_mito;
v_H_Phos_mito = -1e-1*v_Phos/F./Vol_mito;
%v_H_Pyr_mito = -v_pyr_ex_mito;

% figure;
% 
% subplot(3,8,1), plot(tall,v_H_P_in,'r'); legend('v_{H-Pumpe-in}',0); title('mitochondriale Protonenstr�me');
% subplot(3,8,2), plot(tall,v_H_ED_in,'b'); legend('v_{H-ED-in}',0);%
% subplot(3,8,3), plot(tall,v_H_Na_P_in,'b'); legend('v_{H-Na-P-in}',0);%
% subplot(3,8,4), plot(tall,v_H_K_P_in,'b'); legend('v_{K_P-in}',0);%
% subplot(3,8,5), plot(tall,v_H_syn_in,'b'); legend('v_{H-syn-in}',0);%
% subplot(3,8,6), plot(tall,v_H_Phos_in,'b'); legend('v_{H-Phos-in}',0);%
% %subplot(4,4,7), plot(tall,v_H_Pyr_in,'g'); legend('v_{Pyr-in}',0);%
% subplot(3,8,8), plot(tall,v_H_P_in + v_H_ED_in + v_H_Na_P_in  + v_H_K_P_in + v_H_syn_in + v_H_Phos_in,'k'); legend('cyt. H-Bilanz',0);%
% 
% subplot(3,8,9), plot(tall,v_H_P_mito,'r'); legend('v_{H-Pumpe-mito}',0);%
% subplot(3,8,10), plot(tall,v_H_ED_mito,'b'); legend('v_{H-ED-mito}',0);%
% subplot(3,8,11), plot(tall,v_H_Na_P_mito,'b'); legend('v_{H-Na-P-mito}',0);%
% subplot(3,8,12), plot(tall,v_H_K_P_mito,'b'); legend('v_{K_P-mito}',0);%
% subplot(3,8,13), plot(tall,v_H_syn_mito,'b'); legend('v_{H-syn-mito}',0);%
% subplot(3,8,14), plot(tall,v_H_Phos_mito,'b'); legend('v_{H-Phos-mito}',0);%
% %subplot(4,4,15), plot(tall,v_H_Pyr_mito,'g'); legend('v_{Pyr-mito}',0);%
% subplot(3,8,16), plot(tall,v_H_P_mito + v_H_ED_mito +  v_H_Na_P_mito + v_H_K_P_mito + v_H_syn_mito + v_H_Phos_mito,'k'); legend('mito. H-Bilanz',0);%
% 
% subplot(3,8,17), plot(tall,I_Na_ED,'b'); legend('I_{Na-ED}',0);%
% subplot(3,8,18), plot(tall,I_Na_P,'r'); legend('I_{Na-P}',0);%
% subplot(3,8,19), plot(tall,I_Na_ED+I_Na_P,'k'); legend('I_{Na}',0);%
% 
% subplot(3,8,21), plot(tall,I_K_ED,'b'); legend('I_{K-ED}',0);%
% subplot(3,8,22), plot(tall,I_K_P,'r'); legend('I_{K-P}',0);%
% subplot(3,8,23), plot(tall,I_K_ED+I_K_P,'k'); legend('I_{K}',0);%

toc