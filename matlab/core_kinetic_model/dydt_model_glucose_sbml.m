function [dydt, v] = dydt_model_glucose_sbml(t, y)
% DYDT_MODEL_GLUCOSE_SBML
%   author: Matthias Koenig 
%           Charite Berlin
%           Computational Systems Biochemistry Berlin
%           matthias.koenig@charite.de
%   date:   2014-03-30
%
%  Some model transformation to make the model structure
%  compatible with the SBML format. 
%  Especially: All fluxes are now in [amount/time] and the compartments
%              are represented by volumes which are used to calculate
%              respective changes in concentration in the different 
%              compartments.
%

%% Scaling hepatic glucose metablism
scale_gly = 12.5;
scale_glyglc = 12.5;

% Volumes of the compartments
Vext = 10;   % [litre]
Vcyto = 1;   % [litre]
Vmito = 0.2; % [litre]

%% Concentrations [mM = mmole_per_litre]
atp         = y(1);
adp         = y(2);
amp         = y(3);
utp         = y(4);
udp         = y(5);
gtp         = y(6);
gdp         = y(7);
nad         = y(8);
nadh        = y(9);
phos        = y(10);
pp          = y(11);
co2         = y(13);
glc1p       = y(15);
udpglc      = y(16);
glyglc      = y(17);
glc         = y(18);
glc6p       = y(19);
fru6p       = y(20);
fru16bp     = y(21);
fru26bp     = y(22);
grap        = y(23);
dhap        = y(24);
bpg13       = y(25);
pg3         = y(26);
pg2         = y(27);
pep         = y(28);
pyr         = y(29);
oaa         = y(30);
lac         = y(31);
glc_ext     = y(32);
lac_ext     = y(33);
co2_mito    = y(34);
phos_mito   = y(35);
oaa_mito    = y(36);
pep_mito    = y(37);
acoa_mito   = y(38);
pyr_mito    = y(39);
cit_mito    = y(40);
atp_mito    = y(41);
adp_mito    = y(42);
gtp_mito    = y(43);
gdp_mito    = y(44);
coa_mito    = y(45);
nadh_mito   = y(46);
nad_mito    = y(47);
h_mito      = y(48);
h2o_mito    = y(49);

%% Hormonal response & phosphorylation state
% insulin
x_ins1 = 818.9; % [pmol/l]
x_ins2 = 0;     % [pmol/l]
x_ins3 = 8.6;   % [mM]
x_ins4 = 4.2;   % [-]
ins = max(0.0, (x_ins1-x_ins2) * glc_ext^x_ins4/(glc_ext^x_ins4 + x_ins3^x_ins4)); % [pmol/l]

% glucagon
x_glu1 = 190;  % [pmol/l]
x_glu2 = 37.9; % [pmol/l]
x_glu3 = 3.01; % [mM]
x_glu4 = 6.40; % [-]
glu = max(0.0, (x_glu1-x_glu2)*(1 - glc_ext^x_glu4/(glc_ext^x_glu4 + x_glu3^x_glu4))); % [pmol/l]

% epinephrine
x_epi1 = 6090;  % [pmol/l]
x_epi2 = 100;   % [pmol/l]
x_epi3 = 3.10;  % [mM]
x_epi4 = 8.40;  % [-]
epi = max(0.0, (x_epi1-x_epi2) * (1 - glc_ext^x_epi4/(glc_ext^x_epi4 + x_epi3^x_glu4))); % [pmol/l]

% gamma
K_val = 0.1;  % [-];
epi_f = 0.8; % [-];
K_ins = (x_ins1-x_ins2) * K_val; % [pmol/l];
K_glu = (x_glu1-x_glu2) * K_val; % [pmol/l];
K_epi = (x_epi1-x_epi2) * K_val; % [pmol/l];
gamma = 0.5 * (1 - ins/(ins+K_ins) + max(glu/(glu+K_glu), epi_f*epi/(epi+K_epi)) ); % [-]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Glucose import/export             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% *********************************** %
% v1 : GLUT2 : Glucose Transporter
% *********************************** %
% glc_ext <-> glc
GLUT2_keq = 1;      % [-]
GLUT2_km = 42;      % [mM]
GLUT2_Vmax = 420;   % [mmol_per_s]
GLUT2 = scale_gly * GLUT2_Vmax/GLUT2_km * (glc_ext - glc/GLUT2_keq)/(1 + glc_ext/GLUT2_km + glc/GLUT2_km);
% [mmole_per_s]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Glucokinase / G6Pase              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% *********************************** %
% v2 : GK : Glucokinase
% *********************************** %
% glucose + atp => glucose_6P + adp 

% Inhibition by GCRP
GK_n_gkrp = 2;           % [-]
GK_km_glc1 = 15;         % [mM]
GK_km_fru6p = 0.010;     % [mM]
GK_b = 0.7;              % [-]

GK_n = 1.6;              % [-]
GK_km_glc = 7.5;         % [mM]
GK_km_atp = 0.26;        % [mM]
GK_Vmax = 25.2;          % [mmol_per_s]

GK_gc_free = (glc^GK_n_gkrp / (glc^GK_n_gkrp + GK_km_glc1^GK_n_gkrp) ) * (1 - GK_b*fru6p/(fru6p + GK_km_fru6p)); % [-]
GK = scale_gly * GK_Vmax * GK_gc_free * atp/(GK_km_atp + atp) * glc^GK_n/(glc^GK_n + GK_km_glc^GK_n); % [mmol_per_s]


% *********************************** %
% v3 : G6PASE : D-Glucose-6-phosphate Phosphatase
% *********************************** %
% glc6p + h2o => glc + phos
G6PASE_km_glc6p = 2;    % [mM]
G6PASE_Vmax =  18.9;    % [mmol_per_s]
G6PASE = scale_gly * G6PASE_Vmax * glc6p / (G6PASE_km_glc6p + glc6p);  % [mmol_per_s]

% *********************************** %
% v4 : GPI : D-Glucose-6-phosphate Isomerase
% *********************************** %
% glc6p <-> fru6P
GPI_keq = 0.517060817492925;  % [-]
GPI_km_glc6p  = 0.182;        % [mM]
GPI_km_fru6p = 0.071;         % [mM]
GPI_Vmax = 420;               % [mmol/l]
GPI = scale_gly * GPI_Vmax/GPI_km_glc6p * (glc6p - fru6p/GPI_keq) / (1 + glc6p/GPI_km_glc6p + fru6p/GPI_km_fru6p);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Glycogen metabolism               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% *********************************** %
% v5 : G16PI : Glucose 1-phosphate 1,6-phosphomutase
% *********************************** %
% glc1p <-> glc6p
G16PI_keq = 15.717554082151441; % [-]
G16PI_km_glc6p  = 0.67;         % [mM]
G16PI_km_glc1p = 0.045;         % [mM]
G16PI_Vmax = 100;               % [mmol_per_s]
G16PI = scale_glyglc * G16PI_Vmax/G16PI_km_glc1p * (glc1p - glc6p/G16PI_keq) / ...
        (1 + glc1p/G16PI_km_glc1p + glc6p/G16PI_km_glc6p);

% *********************************** %
% v6 : UPGASE : UTP:Glucose-1-phosphate uridylyltransferase (UPGase)
% *********************************** %
% utp + glc1P <-> udpglc + pp
UPGASE_keq = 0.312237619153088;  % [-]
UPGASE_km_utp = 0.563;           % [mM] [ 0.200, 0.048]
UPGASE_km_glc1p = 0.172;         % [mM] [0.050, 0.095]
UPGASE_km_udpglc = 0.049;        % [mM] [0.060, 0.048]
UPGASE_km_pp = 0.166;            % [mM] [0.084, 0.210]
UPGASE_Vmax = 80;                % [mmol_per_s]
UPGASE = scale_glyglc * UPGASE_Vmax/(UPGASE_km_utp*UPGASE_km_glc1p) * (utp*glc1p - udpglc*pp/UPGASE_keq) / ...
    ( (1 + utp/UPGASE_km_utp)*(1 + glc1p/UPGASE_km_glc1p) + (1 + udpglc/UPGASE_km_udpglc)*(1 + pp/UPGASE_km_pp) - 1 );
 
% *********************************** %
% v7 : PPASE: Pyrophosphate phosphohydrolase
% *********************************** %
% pp + h2o => 2 phos
PPASE_km_pp = 0.005;  % [mM]
PPASE_Vmax = 2.4;     % [mmol_per_s]
PPASE = scale_glyglc * PPASE_Vmax * pp/(pp + PPASE_km_pp);

% *********************************** %
% v8 : GS : Glycogen synthase
% *********************************** %
% udpglc => udp + glyglc

GS_C = 500;                 % [mM] maximal storage capacity for glycogen per volume liver
GS_k1_max = 0.2;            % [-]
GS_k1_nat = 0.224;          % [mMmM]
GS_k2_nat = 0.1504;         % [mM]
GS_k1_phospho = 3.003;      % [mMmM]
GS_k2_phospho = 0.09029;    % [mM]
GS_Vmax =  13.2;            % [mmol_per_s]

GS_storage_factor = (1+GS_k1_max) * (GS_C - glyglc)/( (GS_C - glyglc) + GS_k1_max * GS_C); % [-]

GS_k_udpglc_native = GS_k1_nat / (glc6p + GS_k2_nat);          % [mM]
GS_k_udpglc_phospho = GS_k1_phospho / (glc6p + GS_k2_phospho); % [mM]
GS_native = scale_glyglc * GS_Vmax * GS_storage_factor * udpglc / (GS_k_udpglc_native + udpglc); % [mmol_per_s]
GS_phospho = scale_glyglc * GS_Vmax * GS_storage_factor * udpglc / (GS_k_udpglc_phospho + udpglc); % [mmol_per_s] 
GS = (1-gamma)*GS_native + gamma*GS_phospho; % [mmol_per_s]

% *********************************** %
% v9 : GP : Glycogen-Phosphorylase
% *********************************** %
% glyglc + phos <-> glc1p
GP_keq = 0.211826505793075; % [per_mM]
GP_k_glyc_native = 4.8;     % [mM]  
GP_k_glyc_phospho = 2.7;    % [mM]  
GP_k_glc1p_native = 120;    % [mM]  
GP_k_glc1p_phospho = 2;     % [mM]
GP_k_p_native = 300;        % [mM]  
GP_k_p_phospho = 5;         % [mM]
GP_ki_glc_phospho = 5;      % [mM]
GP_ka_amp_native = 1;       % [mM]
GP_base_amp_native = 0.03;  % [mmol_per_s]
GP_max_amp_native = 0.30;   % [mmol_per_s]
GP_Vmax = 6.8;              % [mmol_per_s]

GP_C = GS_C;                % [mM]
GP_k1_max = GS_k1_max;      % [-]
GP_fmax = (1+GP_k1_max) * glyglc /( glyglc + GP_k1_max * GP_C); % [-]
GP_vmax_native = scale_glyglc * GP_Vmax * GP_fmax * (GP_base_amp_native + (GP_max_amp_native - GP_base_amp_native) *amp/(amp+GP_ka_amp_native));
GP_native = GP_vmax_native/(GP_k_glyc_native*GP_k_p_native) * (glyglc*phos - glc1p/GP_keq) / ...
        ( (1 + glyglc/GP_k_glyc_native)*(1 + phos/GP_k_p_native) + (1 + glc1p/GP_k_glc1p_native)  - 1 );  % [mmol_per_s]

GP_vmax_phospho = scale_glyglc * GP_Vmax * GP_fmax * exp(-log(2)/GP_ki_glc_phospho * glc);  % [mmol_per_s]
GP_phospho = GP_vmax_phospho/(GP_k_glyc_phospho*GP_k_p_phospho) * (glyglc*phos - glc1p/GP_keq) / ...
      ( (1 + glyglc/GP_k_glyc_phospho)*(1 + phos/GP_k_p_phospho) + (1 + glc1p/GP_k_glc1p_phospho)  - 1);  % [mmol_per_s]
GP = (1-gamma) * GP_native + gamma*GP_phospho;  % [mmol_per_s]

% *********************************** %
% v10 : NDKGTP : Nucleoside-diphosphate kinase (ATP, GTP)
% *********************************** %
% atp + gdp <-> adp + gtp
NDKGTP_keq = 1;             % [-]
NDKGTP_km_atp = 1.33;       % [mM]
NDKGTP_km_adp = 0.042;      % [mM]
NDKGTP_km_gtp = 0.15;       % [mM]
NDKGTP_km_gdp = 0.031;      % [mM]
NDKGTP_Vmax = 0;            % [mmol_per_s]
NDKGTP = scale_gly * NDKGTP_Vmax / (NDKGTP_km_atp * NDKGTP_km_gdp) * (atp*gdp - adp*gtp/NDKGTP_keq) / ( (1 + atp/NDKGTP_km_atp)*(1 + gdp/NDKGTP_km_gdp) + (1 + adp/NDKGTP_km_adp)*(1 + gtp/NDKGTP_km_gtp) - 1);
% [mmol_per_s]

% *********************************** %
% v11 : NDKUTP : Nucleoside-diphosphate kinase (ATP, UTP)
% *********************************** %
% atp + udp <-> adp + utp
NDKUTP_keq = 1;            % [-]
NDKUTP_km_atp = 1.33;      % [mM]
NDKUTP_km_adp = 0.042;     % [mM]
NDKUTP_km_utp = 16;        % [mM]
NDKUTP_km_udp = 0.19;      % [mM]
NDKUTP_Vmax = 2940;        % [mmol_per_s]
NDKUTP = scale_glyglc * NDKUTP_Vmax / (NDKUTP_km_atp * NDKUTP_km_udp) * (atp*udp - adp*utp/NDKUTP_keq) / ( (1 + atp/NDKUTP_km_atp)*(1 + udp/NDKUTP_km_udp) + (1 + adp/NDKUTP_km_adp)*(1 + utp/NDKUTP_km_utp) - 1);
% [mmol_per_s]


% *********************************** %
% v12 : AK : ATP:AMP phosphotransferase (Adenylatkinase)
% *********************************** %
% atp + amp <-> 2 adp
AK_keq = 0.247390074904985;  % [-]
AK_km_atp = 0.09;            % [mM]
AK_km_amp = 0.08;            % [mM]
AK_km_adp = 0.11;            % [mM]
AK_Vmax = 0;                 % [mmol_per_s]
AK = scale_gly * AK_Vmax / (AK_km_atp * AK_km_amp) * (atp*amp - adp*adp/AK_keq) / ( (1+atp/AK_km_atp)*(1+amp/AK_km_amp) + (1+adp/AK_km_adp)*(1+adp/AK_km_adp) - 1); 
% [mmol_per_s]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PFK / FBPase                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Bifunctional enzyme which is regulated by multiple effectors
%   - cAMP concentration, C++, 
%   - v14_vmax/v15_vmax kinase/phospatase = 90/22
%   Enzyme exist in phosphorylated and dephosphorylated form. The actual
%   kinetics is a combination of both enzyme forms depending on the 
%   phosphorylation state of the enzyme.

% *********************************** %
% v13 : PFK2 : ATP:D-fructose-6-phosphate 2-phosphotransferase
% *********************************** %
% fru6p + atp => fru26bp + adp
PFK2_n_native = 1.3;              % [-]
PFK2_n_phospho = 2.1;             % [-]
PFK2_k_fru6p_native = 0.016;      % [mM]
PFK2_k_fru6p_phospho = 0.050;     % [mM]
PFK2_k_atp_native = 0.28;         % [mM]
PFK2_k_atp_phospho = 0.65;        % [mM]
PFK2_Vmax =  0.0042;              % [mmol_per_s]

PFK2_native = scale_gly * PFK2_Vmax * fru6p^PFK2_n_native / (fru6p^PFK2_n_native + PFK2_k_fru6p_native^PFK2_n_native) * atp/(atp + PFK2_k_atp_native);
PFK2_phospho = scale_gly * PFK2_Vmax * fru6p^PFK2_n_phospho / (fru6p^PFK2_n_phospho + PFK2_k_fru6p_phospho^PFK2_n_phospho) * atp/(atp + PFK2_k_atp_phospho);
PFK2 = (1-gamma) * PFK2_native + gamma*PFK2_phospho; % [mmol_per_s]

% *********************************** %
% v14 : FBP2 : D-Fructose-2,6-bisphosphate 2-phosphohydrolase
% *********************************** %
% fru26bp => fru6p + p 
FBP2_km_fru26bp_native = 0.010;     % [mM]
FBP2_ki_fru6p_native = 0.0035;      % [mM]
FBP2_km_fru26bp_phospho = 0.0005;   % [mM]
FBP2_ki_fru6p_phospho = 0.010;      % [mM]
FBP2_Vmax =  0.126;                 % [mmol_per_s]
FBP2_native = scale_gly * FBP2_Vmax/(1 + fru6p/FBP2_ki_fru6p_native) * fru26bp / ( FBP2_km_fru26bp_native + fru26bp);
FBP2_phospho = scale_gly * FBP2_Vmax/(1 + fru6p/FBP2_ki_fru6p_phospho) * fru26bp / ( FBP2_km_fru26bp_phospho + fru26bp);
FBP2 = (1-gamma) * FBP2_native + gamma * FBP2_phospho; % [mmol_per_s]

% *********************************** %
% v15 : PFK1 : ATP:D-fructose-6-phosphate 1-phosphotransferase
% *********************************** %
% fru6p + atp => fru16bp + adp
PFK1_km_atp = 0.111;                % [mM] [b]
PFK1_km_fru6p = 0.077;              % [mM] [a]
PFK1_ki_fru6p = 0.012;              % [mM] [ai]
PFK1_ka_fru26bp = 0.001;            % [mM]
PFK1_Vmax = 7.182;                  % [mmol_per_s]

PFK1 = scale_gly * PFK1_Vmax * (1 - 1/(1 + fru26bp/PFK1_ka_fru26bp)) * fru6p*atp/(PFK1_ki_fru6p*PFK1_km_atp + PFK1_km_fru6p*atp + PFK1_km_atp*fru6p + atp*fru6p);

% *********************************** %
% v16 : FBP1 : D-Fructose-1,6-bisphosphate 1-phosphohydrolase
% *********************************** %
% fru16bp + h2o => fru6p + p
FBP1_ki_fru26bp = 0.001;    % [mM]
FBP1_km_fru16bp = 0.0013;   % [mM]
FBP1_Vmax = 4.326;          % [mmol_per_s]
FBP1 = scale_gly * FBP1_Vmax / (1 + fru26bp/FBP1_ki_fru26bp) * fru16bp/(fru16bp + FBP1_km_fru16bp); % [mmol_per_s]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Downstream PFK                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% *********************************** %
% v17 : ALD : Aldolase
% *********************************** %
% fru16bp <-> grap + dhap
ALD_keq = 9.762988973629690E-5;  % [per_mM]
ALD_km_fru16bp = 0.0071;         % [mM]
ALD_km_dhap = 0.0364;            % [mM]
ALD_km_grap = 0.0071;            % [mM]
ALD_ki1_grap = 0.0572;           % [mM]
ALD_ki2_grap = 0.176;            % [mM]
ALD_Vmax = 420;                  % [mmol_per_s]
ALD = scale_gly * ALD_Vmax/ALD_km_fru16bp * (fru16bp - grap*dhap/ALD_keq) /(1 + fru16bp/ALD_km_fru16bp + grap/ALD_ki1_grap + dhap*(grap + ALD_km_grap)/(ALD_km_dhap*ALD_ki1_grap) + (fru16bp*grap)/(ALD_km_fru16bp*ALD_ki2_grap));
% [mmol_per_s]

% *********************************** %
% v18 : TPI : Triosephosphate Isomerase
% *********************************** %
% dhap <-> grap
TPI_keq = 0.054476985386756;  % [-]
TPI_km_dhap = 0.59;  % [mM]
TPI_km_grap = 0.42;  % [mM]
TPI_Vmax = 420;      % [mmol_per_s]
TPI = scale_gly * TPI_Vmax/TPI_km_dhap * (dhap - grap/TPI_keq) / (1 + dhap/TPI_km_dhap + grap/TPI_km_grap);
% [mmol_per_s]

% *********************************** %
% v19 : GAPDH : D-Glyceraldehyde-3-phosphate:NAD+ oxidoreductase
% *********************************** %
% grap + p + nad <-> bpg13 + nadh + h
GAPDH_keq = 0.086779866194594; % [-]
GAPDH_k_nad = 0.05;        % [mM]
GAPDH_k_grap = 0.005;      % [mM]
GAPDH_k_p = 3.9;           % [mM]
GAPDH_k_nadh = 0.0083;     % [mM]
GAPDH_k_bpg13 = 0.0035;    % [mM]
GAPDH_Vmax = 420;          % [mmol_per_s]
GAPDH = scale_gly * GAPDH_Vmax / (GAPDH_k_nad*GAPDH_k_grap*GAPDH_k_p) * (nad*grap*phos - bpg13*nadh/GAPDH_keq) / ...
    ( (1 + nad/GAPDH_k_nad) * (1+grap/GAPDH_k_grap) * (1 + phos/GAPDH_k_p) + (1+nadh/GAPDH_k_nadh)*(1+bpg13/GAPDH_k_bpg13) - 1);
% [mmol_per_s]

% *********************************** %
% v20 : PGK : Phosphoglycerate Kinase
% *********************************** %
% adp + bpg13 <-> atp + pg3
PGK_keq = 6.958644052488538; % [-]
PGK_k_adp = 0.35;            % [mM]
PGK_k_atp = 0.48;            % [mM]
PGK_k_bpg13 = 0.002;         % [mM]
PGK_k_pg3 = 1.2;             % [mM]
PGK_Vmax = 420;              % [mmol_per_s]
PGK = scale_gly * PGK_Vmax / (PGK_k_adp*PGK_k_bpg13) * (adp*bpg13 - atp*pg3/PGK_keq) / ((1 + adp/PGK_k_adp)*(1+bpg13/PGK_k_bpg13) + (1+atp/PGK_k_atp)*(1+pg3/PGK_k_pg3) - 1); 
% [mmol_per_s]

% *********************************** %
% v21 : PGM : 2-Phospho-D-glycerate 2,3-phosphomutase
% *********************************** %
% pg3 <-> pg2
PGM_keq = 0.181375378837397; % [-]
PGM_k_pg3 = 5;      % [mM]
PGM_k_pg2 = 1;      % [mM]
PGM_Vmax = 420;     % [mmol_per_s]
PGM = scale_gly * PGM_Vmax * (pg3 - pg2/PGM_keq) / (pg3 + PGM_k_pg3 *(1 + pg2/PGM_k_pg2));


% *********************************** %
% v22 : EN : 2-Phospho-D-glucerate hydro-lyase (enolase)
% *********************************** %
% pg2 <-> pep
EN_keq = 0.054476985386756; % [-]
EN_k_pep = 1;      % [mM]
EN_k_pg2 = 1;      % [mM]
EN_Vmax = 35.994;  % [mmol_per_s]
EN = scale_gly * EN_Vmax * (pg2 - pep/EN_keq) / (pg2 + EN_k_pg2 *(1 + pep/EN_k_pep)); % [mmol_per_s]

% *********************************** %
% v23 : PK : Pyruvatkinase
% *********************************** %
% pep + adp => pyr + atp
PK_n = 3.5;         % [-]
PK_n_p = 3.5;       % [-]
PK_n_fbp = 1.8;     % [-]
PK_n_fbp_p = 1.8;   % [-]
PK_alpha = 1.0;     % [-]
PK_alpha_p = 1.1;   % [-]
PK_alpha_end = 1.0; % [-]
PK_k_fbp = 0.16E-3;   % [mM]
PK_k_fbp_p = 0.35E-3; % [mM]
PK_k_pep = 0.58;      % [mM]
PK_k_pep_p = 1.10;    % [mM]
PK_k_pep_end = 0.08;  % [mM]
PK_k_adp = 2.3;       % [mM]
PK_base_act = 0.08;   % [-]
PK_base_act_p = 0.04; % [-]
PK_Vmax = 46.2;       % [mmol_per_s]

PK_f = fru16bp^PK_n_fbp / (PK_k_fbp^PK_n_fbp + fru16bp^PK_n_fbp);           % [-]
PK_f_p = fru16bp^PK_n_fbp_p / (PK_k_fbp_p^PK_n_fbp_p + fru16bp^PK_n_fbp_p); % [-]
PK_alpha_inp = (1 - PK_f) * (PK_alpha - PK_alpha_end) + PK_alpha_end;       % [-]
PK_alpha_p_inp = (1 - PK_f_p) * (PK_alpha_p - PK_alpha_end) + PK_alpha_end; % [-]
PK_pep_inp = (1 - PK_f) * (PK_k_pep - PK_k_pep_end) + PK_k_pep_end;         % [mM]
PK_pep_p_inp = (1 - PK_f_p) * (PK_k_pep_p - PK_k_pep_end) + PK_k_pep_end;   % [mM]

PK_native =  scale_gly * PK_Vmax * PK_alpha_inp * pep^PK_n/(PK_pep_inp^PK_n + pep^PK_n) * adp/(adp + PK_k_adp) * ( PK_base_act + (1-PK_base_act) *PK_f );
PK_phospho = scale_gly * PK_Vmax * PK_alpha_p_inp * pep^PK_n_p/(PK_pep_p_inp^PK_n_p + pep^PK_n_p) * adp/(adp + PK_k_adp) * ( PK_base_act_p + (1-PK_base_act_p) * PK_f_p );
PK = (1-gamma)* PK_native + gamma * PK_phospho;  % [mmol_per_s]


% *********************************** %
% v24 : PEPCK
% *********************************** %
% Michaelis-Menten Kinetics
% mitochondrial PEPCK has very similar Kinetics
% [Yang2009, Case2007]
% oxalacetate + GTP -> PEP + GDP + CO2
%v24_deltag = -15;        % [kJ/mol]  
%v24_keq = keq(v24_deltag); % 337 [mM]
%v24_td = ( oaa * gtp - pep*gdp*co2/v24_keq); 

v24_keq = 3.369565215864287E2;
v24_k_pep = 0.237;
v24_k_gdp = 0.0921;
v24_k_co2 = 25.5;
v24_k_oaa = 0.0055;
v24_k_gtp = 0.0222;
v24_Vmax = 0;

v24 = scale_gly * v24_Vmax / (v24_k_oaa * v24_k_gtp) * (oaa*gtp - pep*gdp*co2/v24_keq) / ( (1+oaa/v24_k_oaa)*(1+gtp/v24_k_gtp) + (1+pep/v24_k_pep)*(1+gdp/v24_k_gdp)*(1+co2/v24_k_co2) - 1 );

% *********************************** %
% v25 : PEPCK mito
% *********************************** %
% v25_td = (oaa_mito * gtp_mito - pep_mito*gdp_mito*co2_mito /v24_keq); 
v25_Vmax = 546;

v25 = scale_gly * v25_Vmax / (v24_k_oaa * v24_k_gtp) * (oaa_mito*gtp_mito - pep_mito*gdp_mito*co2_mito /v24_keq) / ( (1+oaa_mito/v24_k_oaa)*(1+gtp_mito/v24_k_gtp) + (1+pep_mito/v24_k_pep)*(1+gdp_mito/v24_k_gdp)*(1+co2_mito/v24_k_co2) - 1 );

% *********************************** %
% v26 : Pyruvate Carboxylase
% *********************************** %
% Acetyl-CoA is allosterical activator.
% [Jitrapakdee1999, Scrutton1974]
% Irreversible reaction
% atp + pyr + co2 -> oaa + adp + p
%v26_deltag = 0;                 % ??? [kJ/mol]  
%v26_keq = keq(v26_deltag); 
%v26_td = (atp_mito*pyr_mito*co2_mito - oaa_mito*adp_mito*p_mito/v26_keq); 

v26_k_atp = 0.22;  %[mM]
v26_k_pyr = 0.22;  %[mM]
v26_k_co2 = 3.2;   %[mM]
v26_k_acoa = 0.015; %[mM]
v26_n = 2.5;
v26_Vmax = 168;

v26 = scale_gly * v26_Vmax * atp_mito/(v26_k_atp + atp_mito) * pyr_mito/(v26_k_pyr + pyr_mito) * co2_mito/(v26_k_co2 + co2_mito) * acoa_mito^v26_n / (acoa_mito^v26_n + v26_k_acoa^v26_n);

% *********************************** %
% v27 : Lactate Dehydrogenase
% *********************************** %
% pyr + nadh <-> lac + nad 
%v27_deltag = 21.1;        % [kJ/mol]  
%v27_keq = keq(v27_deltag); 
%v27_td = (pyr*nadh - lac*nad/v27_keq);

v27_keq = 2.783210760047520e-004;
v27_k_pyr = 0.495;      % [mM]
v27_k_lac = 31.98;      % [mM]
v27_k_nad = 0.984;      % [mM]
v27_k_nadh = 0.027;      % [mM]
v27_Vmax = 12.6;

v27 = scale_gly * v27_Vmax / (v27_k_pyr * v27_k_nadh) * (pyr*nadh - lac*nad/v27_keq) / ( (1+nadh/v27_k_nadh)*(1+pyr/v27_k_pyr) + (1+lac/v27_k_lac) * (1+nad/v27_k_nad) - 1);

% *********************************** %
% v28 : Lactate Transport (import)
% *********************************** %
% high capacity importer
% lactate_ext -> lactate
%v28_deltag = 0;
%v28_keq = keq(v28_deltag);
%v28_td = (lac_ext - lac/v28_keq);

v28_keq = 1;
v28_k_lac = 0.8;                % [mM]
v28_Vmax = 5.418;

v28 = scale_gly * v28_Vmax/v28_k_lac * (lac_ext - lac/v28_keq) / (1 + lac_ext/v28_k_lac + lac/v28_k_lac);

% *********************************** %
% v29 : Pyruvate Transport (import mito)
% *********************************** %
%v29_deltag = 0;
%v29_keq = keq(v29_deltag);
%v29_td = (pyr - pyr_mito/v29_keq);

v29_keq = 1;
v29_k_pyr = 0.1;                % [mM]
v29_Vmax = 42;

v29 = scale_gly * v29_Vmax/v29_k_pyr * (pyr - pyr_mito/v29_keq) / (1 + pyr/v29_k_pyr + pyr_mito/v29_k_pyr);

% *********************************** %
% v30 : PEP Transport (export mito)
% *********************************** %
%v30_deltag = 0;
%v30_keq = keq(v30_deltag);
%v30_td = (pep_mito - pep/v30_keq);

v30_keq = 1;
v30_k_pep = 0.1;                % [mM]
v30_Vmax = 33.6;

v30 = scale_gly * v30_Vmax/v30_k_pep * (pep_mito - pep/v30_keq) / (1 + pep/v30_k_pep + pep_mito/v30_k_pep);

% *********************************** %
% v31 : PDH
% *********************************** %
% reaction is irreversibel
% PDH regulated by phosphorylation, dephosphorylation mechanism
% phosphorylated form is not very active
% unphosphorylated form is more active
% pyr + coa + nad -> acoa + co2 + nadh + h
% [Hamada1975, Korotchkina2006, Kiselevsky1990, Holness1988]
%v31_keq = 1;
%v31_td = (pyr_mito*coa_mito*nad_mito - acoa_mito*co2_mito*nadh_mito/v31_keq);

v31_k_pyr = 0.025;           % [mM] 
v31_k_coa = 0.013;           % [mM]
v31_k_nad = 0.050;           % [mM] 
v31_ki_acoa = 0.035;         % [mM]
v31_ki_nadh = 0.036;
v31_alpha_nat = 5;
v31_alpha_p = 1;
v31_Vmax = 13.44;

v31_base = scale_gly * v31_Vmax * pyr_mito/(pyr_mito + v31_k_pyr) * nad_mito/(nad_mito + v31_k_nad*(1 + nadh_mito/v31_ki_nadh)) * coa_mito/(coa_mito + v31_k_coa*(1+acoa_mito/v31_ki_acoa));
v31_nat = v31_base * v31_alpha_nat;
v31_p = v31_base * v31_alpha_p;
v31 = (1 - gamma) * v31_nat + gamma * v31_p;

% *********************************** %
% v32 : CS
% *********************************** %
% acoa_mito + oaa_mito + h2o mito -> cit_mito + coa_mito
% ATP inhibition not integrated
% [Shepherd1969, Smitherman1979, Matsuoka1973, Nelson2008]
%v32_deltag = -32.2;        % [kJ/mol]  
%v32_keq = keq(v32_deltag); 
%v32_td = (acoa_mito * oaa_mito - cit_mito*coa_mito/v32_keq);

v32_keq = 2.665990308427589e+005;
v32_k_oaa = 0.002;           % [mM] 
v32_k_acoa = 0.016;          % [mM]
v32_k_cit = 0.420;           % [mM] 
v32_k_coa = 0.070;           % [mM]
v32_Vmax = 4.2;

v32 = scale_gly * v32_Vmax/(v32_k_oaa * v32_k_acoa) * (acoa_mito*oaa_mito - cit_mito*coa_mito/v32_keq) / ( (1+acoa_mito/v32_k_acoa)*(1+oaa_mito/v32_k_oaa) + (1+cit_mito/v32_k_cit)*(1+coa_mito/v32_k_coa) -1 );

% *********************************** %
% v33 : Nucleoside-diphosphate kinase (ATP, GTP)
% *********************************** %
% ATP + GDP <-> ADP + GTP
% The concentrations of the nucleotides are coupled via the NDK reaction
% [Fukuchi1994, Kimura1988, Lam1986]
%v33_deltag = 0;        % [kJ/mol]  
%v33_keq = keq(v33_deltag); 
%v33_td = (atp_mito*gdp_mito - adp_mito*gtp_mito/v33_keq);

v33_keq = 1;
v33_k_atp = 1.33;       % [mM]
v33_k_adp = 0.042;      % [mM]
v33_k_gtp = 0.15;       % [mM]
v33_k_gdp = 0.031;      % [mM]
v33_Vmax = 420;

v33 = scale_gly * v33_Vmax / (v33_k_atp * v33_k_gdp) * (atp_mito*gdp_mito - adp_mito*gtp_mito/v33_keq) / ( (1 + atp_mito/v33_k_atp)*(1 + gdp_mito/v33_k_gdp) + (1 + adp_mito/v33_k_adp)*(1 + gtp_mito/v33_k_gtp) - 1) ;

% *********************************** %
% v34 : OAA influx
% *********************************** %
v34_Vmax = 0;
v34 = scale_gly * v34_Vmax;

% *********************************** %
% v35 : Acetyl-CoA efflux
% *********************************** %
v35_Vmax = 0;
v35 = scale_gly * v35_Vmax;

% *********************************** %
% v36 : Citrate efflux
% *********************************** %
v36_Vmax = 0;
v36 = scale_gly * v36_Vmax;


%%  Fluxes and concentration changes [mmol/s/litre]
dydt = zeros(size(y));
dydt(1) = (-GK -NDKGTP -NDKUTP -AK -PFK2 -PFK1 +PGK +PK)/Vcyto;   % atp
dydt(2) = (+GK +NDKGTP +NDKUTP +2*AK +PFK2 +PFK1 -PGK -PK)/Vcyto; % adp
dydt(3) = (-AK)/Vcyto;        % amp
dydt(4) = (-UPGASE +NDKUTP)/Vcyto;    % utp
dydt(5) = (+GS -NDKUTP)/Vcyto;    % udp
dydt(6) = (+NDKGTP -v24)/Vcyto;   % gtp
dydt(7) = (-NDKGTP +v24)/Vcyto;   % gdp
dydt(8) = (-GAPDH +v27)/Vcyto;   % nad
dydt(9) = (+GAPDH -v27)/Vcyto;   % nadh
dydt(10) = (+G6PASE +2*PPASE -GP +FBP2 +FBP1 -GAPDH)/Vcyto; % phos
dydt(11) = (+UPGASE -PPASE)/Vcyto;    % pp
dydt(12) = (-G6PASE -PPASE -FBP2 -FBP1 +EN)/Vcyto;  % h2o
dydt(13) = (+v24)/Vcyto;        % co2
dydt(14) = (+GAPDH -v27)/Vcyto;   % h
dydt(15) = (-G16PI -UPGASE +GP)/Vcyto; % glc1p
dydt(16) = (+UPGASE -GS)/Vcyto;     % udpglc
dydt(17) = (+GS -GP)/Vcyto;     % glyglc
dydt(18) = (+GLUT2 -GK +G6PASE)/Vcyto; % glc
dydt(19) = (+GK -G6PASE -GPI +G16PI)/Vcyto;   % glc6p
dydt(20) = (+GPI -PFK2 +FBP2 -PFK1 +FBP1)/Vcyto;   % fru6p
dydt(21) = (+PFK1 -FBP1 -ALD)/Vcyto;    % fru16bp
dydt(22) = (+PFK2 -FBP2)/Vcyto;         % fru26bp
dydt(23) = (+ALD +TPI -GAPDH)/Vcyto;    % grap
dydt(24) = (+ALD -TPI)/Vcyto;         % dhap
dydt(25) = (+GAPDH -PGK)/Vcyto;         % bpg13
dydt(26) = (+PGK -PGM)/Vcyto;         % pg3
dydt(27) = (+PGM -EN)/Vcyto;         % pg2
dydt(28) = (+EN -PK +v24 +v30)/Vcyto;   % pep
dydt(29) = (+PK -v27 -v29)/Vcyto;    % pyr
dydt(30) = (-v24)/Vcyto;        % oaa
dydt(31) = (+v27 +v28)/Vcyto;   % lac

dydt(32) = (-GLUT2)/Vext;   % glc_ext
dydt(33) = (-v28)/Vext;  % lac_ext

dydt(34) = (+v25 -v26 +v31)/Vmito;      % co2_mito
dydt(35) = (+v26)/Vmito;                % p_mito
dydt(36) = (-v25 +v26 -v32 +v34)/Vmito; % oaa_mito
dydt(37) = (+v25 -v30)/Vmito;           % pep_mito
dydt(38) = (+v31 -v32 -v35)/Vmito;      % acoa_mito
dydt(39) = (-v26 +v29 -v31)/Vmito;      % pyr_mito
dydt(40) = (+v32 -v36)/Vmito;           % cit_mito
dydt(41) = (-v26 -v33)/Vmito;           % atp_mito
dydt(42) = (+v26 +v33)/Vmito;           % adp_mito
dydt(43) = (-v25 +v33)/Vmito;           % gtp_mito
dydt(44) = (+v25 -v33)/Vmito;           % gdp_mito
dydt(45) = (-v31 +v32)/Vmito;           % coa_mito
dydt(46) = (+v25 +v31)/Vmito;           % nadh_mito
dydt(47) = (-v25 -v31)/Vmito;           % nad_mito
dydt(48) = (+v25 +v31)/Vmito;           % h_mito
dydt(49) = (-v32)/Vmito;                % h2o_mito

%% constant metabolites
dydt(1) = 0;  % atp
dydt(2) = 0;  % adp
dydt(3) = 0;  % amp
dydt(8) = 0;  % nad
dydt(9) = 0;  % nadh
dydt(10) = 0; % phos
dydt(12) = 0; % h2o
dydt(13) = 0; % co2
dydt(14) = 0; % h
dydt(32) = 0; % glc_ext
dydt(33) = 0; % lac_ext
dydt(34) = 0; % co2_mito
dydt(35) = 0; % phos_mito
dydt(38) = 0; % acoa_mito
dydt(40) = 0; % cit_mito
dydt(41) = 0; % atp_mito
dydt(42) = 0; % adp_mito
dydt(45) = 0; % coa_mito
dydt(46) = 0; % nadh_mito
dydt(47) = 0; % nad_mito
dydt(48) = 0; % h_mito
dydt(49) = 0; % h2o_mito


%% Actual fluxes
v  = [GLUT2   % v1
      GK      % v2
      G6PASE  % v3
      GPI 
      G16PI 
      UPGASE 
      PPASE 
      GS 
      GP 
      NDKGTP 
      NDKUTP 
      AK 
      PFK2 
      FBP2 
      PFK1 
      FBP1 
      ALD 
      TPI 
      GAPDH 
      PGK 
      PGM 
      EN 
      PK 
      v24 
      v25 
      v26 
      v27 
      v28 
      v29 
      v30 
      v31 
      v32 
      v33 
      v34 
      v35 
      v36];


