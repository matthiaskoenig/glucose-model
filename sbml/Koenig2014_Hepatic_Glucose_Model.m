%  How to use:
%
%  Koenig2014_Hepatic_Glucose_Model takes 3 inputs and returns 3 outputs.
%
%  [t x rInfo] = Koenig2014_Hepatic_Glucose_Model(tspan,solver,options)
%  INPUTS: 
%  tspan - the time vector for the simulation. It can contain every time point, 
%  or just the start and end (e.g. [0 1 2 3] or [0 100]).
%  solver - the function handle for the odeN solver you wish to use (e.g. @ode23s).
%  options - this is the options structure returned from the MATLAB odeset
%  function used for setting tolerances and other parameters for the solver.
%  
%  OUTPUTS: 
%  t - the time vector that corresponds with the solution. If tspan only contains
%  the start and end times, t will contain points spaced out by the solver.
%  x - the simulation results.
%  rInfo - a structure containing information about the model. The fields
%  within rInfo are: 
%     stoich - the stoichiometry matrix of the model 
%     floatingSpecies - a cell array containing floating species name, initial
%     value, and indicator of the units being inconcentration or amount
%     compartments - a cell array containing compartment names and volumes
%     params - a cell array containing parameter names and values
%     boundarySpecies - a cell array containing boundary species name, initial
%     value, and indicator of the units being inconcentration or amount
%     rateRules - a cell array containing the names of variables used in a rate rule
%
%  Sample function call:
%     options = odeset('RelTol',1e-12,'AbsTol',1e-9);
%     [t x rInfo] = Koenig2014_Hepatic_Glucose_Model(linspace(0,100,100),@ode23s,options);
%
function [t x rInfo] = Koenig2014_Hepatic_Glucose_Model(tspan,solver,options)
    % initial conditions
    [x rInfo] = model();

    % initial assignments

    % assignment rules

    % run simulation
    [t x] = feval(solver,@model,tspan,x,options);

    % assignment rules

function [xdot rInfo] = model(time,x)
%  x(1)        utp
%  x(2)        udp
%  x(3)        gtp
%  x(4)        gdp
%  x(5)        pp
%  x(6)        glc1p
%  x(7)        udpglc
%  x(8)        glyglc
%  x(9)        glc
%  x(10)        glc6p
%  x(11)        fru6p
%  x(12)        fru16bp
%  x(13)        fru26bp
%  x(14)        grap
%  x(15)        dhap
%  x(16)        bpg13
%  x(17)        pg3
%  x(18)        pg2
%  x(19)        pep
%  x(20)        pyr
%  x(21)        oaa
%  x(22)        lac
%  x(23)        oaa_mito
%  x(24)        pep_mito
%  x(25)        pyr_mito
%  x(26)        gtp_mito
%  x(27)        gdp_mito

% List of Compartments 
vol__extern = 0;		%extern
vol__cyto = 0;		%cyto
vol__mito = 0;		%mito

% Global Parameters 
rInfo.g_p1 = 1;		% Vcyto
rInfo.g_p2 = 1.5;		% Vliver
rInfo.g_p3 = 0.583333;		% fliver
rInfo.g_p4 = 70;		% bodyweight
rInfo.g_p5 = 60;		% sec_per_min
rInfo.g_p6 = 0;		% conversion_factor
rInfo.g_p7 = 0;		% nadh_tot
rInfo.g_p8 = 0;		% atp_tot
rInfo.g_p9 = 0;		% utp_tot
rInfo.g_p10 = 0;		% gtp_tot
rInfo.g_p11 = 0;		% nadh_mito_tot
rInfo.g_p12 = 0;		% atp_mito_tot
rInfo.g_p13 = 0;		% gtp_mito_tot
rInfo.g_p14 = 818.9;		% x_ins1
rInfo.g_p15 = 0;		% x_ins2
rInfo.g_p16 = 8.6;		% x_ins3
rInfo.g_p17 = 4.2;		% x_ins4
rInfo.g_p18 = 0;		% ins
rInfo.g_p19 = 0;		% ins_norm
rInfo.g_p20 = 190;		% x_glu1
rInfo.g_p21 = 37.9;		% x_glu2
rInfo.g_p22 = 3.01;		% x_glu3
rInfo.g_p23 = 6.4;		% x_glu4
rInfo.g_p24 = 0;		% glu
rInfo.g_p25 = 0;		% glu_norm
rInfo.g_p26 = 6090;		% x_epi1
rInfo.g_p27 = 100;		% x_epi2
rInfo.g_p28 = 3.1;		% x_epi3
rInfo.g_p29 = 8.4;		% x_epi4
rInfo.g_p30 = 0;		% epi
rInfo.g_p31 = 0;		% epi_norm
rInfo.g_p32 = 0.1;		% K_val
rInfo.g_p33 = 0.8;		% epi_f
rInfo.g_p34 = 0;		% K_ins
rInfo.g_p35 = 0;		% K_glu
rInfo.g_p36 = 0;		% K_epi
rInfo.g_p37 = 0;		% gamma
rInfo.g_p38 = 0;		% scale
rInfo.g_p39 = 0;		% scale_gly
rInfo.g_p40 = 0;		% scale_glyglc
rInfo.g_p41 = 1;		% GLUT2_keq
rInfo.g_p42 = 42;		% GLUT2_km
rInfo.g_p43 = 420;		% GLUT2_Vmax
rInfo.g_p44 = 2;		% GK_n_gkrp
rInfo.g_p45 = 15;		% GK_km_glc1
rInfo.g_p46 = 0.01;		% GK_km_fru6p
rInfo.g_p47 = 0.7;		% GK_b
rInfo.g_p48 = 1.6;		% GK_n
rInfo.g_p49 = 7.5;		% GK_km_glc
rInfo.g_p50 = 0.26;		% GK_km_atp
rInfo.g_p51 = 25.2;		% GK_Vmax
rInfo.g_p52 = 0;		% GK_gc_free
rInfo.g_p53 = 2;		% G6PASE_km_glc6p
rInfo.g_p54 = 18.9;		% G6PASE_Vmax
rInfo.g_p55 = 0.517061;		% GPI_keq
rInfo.g_p56 = 0.182;		% GPI_km_glc6p
rInfo.g_p57 = 0.071;		% GPI_km_fru6p
rInfo.g_p58 = 420;		% GPI_Vmax
rInfo.g_p59 = 15.7176;		% G16PI_keq
rInfo.g_p60 = 0.67;		% G16PI_km_glc6p
rInfo.g_p61 = 0.045;		% G16PI_km_glc1p
rInfo.g_p62 = 100;		% G16PI_Vmax
rInfo.g_p63 = 0.312238;		% UPGASE_keq
rInfo.g_p64 = 0.563;		% UPGASE_km_utp
rInfo.g_p65 = 0.172;		% UPGASE_km_glc1p
rInfo.g_p66 = 0.049;		% UPGASE_km_udpglc
rInfo.g_p67 = 0.166;		% UPGASE_km_pp
rInfo.g_p68 = 80;		% UPGASE_Vmax
rInfo.g_p69 = 0.005;		% PPASE_km_pp
rInfo.g_p70 = 2.4;		% PPASE_Vmax
rInfo.g_p71 = 500;		% GS_C
rInfo.g_p72 = 0.2;		% GS_k1_max
rInfo.g_p73 = 0.224;		% GS_k1_nat
rInfo.g_p74 = 0.1504;		% GS_k2_nat
rInfo.g_p75 = 3.003;		% GS_k1_phospho
rInfo.g_p76 = 0.09029;		% GS_k2_phospho
rInfo.g_p77 = 13.2;		% GS_Vmax
rInfo.g_p78 = 0;		% GS_storage_factor
rInfo.g_p79 = 0;		% GS_k_udpglc_native
rInfo.g_p80 = 0;		% GS_k_udpglc_phospho
rInfo.g_p81 = 0;		% GS_native
rInfo.g_p82 = 0;		% GS_phospho
rInfo.g_p83 = 0.211827;		% GP_keq
rInfo.g_p84 = 4.8;		% GP_k_glyc_native
rInfo.g_p85 = 2.7;		% GP_k_glyc_phospho
rInfo.g_p86 = 120;		% GP_k_glc1p_native
rInfo.g_p87 = 2;		% GP_k_glc1p_phospho
rInfo.g_p88 = 300;		% GP_k_p_native
rInfo.g_p89 = 5;		% GP_k_p_phospho
rInfo.g_p90 = 5;		% GP_ki_glc_phospho
rInfo.g_p91 = 1;		% GP_ka_amp_native
rInfo.g_p92 = 0.03;		% GP_base_amp_native
rInfo.g_p93 = 0.3;		% GP_max_amp_native
rInfo.g_p94 = 6.8;		% GP_Vmax
rInfo.g_p95 = 0;		% GP_C
rInfo.g_p96 = 0;		% GP_k1_max
rInfo.g_p97 = 0;		% GP_fmax
rInfo.g_p98 = 0;		% GP_vmax_native
rInfo.g_p99 = 0;		% GP_native
rInfo.g_p100 = 0;		% GP_vmax_phospho
rInfo.g_p101 = 0;		% GP_phospho
rInfo.g_p102 = 1;		% NDKGTP_keq
rInfo.g_p103 = 1.33;		% NDKGTP_km_atp
rInfo.g_p104 = 0.042;		% NDKGTP_km_adp
rInfo.g_p105 = 0.15;		% NDKGTP_km_gtp
rInfo.g_p106 = 0.031;		% NDKGTP_km_gdp
rInfo.g_p107 = 0;		% NDKGTP_Vmax
rInfo.g_p108 = 1;		% NDKUTP_keq
rInfo.g_p109 = 1.33;		% NDKUTP_km_atp
rInfo.g_p110 = 0.042;		% NDKUTP_km_adp
rInfo.g_p111 = 16;		% NDKUTP_km_utp
rInfo.g_p112 = 0.19;		% NDKUTP_km_udp
rInfo.g_p113 = 2940;		% NDKUTP_Vmax
rInfo.g_p114 = 0.24739;		% AK_keq
rInfo.g_p115 = 0.09;		% AK_km_atp
rInfo.g_p116 = 0.08;		% AK_km_amp
rInfo.g_p117 = 0.11;		% AK_km_adp
rInfo.g_p118 = 0;		% AK_Vmax
rInfo.g_p119 = 1.3;		% PFK2_n_native
rInfo.g_p120 = 2.1;		% PFK2_n_phospho
rInfo.g_p121 = 0.016;		% PFK2_k_fru6p_native
rInfo.g_p122 = 0.05;		% PFK2_k_fru6p_phospho
rInfo.g_p123 = 0.28;		% PFK2_k_atp_native
rInfo.g_p124 = 0.65;		% PFK2_k_atp_phospho
rInfo.g_p125 = 0.0042;		% PFK2_Vmax
rInfo.g_p126 = 0;		% PFK2_native
rInfo.g_p127 = 0;		% PFK2_phospho
rInfo.g_p128 = 0.01;		% FBP2_km_fru26bp_native
rInfo.g_p129 = 0.0035;		% FBP2_ki_fru6p_native
rInfo.g_p130 = 0.0005;		% FBP2_km_fru26bp_phospho
rInfo.g_p131 = 0.01;		% FBP2_ki_fru6p_phospho
rInfo.g_p132 = 0.126;		% FBP2_Vmax
rInfo.g_p133 = 0;		% FBP2_native
rInfo.g_p134 = 0;		% FBP2_phospho
rInfo.g_p135 = 0.111;		% PFK1_km_atp
rInfo.g_p136 = 0.077;		% PFK1_km_fru6p
rInfo.g_p137 = 0.012;		% PFK1_ki_fru6p
rInfo.g_p138 = 0.001;		% PFK1_ka_fru26bp
rInfo.g_p139 = 7.182;		% PFK1_Vmax
rInfo.g_p140 = 0.001;		% FBP1_ki_fru26bp
rInfo.g_p141 = 0.0013;		% FBP1_km_fru16bp
rInfo.g_p142 = 4.326;		% FBP1_Vmax
rInfo.g_p143 = 9.76299e-05;		% ALD_keq
rInfo.g_p144 = 0.0071;		% ALD_km_fru16bp
rInfo.g_p145 = 0.0364;		% ALD_km_dhap
rInfo.g_p146 = 0.0071;		% ALD_km_grap
rInfo.g_p147 = 0.0572;		% ALD_ki1_grap
rInfo.g_p148 = 0.176;		% ALD_ki2_grap
rInfo.g_p149 = 420;		% ALD_Vmax
rInfo.g_p150 = 0.054477;		% TPI_keq
rInfo.g_p151 = 0.59;		% TPI_km_dhap
rInfo.g_p152 = 0.42;		% TPI_km_grap
rInfo.g_p153 = 420;		% TPI_Vmax
rInfo.g_p154 = 0.0867799;		% GAPDH_keq
rInfo.g_p155 = 0.05;		% GAPDH_k_nad
rInfo.g_p156 = 0.005;		% GAPDH_k_grap
rInfo.g_p157 = 3.9;		% GAPDH_k_p
rInfo.g_p158 = 0.0083;		% GAPDH_k_nadh
rInfo.g_p159 = 0.0035;		% GAPDH_k_bpg13
rInfo.g_p160 = 420;		% GAPDH_Vmax
rInfo.g_p161 = 6.95864;		% PGK_keq
rInfo.g_p162 = 0.35;		% PGK_k_adp
rInfo.g_p163 = 0.48;		% PGK_k_atp
rInfo.g_p164 = 0.002;		% PGK_k_bpg13
rInfo.g_p165 = 1.2;		% PGK_k_pg3
rInfo.g_p166 = 420;		% PGK_Vmax
rInfo.g_p167 = 0.181375;		% PGM_keq
rInfo.g_p168 = 5;		% PGM_k_pg3
rInfo.g_p169 = 1;		% PGM_k_pg2
rInfo.g_p170 = 420;		% PGM_Vmax
rInfo.g_p171 = 0.054477;		% EN_keq
rInfo.g_p172 = 1;		% EN_k_pep
rInfo.g_p173 = 1;		% EN_k_pg2
rInfo.g_p174 = 35.994;		% EN_Vmax
rInfo.g_p175 = 3.5;		% PK_n
rInfo.g_p176 = 3.5;		% PK_n_p
rInfo.g_p177 = 1.8;		% PK_n_fbp
rInfo.g_p178 = 1.8;		% PK_n_fbp_p
rInfo.g_p179 = 1;		% PK_alpha
rInfo.g_p180 = 1.1;		% PK_alpha_p
rInfo.g_p181 = 1;		% PK_alpha_end
rInfo.g_p182 = 0.00016;		% PK_k_fbp
rInfo.g_p183 = 0.00035;		% PK_k_fbp_p
rInfo.g_p184 = 0.58;		% PK_k_pep
rInfo.g_p185 = 1.1;		% PK_k_pep_p
rInfo.g_p186 = 0.08;		% PK_k_pep_end
rInfo.g_p187 = 2.3;		% PK_k_adp
rInfo.g_p188 = 0.08;		% PK_base_act
rInfo.g_p189 = 0.04;		% PK_base_act_p
rInfo.g_p190 = 46.2;		% PK_Vmax
rInfo.g_p191 = 0;		% PK_f
rInfo.g_p192 = 0;		% PK_f_p
rInfo.g_p193 = 0;		% PK_alpha_inp
rInfo.g_p194 = 0;		% PK_alpha_p_inp
rInfo.g_p195 = 0;		% PK_pep_inp
rInfo.g_p196 = 0;		% PK_pep_p_inp
rInfo.g_p197 = 0;		% PK_native
rInfo.g_p198 = 0;		% PK_phospho
rInfo.g_p199 = 336.957;		% PEPCK_keq
rInfo.g_p200 = 0.237;		% PEPCK_k_pep
rInfo.g_p201 = 0.0921;		% PEPCK_k_gdp
rInfo.g_p202 = 25.5;		% PEPCK_k_co2
rInfo.g_p203 = 0.0055;		% PEPCK_k_oaa
rInfo.g_p204 = 0.0222;		% PEPCK_k_gtp
rInfo.g_p205 = 0;		% PEPCK_Vmax
rInfo.g_p206 = 546;		% PEPCKM_Vmax
rInfo.g_p207 = 0.22;		% PC_k_atp
rInfo.g_p208 = 0.22;		% PC_k_pyr
rInfo.g_p209 = 3.2;		% PC_k_co2
rInfo.g_p210 = 0.015;		% PC_k_acoa
rInfo.g_p211 = 2.5;		% PC_n
rInfo.g_p212 = 168;		% PC_Vmax
rInfo.g_p213 = 0.000278321;		% LDH_keq
rInfo.g_p214 = 0.495;		% LDH_k_pyr
rInfo.g_p215 = 31.98;		% LDH_k_lac
rInfo.g_p216 = 0.984;		% LDH_k_nad
rInfo.g_p217 = 0.027;		% LDH_k_nadh
rInfo.g_p218 = 12.6;		% LDH_Vmax
rInfo.g_p219 = 1;		% LACT_keq
rInfo.g_p220 = 0.8;		% LACT_k_lac
rInfo.g_p221 = 5.418;		% LACT_Vmax
rInfo.g_p222 = 1;		% PYRTM_keq
rInfo.g_p223 = 0.1;		% PYRTM_k_pyr
rInfo.g_p224 = 42;		% PYRTM_Vmax
rInfo.g_p225 = 1;		% PEPTM_keq
rInfo.g_p226 = 0.1;		% PEPTM_k_pep
rInfo.g_p227 = 33.6;		% PEPTM_Vmax
rInfo.g_p228 = 0.025;		% PDH_k_pyr
rInfo.g_p229 = 0.013;		% PDH_k_coa
rInfo.g_p230 = 0.05;		% PDH_k_nad
rInfo.g_p231 = 0.035;		% PDH_ki_acoa
rInfo.g_p232 = 0.036;		% PDH_ki_nadh
rInfo.g_p233 = 5;		% PDH_alpha_nat
rInfo.g_p234 = 1;		% PDH_alpha_p
rInfo.g_p235 = 13.44;		% PDH_Vmax
rInfo.g_p236 = 0;		% PDH_base
rInfo.g_p237 = 0;		% PDH_nat
rInfo.g_p238 = 0;		% PDH_p
rInfo.g_p239 = 266599;		% CS_keq
rInfo.g_p240 = 0.002;		% CS_k_oaa
rInfo.g_p241 = 0.016;		% CS_k_acoa
rInfo.g_p242 = 0.42;		% CS_k_cit
rInfo.g_p243 = 0.07;		% CS_k_coa
rInfo.g_p244 = 4.2;		% CS_Vmax
rInfo.g_p245 = 1;		% NDKGTPM_keq
rInfo.g_p246 = 1.33;		% NDKGTPM_k_atp
rInfo.g_p247 = 0.042;		% NDKGTPM_k_adp
rInfo.g_p248 = 0.15;		% NDKGTPM_k_gtp
rInfo.g_p249 = 0.031;		% NDKGTPM_k_gdp
rInfo.g_p250 = 420;		% NDKGTPM_Vmax
rInfo.g_p251 = 0;		% OAAFLX_Vmax
rInfo.g_p252 = 0;		% ACOAFLX_Vmax
rInfo.g_p253 = 0;		% CITFLX_Vmax
rInfo.g_p254 = 0;		% HGP
rInfo.g_p255 = 0;		% GNG
rInfo.g_p256 = 0;		% GLY

% Boundary Conditions 
rInfo.g_p257 = 2.8;		% atp = atp[Concentration]
rInfo.g_p258 = 0.8;		% adp = adp[Concentration]
rInfo.g_p259 = 0.16;		% amp = amp[Concentration]
rInfo.g_p260 = 1.22;		% nad = nad[Concentration]
rInfo.g_p261 = 0.00056;		% nadh = nadh[Concentration]
rInfo.g_p262 = 5;		% phos = phos[Concentration]
rInfo.g_p263 = 5;		% co2 = co2[Concentration]
rInfo.g_p264 = 0;		% h2o = h2o[Concentration]
rInfo.g_p265 = 0;		% h = h[Concentration]
rInfo.g_p266 = 3;		% glc_ext = glc_ext[Concentration]
rInfo.g_p267 = 1.2;		% lac_ext = lac_ext[Concentration]
rInfo.g_p268 = 5;		% co2_mito = co2_mito[Concentration]
rInfo.g_p269 = 5;		% phos_mito = phos_mito[Concentration]
rInfo.g_p270 = 0.04;		% acoa_mito = acoa_mito[Concentration]
rInfo.g_p271 = 0.32;		% cit_mito = cit_mito[Concentration]
rInfo.g_p272 = 2.8;		% atp_mito = atp_mito[Concentration]
rInfo.g_p273 = 0.8;		% adp_mito = adp_mito[Concentration]
rInfo.g_p274 = 0.055;		% coa_mito = coa_mito[Concentration]
rInfo.g_p275 = 0.24;		% nadh_mito = nadh_mito[Concentration]
rInfo.g_p276 = 0.98;		% nad_mito = nad_mito[Concentration]
rInfo.g_p277 = 0;		% h2o_mito = h2o_mito[Concentration]
rInfo.g_p278 = 0;		% h_mito = h_mito[Concentration]

if (nargin == 0)

    % set initial conditions
   xdot(1) = 0.27*vol__cyto;		% utp = utp [Concentration]
   xdot(2) = 0.09*vol__cyto;		% udp = udp [Concentration]
   xdot(3) = 0.29*vol__cyto;		% gtp = gtp [Concentration]
   xdot(4) = 0.1*vol__cyto;		% gdp = gdp [Concentration]
   xdot(5) = 0.008*vol__cyto;		% pp = pp [Concentration]
   xdot(6) = 0.012*vol__cyto;		% glc1p = glc1p [Concentration]
   xdot(7) = 0.38*vol__cyto;		% udpglc = udpglc [Concentration]
   xdot(8) = 250*vol__cyto;		% glyglc = glyglc [Concentration]
   xdot(9) = 5*vol__cyto;		% glc = glc [Concentration]
   xdot(10) = 0.12*vol__cyto;		% glc6p = glc6p [Concentration]
   xdot(11) = 0.05*vol__cyto;		% fru6p = fru6p [Concentration]
   xdot(12) = 0.02*vol__cyto;		% fru16bp = fru16bp [Concentration]
   xdot(13) = 0.004*vol__cyto;		% fru26bp = fru26bp [Concentration]
   xdot(14) = 0.1*vol__cyto;		% grap = grap [Concentration]
   xdot(15) = 0.03*vol__cyto;		% dhap = dhap [Concentration]
   xdot(16) = 0.3*vol__cyto;		% bpg13 = bpg13 [Concentration]
   xdot(17) = 0.27*vol__cyto;		% pg3 = pg3 [Concentration]
   xdot(18) = 0.03*vol__cyto;		% pg2 = pg2 [Concentration]
   xdot(19) = 0.15*vol__cyto;		% pep = pep [Concentration]
   xdot(20) = 0.1*vol__cyto;		% pyr = pyr [Concentration]
   xdot(21) = 0.01*vol__cyto;		% oaa = oaa [Concentration]
   xdot(22) = 0.5*vol__cyto;		% lac = lac [Concentration]
   xdot(23) = 0.01*vol__mito;		% oaa_mito = oaa_mito [Concentration]
   xdot(24) = 0.15*vol__mito;		% pep_mito = pep_mito [Concentration]
   xdot(25) = 0.1*vol__mito;		% pyr_mito = pyr_mito [Concentration]
   xdot(26) = 0.29*vol__mito;		% gtp_mito = gtp_mito [Concentration]
   xdot(27) = 0.1*vol__mito;		% gdp_mito = gdp_mito [Concentration]

   % reaction info structure
   rInfo.stoich = [
      0 0 0 0 0 -1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 1 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 -1 -1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 1 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      1 -1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 1 -1 -1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 1 0 0 0 0 0 0 0 0 -1 1 -1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 1 0 0 0 0 0 1 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 -1 0 -1 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 1 0 0 0 0 0 -1 0 1 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 -1 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 1 0 -1 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 1 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0 0 0
   ];

   rInfo.floatingSpecies = {		% Each row: [Species Name, Initial Value, isAmount (1 for amount, 0 for concentration)]
      'utp' , 0.27, 0
      'udp' , 0.09, 0
      'gtp' , 0.29, 0
      'gdp' , 0.1, 0
      'pp' , 0.008, 0
      'glc1p' , 0.012, 0
      'udpglc' , 0.38, 0
      'glyglc' , 250, 0
      'glc' , 5, 0
      'glc6p' , 0.12, 0
      'fru6p' , 0.05, 0
      'fru16bp' , 0.02, 0
      'fru26bp' , 0.004, 0
      'grap' , 0.1, 0
      'dhap' , 0.03, 0
      'bpg13' , 0.3, 0
      'pg3' , 0.27, 0
      'pg2' , 0.03, 0
      'pep' , 0.15, 0
      'pyr' , 0.1, 0
      'oaa' , 0.01, 0
      'lac' , 0.5, 0
      'oaa_mito' , 0.01, 0
      'pep_mito' , 0.15, 0
      'pyr_mito' , 0.1, 0
      'gtp_mito' , 0.29, 0
      'gdp_mito' , 0.1, 0
   };

   rInfo.compartments = {		% Each row: [Compartment Name, Value]
      'extern' , 0
      'cyto' , 0
      'mito' , 0
   };

   rInfo.params = {		% Each row: [Parameter Name, Value]
      'Vcyto' , 1
      'Vliver' , 1.5
      'fliver' , 0.583333
      'bodyweight' , 70
      'sec_per_min' , 60
      'conversion_factor' , 0
      'nadh_tot' , 0
      'atp_tot' , 0
      'utp_tot' , 0
      'gtp_tot' , 0
      'nadh_mito_tot' , 0
      'atp_mito_tot' , 0
      'gtp_mito_tot' , 0
      'x_ins1' , 818.9
      'x_ins2' , 0
      'x_ins3' , 8.6
      'x_ins4' , 4.2
      'ins' , 0
      'ins_norm' , 0
      'x_glu1' , 190
      'x_glu2' , 37.9
      'x_glu3' , 3.01
      'x_glu4' , 6.4
      'glu' , 0
      'glu_norm' , 0
      'x_epi1' , 6090
      'x_epi2' , 100
      'x_epi3' , 3.1
      'x_epi4' , 8.4
      'epi' , 0
      'epi_norm' , 0
      'K_val' , 0.1
      'epi_f' , 0.8
      'K_ins' , 0
      'K_glu' , 0
      'K_epi' , 0
      'gamma' , 0
      'scale' , 0
      'scale_gly' , 0
      'scale_glyglc' , 0
      'GLUT2_keq' , 1
      'GLUT2_km' , 42
      'GLUT2_Vmax' , 420
      'GK_n_gkrp' , 2
      'GK_km_glc1' , 15
      'GK_km_fru6p' , 0.01
      'GK_b' , 0.7
      'GK_n' , 1.6
      'GK_km_glc' , 7.5
      'GK_km_atp' , 0.26
      'GK_Vmax' , 25.2
      'GK_gc_free' , 0
      'G6PASE_km_glc6p' , 2
      'G6PASE_Vmax' , 18.9
      'GPI_keq' , 0.517061
      'GPI_km_glc6p' , 0.182
      'GPI_km_fru6p' , 0.071
      'GPI_Vmax' , 420
      'G16PI_keq' , 15.7176
      'G16PI_km_glc6p' , 0.67
      'G16PI_km_glc1p' , 0.045
      'G16PI_Vmax' , 100
      'UPGASE_keq' , 0.312238
      'UPGASE_km_utp' , 0.563
      'UPGASE_km_glc1p' , 0.172
      'UPGASE_km_udpglc' , 0.049
      'UPGASE_km_pp' , 0.166
      'UPGASE_Vmax' , 80
      'PPASE_km_pp' , 0.005
      'PPASE_Vmax' , 2.4
      'GS_C' , 500
      'GS_k1_max' , 0.2
      'GS_k1_nat' , 0.224
      'GS_k2_nat' , 0.1504
      'GS_k1_phospho' , 3.003
      'GS_k2_phospho' , 0.09029
      'GS_Vmax' , 13.2
      'GS_storage_factor' , 0
      'GS_k_udpglc_native' , 0
      'GS_k_udpglc_phospho' , 0
      'GS_native' , 0
      'GS_phospho' , 0
      'GP_keq' , 0.211827
      'GP_k_glyc_native' , 4.8
      'GP_k_glyc_phospho' , 2.7
      'GP_k_glc1p_native' , 120
      'GP_k_glc1p_phospho' , 2
      'GP_k_p_native' , 300
      'GP_k_p_phospho' , 5
      'GP_ki_glc_phospho' , 5
      'GP_ka_amp_native' , 1
      'GP_base_amp_native' , 0.03
      'GP_max_amp_native' , 0.3
      'GP_Vmax' , 6.8
      'GP_C' , 0
      'GP_k1_max' , 0
      'GP_fmax' , 0
      'GP_vmax_native' , 0
      'GP_native' , 0
      'GP_vmax_phospho' , 0
      'GP_phospho' , 0
      'NDKGTP_keq' , 1
      'NDKGTP_km_atp' , 1.33
      'NDKGTP_km_adp' , 0.042
      'NDKGTP_km_gtp' , 0.15
      'NDKGTP_km_gdp' , 0.031
      'NDKGTP_Vmax' , 0
      'NDKUTP_keq' , 1
      'NDKUTP_km_atp' , 1.33
      'NDKUTP_km_adp' , 0.042
      'NDKUTP_km_utp' , 16
      'NDKUTP_km_udp' , 0.19
      'NDKUTP_Vmax' , 2940
      'AK_keq' , 0.24739
      'AK_km_atp' , 0.09
      'AK_km_amp' , 0.08
      'AK_km_adp' , 0.11
      'AK_Vmax' , 0
      'PFK2_n_native' , 1.3
      'PFK2_n_phospho' , 2.1
      'PFK2_k_fru6p_native' , 0.016
      'PFK2_k_fru6p_phospho' , 0.05
      'PFK2_k_atp_native' , 0.28
      'PFK2_k_atp_phospho' , 0.65
      'PFK2_Vmax' , 0.0042
      'PFK2_native' , 0
      'PFK2_phospho' , 0
      'FBP2_km_fru26bp_native' , 0.01
      'FBP2_ki_fru6p_native' , 0.0035
      'FBP2_km_fru26bp_phospho' , 0.0005
      'FBP2_ki_fru6p_phospho' , 0.01
      'FBP2_Vmax' , 0.126
      'FBP2_native' , 0
      'FBP2_phospho' , 0
      'PFK1_km_atp' , 0.111
      'PFK1_km_fru6p' , 0.077
      'PFK1_ki_fru6p' , 0.012
      'PFK1_ka_fru26bp' , 0.001
      'PFK1_Vmax' , 7.182
      'FBP1_ki_fru26bp' , 0.001
      'FBP1_km_fru16bp' , 0.0013
      'FBP1_Vmax' , 4.326
      'ALD_keq' , 9.76299e-05
      'ALD_km_fru16bp' , 0.0071
      'ALD_km_dhap' , 0.0364
      'ALD_km_grap' , 0.0071
      'ALD_ki1_grap' , 0.0572
      'ALD_ki2_grap' , 0.176
      'ALD_Vmax' , 420
      'TPI_keq' , 0.054477
      'TPI_km_dhap' , 0.59
      'TPI_km_grap' , 0.42
      'TPI_Vmax' , 420
      'GAPDH_keq' , 0.0867799
      'GAPDH_k_nad' , 0.05
      'GAPDH_k_grap' , 0.005
      'GAPDH_k_p' , 3.9
      'GAPDH_k_nadh' , 0.0083
      'GAPDH_k_bpg13' , 0.0035
      'GAPDH_Vmax' , 420
      'PGK_keq' , 6.95864
      'PGK_k_adp' , 0.35
      'PGK_k_atp' , 0.48
      'PGK_k_bpg13' , 0.002
      'PGK_k_pg3' , 1.2
      'PGK_Vmax' , 420
      'PGM_keq' , 0.181375
      'PGM_k_pg3' , 5
      'PGM_k_pg2' , 1
      'PGM_Vmax' , 420
      'EN_keq' , 0.054477
      'EN_k_pep' , 1
      'EN_k_pg2' , 1
      'EN_Vmax' , 35.994
      'PK_n' , 3.5
      'PK_n_p' , 3.5
      'PK_n_fbp' , 1.8
      'PK_n_fbp_p' , 1.8
      'PK_alpha' , 1
      'PK_alpha_p' , 1.1
      'PK_alpha_end' , 1
      'PK_k_fbp' , 0.00016
      'PK_k_fbp_p' , 0.00035
      'PK_k_pep' , 0.58
      'PK_k_pep_p' , 1.1
      'PK_k_pep_end' , 0.08
      'PK_k_adp' , 2.3
      'PK_base_act' , 0.08
      'PK_base_act_p' , 0.04
      'PK_Vmax' , 46.2
      'PK_f' , 0
      'PK_f_p' , 0
      'PK_alpha_inp' , 0
      'PK_alpha_p_inp' , 0
      'PK_pep_inp' , 0
      'PK_pep_p_inp' , 0
      'PK_native' , 0
      'PK_phospho' , 0
      'PEPCK_keq' , 336.957
      'PEPCK_k_pep' , 0.237
      'PEPCK_k_gdp' , 0.0921
      'PEPCK_k_co2' , 25.5
      'PEPCK_k_oaa' , 0.0055
      'PEPCK_k_gtp' , 0.0222
      'PEPCK_Vmax' , 0
      'PEPCKM_Vmax' , 546
      'PC_k_atp' , 0.22
      'PC_k_pyr' , 0.22
      'PC_k_co2' , 3.2
      'PC_k_acoa' , 0.015
      'PC_n' , 2.5
      'PC_Vmax' , 168
      'LDH_keq' , 0.000278321
      'LDH_k_pyr' , 0.495
      'LDH_k_lac' , 31.98
      'LDH_k_nad' , 0.984
      'LDH_k_nadh' , 0.027
      'LDH_Vmax' , 12.6
      'LACT_keq' , 1
      'LACT_k_lac' , 0.8
      'LACT_Vmax' , 5.418
      'PYRTM_keq' , 1
      'PYRTM_k_pyr' , 0.1
      'PYRTM_Vmax' , 42
      'PEPTM_keq' , 1
      'PEPTM_k_pep' , 0.1
      'PEPTM_Vmax' , 33.6
      'PDH_k_pyr' , 0.025
      'PDH_k_coa' , 0.013
      'PDH_k_nad' , 0.05
      'PDH_ki_acoa' , 0.035
      'PDH_ki_nadh' , 0.036
      'PDH_alpha_nat' , 5
      'PDH_alpha_p' , 1
      'PDH_Vmax' , 13.44
      'PDH_base' , 0
      'PDH_nat' , 0
      'PDH_p' , 0
      'CS_keq' , 266599
      'CS_k_oaa' , 0.002
      'CS_k_acoa' , 0.016
      'CS_k_cit' , 0.42
      'CS_k_coa' , 0.07
      'CS_Vmax' , 4.2
      'NDKGTPM_keq' , 1
      'NDKGTPM_k_atp' , 1.33
      'NDKGTPM_k_adp' , 0.042
      'NDKGTPM_k_gtp' , 0.15
      'NDKGTPM_k_gdp' , 0.031
      'NDKGTPM_Vmax' , 420
      'OAAFLX_Vmax' , 0
      'ACOAFLX_Vmax' , 0
      'CITFLX_Vmax' , 0
      'HGP' , 0
      'GNG' , 0
      'GLY' , 0
   };

   rInfo.boundarySpecies = {		% Each row: [Species Name, Initial Value, isAmount (1 for amount, 0 for concentration)]
      'atp' , 2.8, 0
      'adp' , 0.8, 0
      'amp' , 0.16, 0
      'nad' , 1.22, 0
      'nadh' , 0.00056, 0
      'phos' , 5, 0
      'co2' , 5, 0
      'h2o' , 0, 0
      'h' , 0, 0
      'glc_ext' , 3, 0
      'lac_ext' , 1.2, 0
      'co2_mito' , 5, 0
      'phos_mito' , 5, 0
      'acoa_mito' , 0.04, 0
      'cit_mito' , 0.32, 0
      'atp_mito' , 2.8, 0
      'adp_mito' , 0.8, 0
      'coa_mito' , 0.055, 0
      'nadh_mito' , 0.24, 0
      'nad_mito' , 0.98, 0
      'h2o_mito' , 0, 0
      'h_mito' , 0, 0
   };

   rInfo.rateRules = { 		 % List of variables involved in a rate rule 
   };

else

    % listOfRules
   rInfo.g_p256 = -G16PI*rInfo.g_p6;
   rInfo.g_p255 = GPI*rInfo.g_p6;
   rInfo.g_p254 = GLUT2*rInfo.g_p6;
   rInfo.g_p236 = rInfo.g_p39*rInfo.g_p235*(x(25)/vol__mito)/((x(25)/vol__mito)+rInfo.g_p228)*(rInfo.g_p276/vol__mito)/((rInfo.g_p276/vol__mito)+rInfo.g_p230*(1+(rInfo.g_p275/vol__mito)/rInfo.g_p232))*(rInfo.g_p274/vol__mito)/((rInfo.g_p274/vol__mito)+rInfo.g_p229*(1+(rInfo.g_p270/vol__mito)/rInfo.g_p231));
   rInfo.g_p237 = rInfo.g_p236*rInfo.g_p233;
   rInfo.g_p238 = rInfo.g_p236*rInfo.g_p234;
   rInfo.g_p192 = pow((x(12)/vol__cyto),rInfo.g_p178)/(pow(rInfo.g_p183,rInfo.g_p178)+pow((x(12)/vol__cyto),rInfo.g_p178));
   rInfo.g_p191 = pow((x(12)/vol__cyto),rInfo.g_p177)/(pow(rInfo.g_p182,rInfo.g_p177)+pow((x(12)/vol__cyto),rInfo.g_p177));
   rInfo.g_p194 = (1-rInfo.g_p192)*(rInfo.g_p180-rInfo.g_p181)+rInfo.g_p181;
   rInfo.g_p193 = (1-rInfo.g_p191)*(rInfo.g_p179-rInfo.g_p181)+rInfo.g_p181;
   rInfo.g_p196 = (1-rInfo.g_p192)*(rInfo.g_p185-rInfo.g_p186)+rInfo.g_p186;
   rInfo.g_p195 = (1-rInfo.g_p191)*(rInfo.g_p184-rInfo.g_p186)+rInfo.g_p186;
   rInfo.g_p198 = rInfo.g_p39*rInfo.g_p190*rInfo.g_p194*pow((x(19)/vol__cyto),rInfo.g_p176)/(pow(rInfo.g_p196,rInfo.g_p176)+pow((x(19)/vol__cyto),rInfo.g_p176))*(rInfo.g_p258/vol__cyto)/((rInfo.g_p258/vol__cyto)+rInfo.g_p187)*(rInfo.g_p189+(1-rInfo.g_p189)*rInfo.g_p192);
   rInfo.g_p197 = rInfo.g_p39*rInfo.g_p190*rInfo.g_p193*pow((x(19)/vol__cyto),rInfo.g_p175)/(pow(rInfo.g_p195,rInfo.g_p175)+pow((x(19)/vol__cyto),rInfo.g_p175))*(rInfo.g_p258/vol__cyto)/((rInfo.g_p258/vol__cyto)+rInfo.g_p187)*(rInfo.g_p188+(1-rInfo.g_p188)*rInfo.g_p191);
   rInfo.g_p134 = rInfo.g_p39*rInfo.g_p132/(1+(x(11)/vol__cyto)/rInfo.g_p131)*(x(13)/vol__cyto)/(rInfo.g_p130+(x(13)/vol__cyto));
   rInfo.g_p133 = rInfo.g_p39*rInfo.g_p132/(1+(x(11)/vol__cyto)/rInfo.g_p129)*(x(13)/vol__cyto)/(rInfo.g_p128+(x(13)/vol__cyto));
   rInfo.g_p127 = rInfo.g_p39*rInfo.g_p125*pow((x(11)/vol__cyto),rInfo.g_p120)/(pow((x(11)/vol__cyto),rInfo.g_p120)+pow(rInfo.g_p122,rInfo.g_p120))*(rInfo.g_p257/vol__cyto)/((rInfo.g_p257/vol__cyto)+rInfo.g_p124);
   rInfo.g_p126 = rInfo.g_p39*rInfo.g_p125*pow((x(11)/vol__cyto),rInfo.g_p119)/(pow((x(11)/vol__cyto),rInfo.g_p119)+pow(rInfo.g_p121,rInfo.g_p119))*(rInfo.g_p257/vol__cyto)/((rInfo.g_p257/vol__cyto)+rInfo.g_p123);
   rInfo.g_p97 = (1+rInfo.g_p96)*(x(8)/vol__cyto)/((x(8)/vol__cyto)+rInfo.g_p96*rInfo.g_p95);
   rInfo.g_p100 = rInfo.g_p40*rInfo.g_p94*rInfo.g_p97*exp(-log(2)/rInfo.g_p90*(x(9)/vol__cyto));
   rInfo.g_p98 = rInfo.g_p40*rInfo.g_p94*rInfo.g_p97*(rInfo.g_p92+(rInfo.g_p93-rInfo.g_p92)*(rInfo.g_p259/vol__cyto)/((rInfo.g_p259/vol__cyto)+rInfo.g_p91));
   rInfo.g_p99 = rInfo.g_p98/(rInfo.g_p84*rInfo.g_p88)*((x(8)/vol__cyto)*(rInfo.g_p262/vol__cyto)-(x(6)/vol__cyto)/rInfo.g_p83)/((1+(x(8)/vol__cyto)/rInfo.g_p84)*(1+(rInfo.g_p262/vol__cyto)/rInfo.g_p88)+1+(x(6)/vol__cyto)/rInfo.g_p86-1);
   rInfo.g_p101 = rInfo.g_p100/(rInfo.g_p85*rInfo.g_p89)*((x(8)/vol__cyto)*(rInfo.g_p262/vol__cyto)-(x(6)/vol__cyto)/rInfo.g_p83)/((1+(x(8)/vol__cyto)/rInfo.g_p85)*(1+(rInfo.g_p262/vol__cyto)/rInfo.g_p89)+1+(x(6)/vol__cyto)/rInfo.g_p87-1);
   rInfo.g_p80 = rInfo.g_p75/((x(10)/vol__cyto)+rInfo.g_p76);
   rInfo.g_p79 = rInfo.g_p73/((x(10)/vol__cyto)+rInfo.g_p74);
   rInfo.g_p78 = (1+rInfo.g_p72)*(rInfo.g_p71-(x(8)/vol__cyto))/(rInfo.g_p71-(x(8)/vol__cyto)+rInfo.g_p72*rInfo.g_p71);
   rInfo.g_p81 = rInfo.g_p40*rInfo.g_p77*rInfo.g_p78*(x(7)/vol__cyto)/(rInfo.g_p79+(x(7)/vol__cyto));
   rInfo.g_p82 = rInfo.g_p40*rInfo.g_p77*rInfo.g_p78*(x(7)/vol__cyto)/(rInfo.g_p80+(x(7)/vol__cyto));
   rInfo.g_p52 = pow((x(9)/vol__cyto),rInfo.g_p44)/(pow((x(9)/vol__cyto),rInfo.g_p44)+pow(rInfo.g_p45,rInfo.g_p44))*(1-rInfo.g_p47*(x(11)/vol__cyto)/((x(11)/vol__cyto)+rInfo.g_p46));
   rInfo.g_p30 = rInfo.g_p27+(rInfo.g_p26-rInfo.g_p27)*(1-pow((rInfo.g_p266/vol__extern),rInfo.g_p29)/(pow((rInfo.g_p266/vol__extern),rInfo.g_p29)+pow(rInfo.g_p28,rInfo.g_p29)));
   rInfo.g_p31 = maximum(0,rInfo.g_p30-rInfo.g_p27);
   rInfo.g_p24 = rInfo.g_p21+(rInfo.g_p20-rInfo.g_p21)*(1-pow((rInfo.g_p266/vol__extern),rInfo.g_p23)/(pow((rInfo.g_p266/vol__extern),rInfo.g_p23)+pow(rInfo.g_p22,rInfo.g_p23)));
   rInfo.g_p25 = maximum(0,rInfo.g_p24-rInfo.g_p21);
   rInfo.g_p18 = rInfo.g_p15+(rInfo.g_p14-rInfo.g_p15)*pow((rInfo.g_p266/vol__extern),rInfo.g_p17)/(pow((rInfo.g_p266/vol__extern),rInfo.g_p17)+pow(rInfo.g_p16,rInfo.g_p17));
   rInfo.g_p19 = maximum(0,rInfo.g_p18-rInfo.g_p15);
   rInfo.g_p37 = 0.5*(1-rInfo.g_p19/(rInfo.g_p19+rInfo.g_p34)+maximum(rInfo.g_p25/(rInfo.g_p25+rInfo.g_p35),rInfo.g_p33*rInfo.g_p31/(rInfo.g_p31+rInfo.g_p36)));
   rInfo.g_p13 = (x(26)/vol__mito)+(x(27)/vol__mito);
   rInfo.g_p12 = (rInfo.g_p272/vol__mito)+(rInfo.g_p273/vol__mito);
   rInfo.g_p11 = (rInfo.g_p275/vol__mito)+(rInfo.g_p276/vol__mito);
   rInfo.g_p10 = (x(3)/vol__cyto)+(x(4)/vol__cyto);
   rInfo.g_p9 = (x(1)/vol__cyto)+(x(2)/vol__cyto)+(x(7)/vol__cyto);
   rInfo.g_p8 = (rInfo.g_p257/vol__cyto)+(rInfo.g_p258/vol__cyto)+(rInfo.g_p259/vol__cyto);
   rInfo.g_p7 = (rInfo.g_p261/vol__cyto)+(rInfo.g_p260/vol__cyto);

    % calculate rates of change
   R0 = rInfo.g_p39*rInfo.g_p43/rInfo.g_p42*((rInfo.g_p266/vol__extern)-(x(9)/vol__cyto)/rInfo.g_p41)/(1+(rInfo.g_p266/vol__extern)/rInfo.g_p42+(x(9)/vol__cyto)/rInfo.g_p42);
   R1 = rInfo.g_p39*rInfo.g_p51*rInfo.g_p52*(rInfo.g_p257/vol__cyto)/(rInfo.g_p50+(rInfo.g_p257/vol__cyto))*pow((x(9)/vol__cyto),rInfo.g_p48)/(pow((x(9)/vol__cyto),rInfo.g_p48)+pow(rInfo.g_p49,rInfo.g_p48));
   R2 = rInfo.g_p39*rInfo.g_p54*(x(10)/vol__cyto)/(rInfo.g_p53+(x(10)/vol__cyto));
   R3 = rInfo.g_p39*rInfo.g_p58/rInfo.g_p56*((x(10)/vol__cyto)-(x(11)/vol__cyto)/rInfo.g_p55)/(1+(x(10)/vol__cyto)/rInfo.g_p56+(x(11)/vol__cyto)/rInfo.g_p57);
   R4 = rInfo.g_p40*rInfo.g_p62/rInfo.g_p61*((x(6)/vol__cyto)-(x(10)/vol__cyto)/rInfo.g_p59)/(1+(x(6)/vol__cyto)/rInfo.g_p61+(x(10)/vol__cyto)/rInfo.g_p60);
   R5 = rInfo.g_p40*rInfo.g_p68/(rInfo.g_p64*rInfo.g_p65)*((x(1)/vol__cyto)*(x(6)/vol__cyto)-(x(7)/vol__cyto)*(x(5)/vol__cyto)/rInfo.g_p63)/((1+(x(1)/vol__cyto)/rInfo.g_p64)*(1+(x(6)/vol__cyto)/rInfo.g_p65)+(1+(x(7)/vol__cyto)/rInfo.g_p66)*(1+(x(5)/vol__cyto)/rInfo.g_p67)-1);
   R6 = rInfo.g_p40*rInfo.g_p70*(x(5)/vol__cyto)/((x(5)/vol__cyto)+rInfo.g_p69);
   R7 = (1-rInfo.g_p37)*rInfo.g_p81+rInfo.g_p37*rInfo.g_p82;
   R8 = (1-rInfo.g_p37)*rInfo.g_p99+rInfo.g_p37*rInfo.g_p101;
   R9 = rInfo.g_p39*rInfo.g_p107/(rInfo.g_p103*rInfo.g_p106)*((rInfo.g_p257/vol__cyto)*(x(4)/vol__cyto)-(rInfo.g_p258/vol__cyto)*(x(3)/vol__cyto)/rInfo.g_p102)/((1+(rInfo.g_p257/vol__cyto)/rInfo.g_p103)*(1+(x(4)/vol__cyto)/rInfo.g_p106)+(1+(rInfo.g_p258/vol__cyto)/rInfo.g_p104)*(1+(x(3)/vol__cyto)/rInfo.g_p105)-1);
   R10 = rInfo.g_p40*rInfo.g_p113/(rInfo.g_p109*rInfo.g_p112)*((rInfo.g_p257/vol__cyto)*(x(2)/vol__cyto)-(rInfo.g_p258/vol__cyto)*(x(1)/vol__cyto)/rInfo.g_p108)/((1+(rInfo.g_p257/vol__cyto)/rInfo.g_p109)*(1+(x(2)/vol__cyto)/rInfo.g_p112)+(1+(rInfo.g_p258/vol__cyto)/rInfo.g_p110)*(1+(x(1)/vol__cyto)/rInfo.g_p111)-1);
   R11 = rInfo.g_p39*rInfo.g_p118/(rInfo.g_p115*rInfo.g_p116)*((rInfo.g_p257/vol__cyto)*(rInfo.g_p259/vol__cyto)-(rInfo.g_p258/vol__cyto)*(rInfo.g_p258/vol__cyto)/rInfo.g_p114)/((1+(rInfo.g_p257/vol__cyto)/rInfo.g_p115)*(1+(rInfo.g_p259/vol__cyto)/rInfo.g_p116)+(1+(rInfo.g_p258/vol__cyto)/rInfo.g_p117)*(1+(rInfo.g_p258/vol__cyto)/rInfo.g_p117)-1);
   R12 = (1-rInfo.g_p37)*rInfo.g_p126+rInfo.g_p37*rInfo.g_p127;
   R13 = (1-rInfo.g_p37)*rInfo.g_p133+rInfo.g_p37*rInfo.g_p134;
   R14 = rInfo.g_p39*rInfo.g_p139*(1-1/(1+(x(13)/vol__cyto)/rInfo.g_p138))*(x(11)/vol__cyto)*(rInfo.g_p257/vol__cyto)/(rInfo.g_p137*rInfo.g_p135+rInfo.g_p136*(rInfo.g_p257/vol__cyto)+rInfo.g_p135*(x(11)/vol__cyto)+(rInfo.g_p257/vol__cyto)*(x(11)/vol__cyto));
   R15 = rInfo.g_p39*rInfo.g_p142/(1+(x(13)/vol__cyto)/rInfo.g_p140)*(x(12)/vol__cyto)/((x(12)/vol__cyto)+rInfo.g_p141);
   R16 = rInfo.g_p39*rInfo.g_p149/rInfo.g_p144*((x(12)/vol__cyto)-(x(14)/vol__cyto)*(x(15)/vol__cyto)/rInfo.g_p143)/(1+(x(12)/vol__cyto)/rInfo.g_p144+(x(14)/vol__cyto)/rInfo.g_p147+(x(15)/vol__cyto)*((x(14)/vol__cyto)+rInfo.g_p146)/(rInfo.g_p145*rInfo.g_p147)+(x(12)/vol__cyto)*(x(14)/vol__cyto)/(rInfo.g_p144*rInfo.g_p148));
   R17 = rInfo.g_p39*rInfo.g_p153/rInfo.g_p151*((x(15)/vol__cyto)-(x(14)/vol__cyto)/rInfo.g_p150)/(1+(x(15)/vol__cyto)/rInfo.g_p151+(x(14)/vol__cyto)/rInfo.g_p152);
   R18 = rInfo.g_p39*rInfo.g_p160/(rInfo.g_p155*rInfo.g_p156*rInfo.g_p157)*((rInfo.g_p260/vol__cyto)*(x(14)/vol__cyto)*(rInfo.g_p262/vol__cyto)-(x(16)/vol__cyto)*(rInfo.g_p261/vol__cyto)/rInfo.g_p154)/((1+(rInfo.g_p260/vol__cyto)/rInfo.g_p155)*(1+(x(14)/vol__cyto)/rInfo.g_p156)*(1+(rInfo.g_p262/vol__cyto)/rInfo.g_p157)+(1+(rInfo.g_p261/vol__cyto)/rInfo.g_p158)*(1+(x(16)/vol__cyto)/rInfo.g_p159)-1);
   R19 = rInfo.g_p39*rInfo.g_p166/(rInfo.g_p162*rInfo.g_p164)*((rInfo.g_p258/vol__cyto)*(x(16)/vol__cyto)-(rInfo.g_p257/vol__cyto)*(x(17)/vol__cyto)/rInfo.g_p161)/((1+(rInfo.g_p258/vol__cyto)/rInfo.g_p162)*(1+(x(16)/vol__cyto)/rInfo.g_p164)+(1+(rInfo.g_p257/vol__cyto)/rInfo.g_p163)*(1+(x(17)/vol__cyto)/rInfo.g_p165)-1);
   R20 = rInfo.g_p39*rInfo.g_p170*((x(17)/vol__cyto)-(x(18)/vol__cyto)/rInfo.g_p167)/((x(17)/vol__cyto)+rInfo.g_p168*(1+(x(18)/vol__cyto)/rInfo.g_p169));
   R21 = rInfo.g_p39*rInfo.g_p174*((x(18)/vol__cyto)-(x(19)/vol__cyto)/rInfo.g_p171)/((x(18)/vol__cyto)+rInfo.g_p173*(1+(x(19)/vol__cyto)/rInfo.g_p172));
   R22 = (1-rInfo.g_p37)*rInfo.g_p197+rInfo.g_p37*rInfo.g_p198;
   R23 = rInfo.g_p39*rInfo.g_p205/(rInfo.g_p203*rInfo.g_p204)*((x(21)/vol__cyto)*(x(3)/vol__cyto)-(x(19)/vol__cyto)*(x(4)/vol__cyto)*(rInfo.g_p263/vol__cyto)/rInfo.g_p199)/((1+(x(21)/vol__cyto)/rInfo.g_p203)*(1+(x(3)/vol__cyto)/rInfo.g_p204)+(1+(x(19)/vol__cyto)/rInfo.g_p200)*(1+(x(4)/vol__cyto)/rInfo.g_p201)*(1+(rInfo.g_p263/vol__cyto)/rInfo.g_p202)-1);
   R24 = rInfo.g_p39*rInfo.g_p206/(rInfo.g_p203*rInfo.g_p204)*((x(23)/vol__mito)*(x(26)/vol__mito)-(x(24)/vol__mito)*(x(27)/vol__mito)*(rInfo.g_p268/vol__mito)/rInfo.g_p199)/((1+(x(23)/vol__mito)/rInfo.g_p203)*(1+(x(26)/vol__mito)/rInfo.g_p204)+(1+(x(24)/vol__mito)/rInfo.g_p200)*(1+(x(27)/vol__mito)/rInfo.g_p201)*(1+(rInfo.g_p268/vol__mito)/rInfo.g_p202)-1);
   R25 = rInfo.g_p39*rInfo.g_p212*(rInfo.g_p272/vol__mito)/(rInfo.g_p207+(rInfo.g_p272/vol__mito))*(x(25)/vol__mito)/(rInfo.g_p208+(x(25)/vol__mito))*(rInfo.g_p268/vol__mito)/(rInfo.g_p209+(rInfo.g_p268/vol__mito))*pow((rInfo.g_p270/vol__mito),rInfo.g_p211)/(pow((rInfo.g_p270/vol__mito),rInfo.g_p211)+pow(rInfo.g_p210,rInfo.g_p211));
   R26 = rInfo.g_p39*rInfo.g_p218/(rInfo.g_p214*rInfo.g_p217)*((x(20)/vol__cyto)*(rInfo.g_p261/vol__cyto)-(x(22)/vol__cyto)*(rInfo.g_p260/vol__cyto)/rInfo.g_p213)/((1+(rInfo.g_p261/vol__cyto)/rInfo.g_p217)*(1+(x(20)/vol__cyto)/rInfo.g_p214)+(1+(x(22)/vol__cyto)/rInfo.g_p215)*(1+(rInfo.g_p260/vol__cyto)/rInfo.g_p216)-1);
   R27 = rInfo.g_p39*rInfo.g_p221/rInfo.g_p220*((rInfo.g_p267/vol__extern)-(x(22)/vol__cyto)/rInfo.g_p219)/(1+(rInfo.g_p267/vol__extern)/rInfo.g_p220+(x(22)/vol__cyto)/rInfo.g_p220);
   R28 = rInfo.g_p39*rInfo.g_p224/rInfo.g_p223*((x(20)/vol__cyto)-(x(25)/vol__mito)/rInfo.g_p222)/(1+(x(20)/vol__cyto)/rInfo.g_p223+(x(25)/vol__mito)/rInfo.g_p223);
   R29 = rInfo.g_p39*rInfo.g_p227/rInfo.g_p226*((x(24)/vol__mito)-(x(19)/vol__cyto)/rInfo.g_p225)/(1+(x(19)/vol__cyto)/rInfo.g_p226+(x(24)/vol__mito)/rInfo.g_p226);
   R30 = (1-rInfo.g_p37)*rInfo.g_p237+rInfo.g_p37*rInfo.g_p238;
   R31 = rInfo.g_p39*rInfo.g_p244/(rInfo.g_p240*rInfo.g_p241)*((rInfo.g_p270/vol__mito)*(x(23)/vol__mito)-(rInfo.g_p271/vol__mito)*(rInfo.g_p274/vol__mito)/rInfo.g_p239)/((1+(rInfo.g_p270/vol__mito)/rInfo.g_p241)*(1+(x(23)/vol__mito)/rInfo.g_p240)+(1+(rInfo.g_p271/vol__mito)/rInfo.g_p242)*(1+(rInfo.g_p274/vol__mito)/rInfo.g_p243)-1);
   R32 = rInfo.g_p39*rInfo.g_p250/(rInfo.g_p246*rInfo.g_p249)*((rInfo.g_p272/vol__mito)*(x(27)/vol__mito)-(rInfo.g_p273/vol__mito)*(x(26)/vol__mito)/rInfo.g_p245)/((1+(rInfo.g_p272/vol__mito)/rInfo.g_p246)*(1+(x(27)/vol__mito)/rInfo.g_p249)+(1+(rInfo.g_p273/vol__mito)/rInfo.g_p247)*(1+(x(26)/vol__mito)/rInfo.g_p248)-1);
   R33 = rInfo.g_p39*rInfo.g_p251;
   R34 = rInfo.g_p39*rInfo.g_p252;
   R35 = rInfo.g_p39*rInfo.g_p253;

   xdot = [
      - R5 + R10
      + R7 - R10
      + R9 - R23
      - R9 + R23
      + R5 - R6
      - R4 - R5 + R8
      + R5 - R7
      + R7 - R8
      + R0 - R1 + R2
      + R1 - R2 - R3 + R4
      + R3 - R12 + R13 - R14 + R15
      + R14 - R15 - R16
      + R12 - R13
      + R16 + R17 - R18
      + R16 - R17
      + R18 - R19
      + R19 - R20
      + R20 - R21
      + R21 - R22 + R23 + R29
      + R22 - R26 - R28
      - R23
      + R26 + R27
      - R24 + R25 - R31 + R33
      + R24 - R29
      - R25 + R28 - R30
      - R24 + R32
      + R24 - R32
   ];
end;



% listOfUserDefinedFunctions
function z = maximum(x,y)
    z = piecewise(x, gt(x, y), y);

function z = minimum(x,y)
    z = piecewise(x, lt(x, y), y);

%listOfSupportedFunctions
function z = pow (x,y) 
    z = x^y; 


function z = sqr (x) 
    z = x*x; 


function z = piecewise(varargin) 
		numArgs = nargin; 
		result = 0; 
		foundResult = 0; 
		for k=1:2: numArgs-1 
			if varargin{k+1} == 1 
				result = varargin{k}; 
				foundResult = 1; 
				break; 
			end 
		end 
		if foundResult == 0 
			result = varargin{numArgs}; 
		end 
		z = result; 


function z = gt(a,b) 
   if a > b 
   	  z = 1; 
   else 
      z = 0; 
   end 


function z = lt(a,b) 
   if a < b 
   	  z = 1; 
   else 
      z = 0; 
   end 


function z = geq(a,b) 
   if a >= b 
   	  z = 1; 
   else 
      z = 0; 
   end 


function z = leq(a,b) 
   if a <= b 
   	  z = 1; 
   else 
      z = 0; 
   end 


function z = neq(a,b) 
   if a ~= b 
   	  z = 1; 
   else 
      z = 0; 
   end 


function z = and(varargin) 
		result = 1;		 
		for k=1:nargin 
		   if varargin{k} ~= 1 
		      result = 0; 
		      break; 
		   end 
		end 
		z = result; 


function z = or(varargin) 
		result = 0;		 
		for k=1:nargin 
		   if varargin{k} ~= 0 
		      result = 1; 
		      break; 
		   end 
		end 
		z = result; 


function z = xor(varargin) 
		foundZero = 0; 
		foundOne = 0; 
		for k = 1:nargin 
			if varargin{k} == 0 
			   foundZero = 1; 
			else 
			   foundOne = 1; 
			end 
		end 
		if foundZero && foundOne 
			z = 1; 
		else 
		  z = 0; 
		end 
		 


function z = not(a) 
   if a == 1 
   	  z = 0; 
   else 
      z = 1; 
   end 


function z = root(a,b) 
	z = a^(1/b); 
 

