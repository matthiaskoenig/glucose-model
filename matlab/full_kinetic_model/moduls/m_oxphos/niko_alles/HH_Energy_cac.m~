%HH_Energie_oxi_2.m

%function [V_omni_CAC, V_PYR_CAC, V_CAC, V_mito_omni_Cac, V_rest_CAC, v_P_in_CAC, v_shuttle_CAC, v_CO2_CAC]=HH_Energy_CAC(t,x,z);

function [V_Cit_Lys,...
          V_omni,...
          V_CAC,...
          v_Pyr_in,...
          V_NAD_mito_cac,...
          V_Rest,...  
          V_beta,...  
          V_Car_shuttle,...  
          V_keto,... 
          v_dummy1...
         ] = HH_Energy_CAC(t,x,z);
     
% test_mat = x;
% test_mat([11, 60]) = 1;
% if any(test_mat<0)
%     for k=1:length(test_mat)
%         if test_mat(k)<0
%             if abs(x(k)) >1E-10
%                 warning('abs(x(k)) >1E-5')
%                 k
%                 x(k)
%                 x(k) = 1e-15;
%                 t
%             end
%         end
%     end
% end

% test_mat = x;
% if  any(~isreal(test_mat))
%     for k=1:length(test_mat)
%         if ~isreal(test_mat(k)) 
%             k
%             x(k)
%             x(k) = 1e-15;
%             t
%             error('imaginary')
%         end
%     end
% end    
     
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%     V_Cit_Lys        %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Cit_in        = x(76);
AcCoA_in      = x(77);
Mal_CoA_in    = x(78);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%   V_omni    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

NAD_in        = x(79);
NADH_in       = x(80);
Oxa_in        = x(81);
Isocit_in     = x(82);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%   V_CAC   %%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pyr_mito      = x(83);
AcCoA_mito    = x(84);
Cit_mito      = x(85);
IsoCit_mito   = x(86);
a_keto_mito   = x(87);
SucCoA_mito   = x(88);
Suc_mito      = x(89);
Fum_mito      = x(90);
Mal_mito      = x(91);
Oxa_mito      = x(92);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%    V_Rest        %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pyr_in       = x(93);

NAD_mito     = x(94);
NADH_mito    = x(95);

GTP_mito     = x(96); 
GDP_mito     = x(97);

k_drain      = x(98);
free1        = x(99);

P_mito       = x(100);

Gluta_mito   = x(101);

Asp_mito     = x(102);
Asp_in       = x(103);
Gluta_in     = x(104);
Mal_in       = x(105);
a_keto_in    = x(106);

CO2          = x(107);
CoA_mito     = x(108);

ATP_mito     = x(109); 
ADP_mito     = x(110);

ACoADh_FAD   = x(111);
ACoADh_FADH2 = x(112);

ETP_FAD      = x(113);
ETP_FADH2    = x(114);

ETFP_ox      = x(115);
ETFP_red     = x(116);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%   V_beta    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

C4_CoA       = x(117);
C6_CoA       = x(118);
C8_CoA       = x(119);
C10_CoA      = x(120);
C12_CoA      = x(121);
C14_CoA      = x(122);
C16_CoA      = x(123);

E_C4_CoA     = x(124);
E_C6_CoA     = x(125);
E_C8_CoA     = x(126);
E_C10_CoA    = x(127);
E_C12_CoA    = x(128);
E_C14_CoA    = x(129);
E_C16_CoA    = x(130);

L_C4_CoA     = x(131);
L_C6_CoA     = x(132);
L_C8_CoA     = x(133);
L_C10_CoA    = x(134);
L_C12_CoA    = x(135);
L_C14_CoA    = x(136);
L_C16_CoA    = x(137);

K_C4_CoA     = x(138);
K_C6_CoA     = x(139);
K_C8_CoA     = x(140);
K_C10_CoA    = x(141);
K_C12_CoA    = x(142);
K_C14_CoA    = x(143);
K_C16_CoA    = x(144);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%     V_Car_shuttle     %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

C16_CoA_cyt  = x(145);
C16_Car_cyt  = x(146);
Car_cyt      = x(147);
CoA_cyt      = x(148);
C16_Car_mito = x(149);
Car_mito     = x(150);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%    V_keto     %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S3H3MG_CoA_mito = x(151);
AcAc_mito       = x(152);
R3HBut_mito     = x(153);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dummy1 =  x(154);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%H_mito = 4e-5; % konz. in mM
%H_in = 1e-4; % konz in mM


%Konstanten
F=96490.0;  % C/mol
R=8.3;      % J/K*mol
T=293.0;    % K


% if z == 0;
%     p = 1;%z*(1- 1./(exp((t-250)/50)+1));%4+5./(exp((t-30)/5)+1);;;% 3+5./(exp((t-30)/5)+1);
% else
%     p=1+z;
% end

p = 3.8;
v_k_drain = 1e15*(p-k_drain);

Ca = 0.05 + (k_drain-1)*2.5;

%v_free1      = 1e25*( (min(0.5,t/500)*(t<2000) + max(0,0.5-(t-2000)/500)*(t>2000))*(z==1) - free1);
%v_free1      = 1e25*(min(1,t/200)*(z==1) + max(0,1-t/200)*(z==0) - free1);
%zzz = (1-z)*min((t/2000),1);

%v_free1     = 1e15*(zzz - free1);
v_free1     = 5e-3*(z - free1);

v_dummy1 = z;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pyruvatedehydrogenase complex
% Pyr_mito + CoA + NAD -> AcCoA + Co2 + NADH
v_pdhc = 20*Pyr_mito/(0.017 + Pyr_mito)*NAD_mito/(NAD_mito + 0.036)*CoA_mito/(0.0047 + CoA_mito); %Kinetic Properties of the Partially Purified Pyruvate Dehydrogenase Complex of Ox Brain

%v_pdhc = Pyr_mito/(Pyr_mito + ?)*NAD_mito/(NAD_mito + 0.033)*CoA_mito/(CoA_mito + 0.004); Kinetic and spectral investigation of allosteric interaction ofcoenzymes with 2-oxo acid dehydrogenase complexes (Strumillo...)%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Citrate synthase (Regulation of CAC)(ATP,ADP) 
% Oxa + AcCoA + H20 <-> Cit + CoA + H+
K_eq_cs = 2.03e5;
%v_cs = 1.6*1e4*(Oxa_mito*AcCoA_mito)/( (1 + Oxa_mito/0.002)*(1 + AcCoA_mito/0.016) + (1 + Cit_mito/0.42)*(1 + CoA_mito/0.07) -1);
v_cs = 40*Oxa_mito/(0.0361 + Oxa_mito)*AcCoA_mito/(0.016 + AcCoA_mito);
%v_cs = 1e-5*(Oxa_mito*AcCoA_mito - 1/K_eq_cs*Cit_mito*CoA_mito)/( (0.002 + Oxa_mito)*(0.016 + AcCoA_mito) + (0.42 + Cit_mito)*(0.07 + CoA_mito) -1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Aconitase (fast?)
% Cit <-> IsoCit
K_eq_ac = 0.05;%0.067;
v_ac = 1e7*(Cit_mito - IsoCit_mito/K_eq_ac)/(1 + Cit_mito/0.45 + IsoCit_mito/0.1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% NAD-dependent isocitrate dehydrogenas (Regulation of CAC)
% IsoCit + NAD -> a_keto + NADH + Co2 (ADP, NAD, Cit) (allosteric properties of ox brain nicotinamide- ...(willson, tipton))
%Regulation of NAD-linked isocitrate dehydrogenase and 2-oxogluterate dehydrogenas by Ca ions within... (Rutter, Denton) %
%K_m_iso_icdg = 0.7./(NAD_mito.^0.3).*(1-ADP_mito./(ADP_mito + 0.8)).*(1-Cit_mito./(Cit_mito + 2.11));
K_m_iso_icdg = 0.24*(1.5-Ca/(Ca+0.5))*(1.5-ADP_mito./(ADP_mito+0.1));
K_m_nad_icdh = 0.051;%0.1*(1-IsoCit_mito.^1.8./(IsoCit_mito.^1.8 + 1.^1.8))*(1+NADH_mito/0.0041);

%v_icdh = drain*15*IsoCit_mito^2./(IsoCit_mito.^2 + K_m_sio_icdg^2)*NAD_mito/(NAD_mito + K_m_nad_icdh);

v_icdh = 20*IsoCit_mito^2./(IsoCit_mito.^2 + K_m_iso_icdg^2)*NAD_mito/(NAD_mito + K_m_nad_icdh);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a_keto + NAD + CoA -> SucCoA + CO2 + NADH (Activation:ADP, Pi, Ca, inhibition: TTP, xXx-CoA, SucCoA, ATP, NADH, ADP)
% (Inactivation of beef brain Alpha-Ketogluterate dehydrogenase complex by ...(luder, Parks, ...))
% (Kinetic and spectral investigation of allosteric interaction of coenzymes ... (Strumilo))
% (primary Regulation of CAC ()alpha-ketogluterate dehydrogenase: a target ... (Tretter) )
% (Regulation of mitochondrial a-Ketogluterate metabolism by product inhibiton at ...(Smith, ...))

%f_Ca = 1-Ca./(Ca + 0.03);
f_Ca = 1.5-Ca./(Ca + 0.5);
f_NAD = 1+NADH_mito./(0.0127*(NAD_mito./(NAD_mito + 0.0053)));
f_ADP = 1-ADP_mito./(ADP_mito + 0.45.*(1+ATP_mito/1));
f_Pi = 1-P_mito./(P_mito + 5);

K_akdhc =  2*f_Ca;%2*f_Ca;%1.3.*f_Ca.*f_NAD.*f_ADP.*f_Pi;

v_akdhc = 50*a_keto_mito./(a_keto_mito + K_akdhc)*NAD_mito./(NAD_mito + 0.021*(1+NADH_mito/0.0045)).*CoA_mito./(CoA_mito + 0.0013*(1 + SucCoA_mito/0.004));%NAD_mito./(NAD_mito + 0.021*(1+NADH_mito/0.0045));
%v_akdhc = 0.35*NAD_mito./(NAD_mito + 0.021*(1+NADH_mito/0.0045));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SucCoA + ADP/GDP + P <-> Succ + CoA + ATP/ADP 
%Succinyl-CoA Synthetase is a phosphate target for the activation of mitochondrial metabolism (Phillios, Aponte ...)% 
%Characterization of the ATP- and GTP-specific Succinyl_CoA Synthetase in Pigeon (Johnson, Muhonen, Lambeth)%
%Rekation of ATP- and GTP-specific Succinyl_CoA Synthetase in Pigeon brain: 1:1 %


K_eq_suc = 3.8;

f_P_suc_atp = (1 + 1.2*P_mito.^3./(P_mito.^3 + 2.5^3));
v_succoas_atp = 50*f_P_suc_atp /(0.041*0.25*0.72) * (SucCoA_mito*ADP_mito*P_mito - 1/K_eq_suc*Suc_mito*CoA_mito*ATP_mito)/((1 + SucCoA_mito/0.041)*(1 + ADP_mito/0.25)*(1 + P_mito/0.72) + (1 + Suc_mito/5.1)*(1 + CoA_mito/0.036)*(1 + ATP_mito/0.055) -1 );
            
f_P_suc_gtp = (1 + 1.2*P_mito.^3./(P_mito.^3 + 2.5^3));            
v_succoas_gtp = 50*f_P_suc_gtp/(0.086*0.007*2.26) * (SucCoA_mito*GDP_mito*P_mito - 1/K_eq_suc*Suc_mito*CoA_mito*GTP_mito)/((1 + SucCoA_mito/0.086)*(1 + GDP_mito/0.007)*(1 + P_mito/2.26) + (1 + Suc_mito/0.49)*(1 + CoA_mito/0.036)*(1 + GTP_mito/0.036) -1 );     
            
v_succoas = v_succoas_atp + v_succoas_gtp;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Succ + QH -> Fum +QH2 ?
v_succdh = 14*Suc_mito/(Suc_mito + 1.6);%*(1.7 - Oxa_mito/(Oxa_mito + 0.01));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fum + H20 <-> Mal
K_eq_fum = 4.4;
v_fum = 2e7*(Fum_mito - 1/K_eq_fum*Mal_mito)/(1 + Fum_mito/(0.14) + Mal_mito/(0.3));          

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Mal + NAD <-> Oxa +NADH
K_eq_mdh = 1e-3; %?????????????????????????!!!!!!!!!!!!!!!!!??????????????
v_mdh = 1e5*(Mal_mito*NAD_mito-1/K_eq_mdh*Oxa_mito*NADH_mito)/( (1 + Mal_mito/1.4)*(1 + NAD_mito/0.1) + (1 + Oxa_mito/0.04)*(1 + NADH_mito/0.05) -1 );

% (ADP)(GTP) / (ATP)(GDP) konstant bei 70 (Regulation of mitochondrial a-Ketogluterate metabolism by product inhibiton at ...(Smith, ...))




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% MALATE-ASPARTAE SHUTTLE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Mal_in + NAD_in <-> Oxa_in +NADH_in
K_eq_mdh = 1e-2; %?????????????????????????!!!!!!!!!!!!!!!!!??????????????
v_mdh_in = 1e10*(Mal_in*NAD_in-1/K_eq_mdh*Oxa_in*NADH_in)/( (1 + Mal_in/1.4)*(1 + NAD_in/0.1) + (1 + Oxa_in/0.04)*(1 + NADH_in/0.05) -1 );

%Amino??transferase: AAT: ASP + a_keto <-> Oxa + Gluta
K_eq_AAT = 0.147; %An investigation of the equilibrium of the reaction {l-aspartate(aq) + 2-oxoglutarate(aq) = oxaloacetate(aq) + l-glutamate(aq)} , KISHORE N. (1) ; TEWARI Y. B. (1) ; GOLDBERG R. N. ,Journal of chemical thermodynamics%

v_AAT_mito = 0;%1e3*(Asp_mito*a_keto_mito - 1/K_eq_AAT*Oxa_mito*Gluta_mito);
v_AAT_in   = 0;%1e3*(Asp_in*a_keto_in - 1/K_eq_AAT*Oxa_in*Gluta_in);

%Aspartate-Glutamate carrier: Asp_mito + Gluta_cyt -> Asp_cyt + Gluta_mito
v_Asp_Gluta = 0;%3*NAD_mito/NADH_mito*(Asp_mito.*Gluta_in - 1/100*Asp_in.*Gluta_mito);

%Malate-a_keto-carrier: Mal_cyt + a_keto_mito -> Mal_mito + a_keto_cyt
v_Mal_a_keto = 0;%3*NAD_mito/NADH_mito*(Mal_in.*a_keto_mito - Mal_mito.*a_keto_in);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%    Lipidtransport %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Carnitinpalmitoyltransferase 1 (inhibiert durch Malonyl-CoA und Hauptregulationspunkt f�r Acetyl-CoA Eintritt in Mitochondrien (Bartlett, Eaton: Mitochondrial beta-oxidation))
% C16-CoA_cyt + Car_cyt -> C16-Car_cyt + CoA_cyt
v_CPT1  = 10*1e-2*23*C16_CoA_cyt./(C16_CoA_cyt + 0.02).*Car_cyt./(Car_cyt + 0.1)*(1-min(1,Mal_CoA_in/0.00007)); % Effects of Fasting and MalonylCoa on the Kinetics of carnitin ...(Saggerson, Carpenter), Dissertation
%v_CPT1  = 4*1e-2*23*C16_CoA_cyt/(C16_CoA_cyt + 0.02*(1+Mal_CoA_in/0.0027)).*Car_cyt/(Car_cyt + 0.1);
%*.(1+Mal_CoA_in/0.0027)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Carnitin-AcylCarnitintranslocase
% C16-Car_cyt + Car_mito -> C16-Car_mito + Car_cyt
%v_CACT = 5e-1*Car_mito/(Car_mito + 1.8).*C16_Car_cyt/(C16_Car_cyt + 1); % Enhancement of Mitochondrial Carnitin and Carnitin AcylCarnitin Translocase-mediates... (Parvin,Pande)
%v_CACT = 5e-1*Car_mito/(Car_mito + ?).*C16_Car_cyt/(C16_Car_cyt + 0.002); %Mechanism of Carnitine Acylcarnitine Translocase-catalyzed Import of Acylcarnitines into Mitochondria   (Murthy, Pande) %

v_CACT = 5e-1*23*Car_mito/(Car_mito + 0.1).*C16_Car_cyt/(C16_Car_cyt + 0.2);%.*(C16_Car_cyt>1e-4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Carnitinpalmitoyltransferase 2
% C16-Car_mito + CoA_mito -> C16-CoA_mito + Car_mito
KeqCPT2 = 0.7;
%v_CPT2 = (C16_Car_mito*CoA_mito - 1/KeqCPT2*C16_CoA_mitoCar_mito)/((C16_Car_mito + 0.1)*(CoA_mito + 0.01) +(C16_CoA_mito + 0.007)*(Car_mito + ) -1); % ??????? Reines Raten!!!1
v_CPT2 = 10*23*1e-2*C16_Car_mito./(C16_Car_mito + 0.1).* CoA_mito./(CoA_mito + 0.01);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% beta-oxidation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Short-chain Acyl-CoA-Dehydrogenase
% C4_CoA -> T_C4_CoA 
v_C4_CoA_SC = 23*30*3e-5*1000*C4_CoA./(C4_CoA + 0.01); % Biochemical and Electrochemical Characterization of two variant human ....(Saenger, Nguyen, Vockley, Stankovich)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Medium-Chain Enoyl-CoA Hydratase 

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
% v_E_hyd_C16_CoA_MC = 30*3e-4*40*E_C16_CoA./(E_C16_CoA + 0.0055); % Intermediate channeling on the trifunctional beta-oxidation complex from pig heart mitochondria (Yao, Schulz)     %

% % T_C4_CoA -> L_C4_CoA
% v_T4_CoA_MC = 148*T4_CoA/(T4_CoA + 0.02);  %Enoyl Coenzyme A Hydratase (Crotonase)
% % T_C6_CoA -> L_C6_CoA
% v_T6_CoA_MC = 67*T6_CoA/(T6_CoA + 0.24);   %Enoyl Coenzyme A Hydratase (Crotonase)
% % T_C8_CoA -> L_C8_CoA
% v_T8_CoA_MC = 36*T8_CoA/(T8_CoA + 0.28);   %Enoyl Coenzyme A Hydratase (Crotonase)
% % T_C10_CoA -> L_C10_CoA
% v_T10_CoA_MC = 17*T10_CoA/(T10_CoA + 0.3); %Enoyl Coenzyme A Hydratase (Crotonase)
% % T_C12_CoA -> L_C12_CoA
% v_T12_CoA_MC = 7*T12_CoA/(T12_CoA + 0.4);  %Enoyl Coenzyme A Hydratase (Crotonase)
% % T_C14_CoA -> L_C14_CoA
% v_T14_CoA_MC = 2*T14_CoA/(T14_CoA + 0.42); %Enoyl Coenzyme A Hydratase (Crotonase)
% % T_C16_CoA -> L_C164_CoA
% v_T16_CoA_MC = 1*T16_CoA/(T14_CoA + 0.5);  %Enoyl Coenzyme A Hydratase (Crotonase)

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%3-Hydroxyacyl-CoA dehdrogenase

% L_C4_CoA + NAD <-> K_C4_CoA + NADH
% v_L_C4_CoA = L_C4_CoA/(L_C4_CoA + 0.025)*NAD/(NAD+0.1);  %eigentlich reversible K_eq=?; Role of short chain hydroxyacyl CoA dehydrogenase in .... (Filling, Keller, ...)

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

% L_C4_CoA + NAD <-> K_C4_CoA + NADH
v_3HdH_C4_CoA = 1e3*23*(L_C4_CoA.*NAD_mito - 1/100*K_C4_CoA.*NADH_mito)./((1 + L_C4_CoA/0.0699).*(1 + NAD_mito/0.0585) + (1 + K_C4_CoA/0.0169).*(1 + NADH_mito/0.0054) - 1); %Purification and Properties of Mitochondrial and Peroxisaml 3-Hydroxyacyl-CoA... (Osumi, Hashimoto)
% L_C6_CoA + NAD <-> K_C6_CoA + NADH
v_3HdH_C6_CoA = 1e3*23*(L_C6_CoA.*NAD_mito - 1/100*K_C6_CoA.*NADH_mito)./((1 + L_C6_CoA/0.0286).*(1 + NAD_mito/0.0585) + (1 + K_C6_CoA/0.02).*(1 + NADH_mito/0.0054) - 1); %Purification and Properties of Mitochondrial and Peroxisaml 3-Hydroxyacyl-CoA... (Osumi, Hashimoto)
% L_C8_CoA + NAD <-> K_C8_CoA + NADH
v_3HdH_C8_CoA = 1e3*23*(L_C8_CoA.*NAD_mito - 1/100*K_C8_CoA.*NADH_mito)./((1 + L_C8_CoA/0.0163).*(1 + NAD_mito/0.0585) + (1 + K_C8_CoA/0.02).*(1 + NADH_mito/0.0054) - 1);%Purification and Properties of Mitochondrial and Peroxisaml 3-Hydroxyacyl-CoA... (Osumi, Hashimoto)
% L_C10_CoA + NAD <-> K_C10_CoA + NADH
v_3HdH_C10_CoA = 1e3*23*(L_C10_CoA.*NAD_mito - 1/100*K_C10_CoA.*NADH_mito)./((1 + L_C10_CoA/0.0088).*(1 + NAD_mito/0.0585) + (1 + K_C10_CoA/0.02).*(1 + NADH_mito/0.0054) - 1);%Purification and Properties of Mitochondrial and Peroxisaml 3-Hydroxyacyl-CoA... (Osumi, Hashimoto)
% L_C12_CoA + NAD <-> K_C12_CoA + NADH
v_3HdH_C12_CoA = 1e3*23*(L_C12_CoA.*NAD_mito - 1/100*K_C12_CoA.*NADH_mito)./((1 + L_C12_CoA/0.0088).*(1 + NAD_mito/0.0585) + (1 + K_C12_CoA/0.02).*(1 + NADH_mito/0.0054) - 1); %???
% L_C14_CoA + NAD <-> K_C14_CoA + NADH
v_3HdH_C14_CoA = 1e3*23*(L_C14_CoA.*NAD_mito - 1/100*K_C14_CoA.*NADH_mito)./((1 + L_C14_CoA/0.0088).*(1 + NAD_mito/0.0585) + (1 + K_C14_CoA/0.02).*(1 + NADH_mito/0.0054) - 1); %???
% L_C16_CoA + NAD <-> K_C16_CoA + NADH
v_3HdH_C16_CoA = 1e4*23*(L_C16_CoA.*NAD_mito - 1/100*K_C16_CoA.*NADH_mito)./((1 + L_C16_CoA/0.003).*(1 + NAD_mito/0.0145) + (1 + K_C16_CoA/0.02).*(1 + NADH_mito/0.0054) - 1); %???

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3-ketoacyl-CoA-thiolase (eigentl. reverssibel) % acyl-CoA thiolase

% K_C4_CoA + CoA -> AcCoA + AcCoA;
%v %Crystallographic and Kinetic Studies of Human Mitochondrial Acetoacetyl-CoA Thiolase ....(Haapalainen)
%v_3KT_C4 = 23*30*3e-1*CoA_mito./(CoA_mito + 0.05).*K_C4_CoA./(K_C4_CoA +0.006);
%keq_3KT_C4 = 10^(26.94/5.7); % K�mmel dg0 = 26.94;
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v_CPT1 = v_CPT1;%*(1+z);
v_CACT = v_CACT;%*(1+z);
v_CPT2 = v_CPT2;%*(1+z);

v_C4_CoA_SC  = v_C4_CoA_SC;%*(1+z); 
v_C6_CoA_MC  = v_C6_CoA_MC;%*(1+z);
v_C8_CoA_MC  = v_C8_CoA_MC;%*(1+z);
v_C10_CoA_LC = v_C10_CoA_LC;%*(1+z);
v_C12_CoA_LC = v_C12_CoA_LC;%*(1+z); 
v_C14_CoA_LC = v_C14_CoA_LC;%*(1+z); 
v_C16_CoA_LC = v_C16_CoA_LC;%*(1+z);

v_E_hyd_C4_CoA_MC  = v_E_hyd_C4_CoA_MC;%*(1+z);
v_E_hyd_C6_CoA_MC  = v_E_hyd_C6_CoA_MC;%*(1+z);
v_E_hyd_C8_CoA_MC  = v_E_hyd_C8_CoA_MC;%*(1+z);
v_E_hyd_C10_CoA_MC = v_E_hyd_C10_CoA_MC;%*(1+z);
v_E_hyd_C12_CoA_MC = v_E_hyd_C12_CoA_MC;%*(1+z);
v_E_hyd_C14_CoA_MC = v_E_hyd_C14_CoA_MC;%*(1+z);
v_E_hyd_C16_CoA_MC = v_E_hyd_C16_CoA_MC;%*(1+z);

v_3HdH_C4_CoA  = v_3HdH_C4_CoA;%*(1+z);
v_3HdH_C6_CoA  = v_3HdH_C6_CoA;%*(1+z);
v_3HdH_C8_CoA  = v_3HdH_C8_CoA;%*(1+z);
v_3HdH_C10_CoA = v_3HdH_C10_CoA;%*(1+z);
v_3HdH_C12_CoA = v_3HdH_C12_CoA;%*(1+z);
v_3HdH_C14_CoA = v_3HdH_C14_CoA;%*(1+z);
v_3HdH_C16_CoA = v_3HdH_C16_CoA;%*(1+z);

v_3KT_C4  = v_3KT_C4;%*(1+z);
v_3KT_C6  = v_3KT_C6;%*(1+z);
v_3KT_C8  = v_3KT_C8;%*(1+z);
v_3KT_C10 = v_3KT_C10;%*(1+z);
v_3KT_C12 = v_3KT_C12;%*(1+z);
v_3KT_C14 = v_3KT_C14;%*(1+z);
v_3KT_C16 = v_3KT_C16;%*(1+z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Ketone bodyy formation %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%HMG-CoA-Synthase 
%Bi Bi Ping Pong mechanism:  [A][B]->...; v = [A][B]/(KmA[B](1+[B]/Ki)+KmB[A]+[A][B]) %Human Cytoplasmic 3-Hydroxy-3methylglutaryl Coenzyme A Synthase: Expression, Purification .... % %
%acetyl-CoA + H2O + acetoacetyl-CoA -> (S)-3-hydroxy-3-methylglutaryl-CoA + CoA	
%AcCoA_mito + K_C4_CoA -> S3H3MG_CoA_mito + CoA_mito : inhibiert durch SucCoA, Glucagon (gamma) (Glucagon activates mitochondrial 4-hydroxy-3-methylglutaryl-CoA synthase in vivo by decreasing the extend of succinylation of the enzym)  %

v_HMG_CoA_synthase = 1e-3*(AcCoA_mito.*K_C4_CoA./( 0.00035*(1+K_C4_CoA/0.012).*AcCoA_mito + 0.029*K_C4_CoA + AcCoA_mito.*K_C4_CoA)); %Human Cytoplasmic 3-Hydroxy-3methylglutaryl Coenzyme A Synthase: Expression, Purification ....; Interrelation between 3-Hydroxy-�-Methylglutaryl-CoA Synthase ,Acetoacetyl-CoA and Ketogenesis %
%.*(1-SucCoA_mito./(SucCoA_mito + 0.001))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%HMG-CoA-Lyase inhibiert durch AcAc ????
%(S)-3-Hydroxy-3-methylglutaryl-CoA -> acetyl-CoA + acetoacetate  %
%S3H3MG_CoA_mito -> AcCoA_mito + AcAc_mito

v_HMG_CoA_lyase = 1e-3*S3H3MG_CoA_mito./(S3H3MG_CoA_mito + 0.048); % Evaluation of 3-Hydroxy-3-methylglutaryl-Coenzyme A Lyase Arginine-41 as a Catalytic Residue: Use .... %  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% b-Hydroxybutyrate dehydrogenase
%acetoacetate + NADH + H <-> (R)-3-hydroxybutanoate + NAD
%AcAc_mito + NADH_mito <-> R3HBut_mito + NAD_mito
%dg = 15.7424; Jankowski 

v_bHBDH = (AcAc_mito.*NADH_mito - 1/(10.^(15.7424/5.7))*R3HBut_mito.*NAD_mito)./((1 + NADH_mito/0.017*(1+NAD_mito/0.121)).*(1 + AcAc_mito/0.204) + (1 + R3HBut_mito/1.604).*(1 + NAD_mito/0.067*(1+NADH_mito/0.066)) - 1); %The Kinetics of Rat Liver and Heart Mitochondrial beta-Hydroxybuterate Dehydrogenase %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ketonebodyexport

v_AcAc_mito_ex   = 1e1*(AcAc_mito./(AcAc_mito + 0.1));
v_R3HBut_mito_ex = 1e1*(R3HBut_mito./(R3HBut_mito + 0.1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% MALATE-CITRATE EXCHANGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Citrate-Malate-Exchanger
%Mal_in + Cit_mito <-> Mal_mito + Cit_in
% Keq =???? abh�ngig von ph-wert !!!! to do
v_Cit_Mal = 1e1*(Cit_mito.*Mal_in - 0.1*Cit_in.*Mal_mito)./( (1 + Cit_mito/0.13).*(1 + Mal_in/0.78) + (1+Cit_in/0.13).*(1+Mal_mito/0.78) -1 );

%ATP-Citrate-lyase1
%Cit_in + CoA_in + ATP_in -> AcCoA_in + Oxa_in + ADP_in + Pi
ATP_in = 3;
g=1; % Phosphorylation state: g = 1 hei�t v�llig phosphoryliert
%v_Cit_Lys_p  = (    g*5*(Cit_in.^0.65./(Cit_in.^0.65 + 0.154^0.65)*3.5.*ATP_in./(ATP_in + 0.041).*CoA_cyt./(CoA_cyt + 0.0026))); %Phosphorylation of recombinant human ATP: CItrate Lyase by cAMP-Dependent  ... %
%v_Cit_Lys_np = ((1-g)*1*(Cit_in./(Cit_in + 0.104)                     .*ATP_in./(ATP_in + 0.041).*CoA_cyt./(CoA_cyt + 0.002)));   %Phosphorylation of recombinant human ATP: CItrate Lyase by cAMP-Dependent  ... %
%v_Cit_Lys = 1e-3*(v_Cit_Lys_p + v_Cit_Lys_np);
v_Cit_Lys = 1e-3*(Cit_in./(Cit_in + 0.104).*ATP_in./(ATP_in + 0.041).*CoA_cyt./(CoA_cyt + 0.002));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Acetyl-CoA carboxylase (inhibiert durch MalonylCoA (Ki~0.009) und
%PalmitoylCoA (Ki~0.0008); Aktiviert durch Citrate !!!!!!!!!!!! to do)(Phosphorylierbar !!!!!!!!!!!! to do)
%AcCoA_in + ATP_in + HO3 -> Mal_COA_in + ADP +Pi
v_AcCoAcarb = 1e-1*ATP_in./(ATP_in + 0.12).*AcCoA_in./(AcCoA_in + 0.058).*(1-Mal_CoA_in./(Mal_CoA_in + 0.009)); %Expresion, purification, and characterization of human and rat acetyl coenzyme A carboxylase (ACC) isoenzymes %

%(1 + 2.5*Cit_in.^1.5./(Cit_in.^1.5 + 0.05)).*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Malonyl-CoA decarboxylase
%Mal_CoA_in -> AcCoA_in + Co2
v_Mal_CoA_dc = 0;%1e-1*Mal_CoA_in./(Mal_CoA_in + 0.36); %Expression, purification, and characterizatin of human malonyl-CoA decarboxylase

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MalonylCoA-Verbrauch

v_Mal_CoA_use = 1e-1*Mal_CoA_in./(Mal_CoA_in + 0.01);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Hormonelle Regulation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

v_pdhc      = v_pdhc*(1-min(1,free1));
%v_CPT1      = v_CPT1*(free1);

%v_AcCoAcarb   = 5e2*v_AcCoAcarb*(1-min(0.1,free1));%(1-1.3*free1);
%v_Mal_CoA_use = v_Mal_CoA_use*(1 + free1*99); 

v_Cit_Lys = v_Cit_Lys*(1-min(1,free1));%*(1 - (AcCoA_in > 0.01));

%v_Mal_CoA_dc = v_Mal_CoA_dc*(1 + 2*free1);

v_HMG_CoA_synthase = 0;%*v_HMG_CoA_synthase; %aktiviert durch Glucagon?


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

v_GTP = 0;
v_GDP = 0;

v_ATP = 0;
v_ADP = 0;

v_PYR = 0;

v_Pyr_mito   = 0; 

v_pdhc      = v_pdhc;%*(1+z);%;
v_cs        = v_cs;%*(1+z);
v_ac        = v_ac;%*(1+z);
v_icdh      = v_icdh;%*(1+z);%;
v_akdhc     = v_akdhc;%*(1+z);%;
v_succoas   = v_succoas;%*(1+z);
v_succdh    = v_succdh;%*(1+z);
v_fum       = v_fum;%*(1+z);
v_mdh       = v_mdh;%*(1+z);


v_Cit_mito        = v_cs - v_ac - v_Cit_Mal;
v_IsoCit_mito     = v_ac - v_icdh;
v_a_keto_mito     = v_icdh - v_akdhc - v_AAT_mito - v_Mal_a_keto;
v_SucCoA_mito     = v_akdhc - v_succoas;
v_Suc_mito        = v_succoas - v_succdh;
v_Fum_mito        = v_succdh - v_fum;
v_Mal_mito        = v_fum - v_mdh + v_Mal_a_keto + v_Cit_Mal;
v_Oxa_mito        = v_mdh  - v_cs + v_AAT_mito;


v_Pyr_in     = 0;

v_GTP_mito   = 0; 
v_GDP_mito   = 0;

v_P_mito = v_GDP_mito;

v_Gluta_mito = 0;%v_AAT_mito + v_Asp_Gluta;
v_Asp_mito   = 0;%- v_AAT_mito - v_Asp_Gluta;

v_CO2 = 0;

v_Asp_in     = 0;%- v_AAT_in + v_Asp_Gluta;
v_a_keto_in  = 0;%- v_AAT_in + v_Mal_a_keto;

v_Gluta_in   = 0;%v_AAT_in - v_Asp_Gluta;

v_Oxa_in   =  + v_Cit_Lys + v_mdh_in;% + v_AAT_in;
v_Mal_in   =  - v_Cit_Mal - v_mdh_in;% - v_Mal_a_keto;

v_ATP_mito = 0;
v_ADP_mito = 0;

v_NAD_in   = 0;
v_NADH_in  = 0;

v_Cit_in = + v_Cit_Mal - v_Cit_Lys;
v_AcCoA_in = + v_Cit_Lys - v_AcCoAcarb + v_Mal_CoA_dc;

v_Isocit_in = 0;

v_Mal_CoA_in = + v_AcCoAcarb - v_Mal_CoA_use - v_Mal_CoA_dc;

v_ACoADh_FAD   = 0;
v_ACoADh_FADH2 = 0;

v_ETP_FAD      = 0;
v_ETP_FADH2    = 0;

v_ETFP_ox      = 0;
v_ETFP_red     = 0;

v_C4_CoA       = - v_C4_CoA_SC + v_3KT_C6;
v_C6_CoA       = - v_C6_CoA_MC + v_3KT_C8;
v_C8_CoA       = - v_C8_CoA_MC + v_3KT_C10;
v_C10_CoA      = - v_C10_CoA_LC + v_3KT_C12;
v_C12_CoA      = - v_C12_CoA_LC + v_3KT_C14;
v_C14_CoA      = - v_C14_CoA_LC + v_3KT_C16;
v_C16_CoA      = + v_CPT2 - v_C16_CoA_LC; 

v_E_C4_CoA     = + v_C4_CoA_SC - v_E_hyd_C4_CoA_MC ;
v_E_C6_CoA     = + v_C6_CoA_MC - v_E_hyd_C6_CoA_MC;
v_E_C8_CoA     = + v_C8_CoA_MC - v_E_hyd_C8_CoA_MC;
v_E_C10_CoA    = + v_C10_CoA_LC - v_E_hyd_C10_CoA_MC;
v_E_C12_CoA    = + v_C12_CoA_LC - v_E_hyd_C12_CoA_MC;
v_E_C14_CoA    = + v_C14_CoA_LC - v_E_hyd_C14_CoA_MC;
v_E_C16_CoA    = + v_C16_CoA_LC - v_E_hyd_C16_CoA_MC;

v_L_C4_CoA     = + v_E_hyd_C4_CoA_MC - v_3HdH_C4_CoA;
v_L_C6_CoA     = + v_E_hyd_C6_CoA_MC - v_3HdH_C6_CoA;
v_L_C8_CoA     = + v_E_hyd_C8_CoA_MC - v_3HdH_C8_CoA;
v_L_C10_CoA    = + v_E_hyd_C10_CoA_MC - v_3HdH_C10_CoA;
v_L_C12_CoA    = + v_E_hyd_C12_CoA_MC - v_3HdH_C12_CoA;
v_L_C14_CoA    = + v_E_hyd_C14_CoA_MC - v_3HdH_C14_CoA;
v_L_C16_CoA    = + v_E_hyd_C16_CoA_MC - v_3HdH_C16_CoA;

v_K_C4_CoA     = + v_3HdH_C4_CoA - v_3KT_C4 - v_HMG_CoA_synthase;
v_K_C6_CoA     = + v_3HdH_C6_CoA - v_3KT_C6;
v_K_C8_CoA     = + v_3HdH_C8_CoA - v_3KT_C8;
v_K_C10_CoA    = + v_3HdH_C10_CoA - v_3KT_C10;
v_K_C12_CoA    = + v_3HdH_C12_CoA - v_3KT_C12;
v_K_C14_CoA    = + v_3HdH_C14_CoA - v_3KT_C14;
v_K_C16_CoA    = + v_3HdH_C16_CoA - v_3KT_C16;

v_C16_CoA_cyt  = 0;%- v_CPT1;
v_C16_Car_cyt  = + v_CPT1 - v_CACT ;
v_Car_cyt      = - v_CPT1 + v_CACT ;
v_CoA_cyt      = - v_Cit_Lys + v_Mal_CoA_use;%0;%+ v_CPT1 

v_C16_Car_mito =  - v_CPT2 + v_CACT ;
v_Car_mito     =  + v_CPT2 - v_CACT ;

v_CoA_mito     = - v_pdhc- v_akdhc + v_succoas + v_cs - v_3KT_C16 - v_3KT_C14 - v_3KT_C12 - v_3KT_C10 - v_3KT_C6 - v_3KT_C8 - v_3KT_C4 - v_CPT2    + v_HMG_CoA_synthase;%  
v_AcCoA_mito   =   v_pdhc                      - v_cs + v_3KT_C16 + v_3KT_C14 + v_3KT_C12 + v_3KT_C10 + v_3KT_C6 + v_3KT_C8 + v_3KT_C4 + v_3KT_C4  - v_HMG_CoA_synthase + v_HMG_CoA_lyase;%  % 

v_NADH_use = 0;%1.4*k_drain*5*NADH_mito./(NADH_mito + 1e-3);

v_NAD_mito   = - v_pdhc - v_mdh - v_akdhc - v_icdh   + v_NADH_use - v_3HdH_C4_CoA - v_3HdH_C6_CoA - v_3HdH_C8_CoA - v_3HdH_C10_CoA - v_3HdH_C12_CoA - v_3HdH_C14_CoA - v_3HdH_C16_CoA + v_bHBDH ; %
v_NADH_mito  = + v_pdhc + v_mdh + v_akdhc + v_icdh   - v_NADH_use + v_3HdH_C4_CoA + v_3HdH_C6_CoA + v_3HdH_C8_CoA + v_3HdH_C10_CoA + v_3HdH_C12_CoA + v_3HdH_C14_CoA + v_3HdH_C16_CoA - v_bHBDH ;%

v_S3H3MG_CoA_mito = + v_HMG_CoA_synthase - v_HMG_CoA_lyase;
v_AcAc_mito       = + v_HMG_CoA_lyase - v_bHBDH  - v_AcAc_mito_ex ;
v_R3HBut_mito     = + v_bHBDH - v_R3HBut_mito_ex;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scale_cac = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                

%76-78
V_Cit_Lys = [
             v_Cit_in
             v_AcCoA_in
             v_Mal_CoA_in 
            ]*scale_cac;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%            

%79-82
V_omni = [
          v_NAD_in 
          v_NADH_in 
          v_Oxa_in
          v_Isocit_in
         ]*scale_cac;
                                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 83-92:
V_CAC = [
         v_Pyr_mito   
         v_AcCoA_mito      
         v_Cit_mito        
         v_IsoCit_mito     
         v_a_keto_mito     
         v_SucCoA_mito     
         v_Suc_mito        
         v_Fum_mito        
         v_Mal_mito        
         v_Oxa_mito
        ]*scale_cac;
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        

%93:
v_Pyr_in = v_Pyr_in;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%94-95: 
V_NAD_mito_cac = [
                   v_NAD_mito   
                   v_NADH_mito
                  ]*scale_cac; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                  
%96-116:
V_Rest = [  
             
            v_GTP_mito   
            v_GDP_mito
            
            v_k_drain    
            v_free1
            
            v_P_mito
            
            v_Gluta_mito
            
            v_Asp_mito   
            v_Asp_in     
            v_Gluta_in    
            v_Mal_in     
            v_a_keto_in  
            
            v_CO2
            v_CoA_mito
            
            v_ATP_mito
            v_ADP_mito
           
                        
            v_ACoADh_FAD   
            v_ACoADh_FADH2 
            
            v_ETP_FAD    
            v_ETP_FADH2    
            
            v_ETFP_ox      
            v_ETFP_red  
            ]*scale_cac;
 

            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         

%117-144
V_beta = [
            v_C4_CoA      
			v_C6_CoA       
			v_C8_CoA       
			v_C10_CoA      
			v_C12_CoA      
			v_C14_CoA      
			v_C16_CoA      
			
			v_E_C4_CoA    
			v_E_C6_CoA     
			v_E_C8_CoA     
			v_E_C10_CoA   
			v_E_C12_CoA    
			v_E_C14_CoA   
			v_E_C16_CoA   
			
			v_L_C4_CoA     
			v_L_C6_CoA     
			v_L_C8_CoA    
			v_L_C10_CoA    
			v_L_C12_CoA    
			v_L_C14_CoA    
			v_L_C16_CoA    
			
			v_K_C4_CoA    
			v_K_C6_CoA    
			v_K_C8_CoA     
			v_K_C10_CoA    
			v_K_C12_CoA    
			v_K_C14_CoA    
			v_K_C16_CoA  
         ]*scale_cac;
         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         

%145-150
V_Car_shuttle = [
                 	v_C16_CoA_cyt  
					v_C16_Car_cyt  
					v_Car_cyt      
					v_CoA_cyt      
					v_C16_Car_mito 
					v_Car_mito 
                ]*scale_cac;
                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          

%151-53
V_keto = [
           v_S3H3MG_CoA_mito
           v_AcAc_mito      
           v_R3HBut_mito  
         ]*scale_cac;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         

%154
v_dummy1*scale_cac;
         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         
         

