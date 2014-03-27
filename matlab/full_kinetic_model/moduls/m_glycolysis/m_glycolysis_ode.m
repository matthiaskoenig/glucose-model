function [V, TD] = m_glycolysis_model_ode(S, t, mpars)
%% MODEL_GLYCOLYSIS Rate laws for integration
%  Definition of the rate laws and calculation of the fluxes for the given
%  parameters and concentrations. This function is called by the ODE
%  integration routine.
%
%  Some enzymes are interconvertible due to phosphorylation /
%  dephosphorylation mechanism. The phophorylation status gamma is
%  regulated via hormonal plasma concentrations of insulin, glucagon and 
%  epinephrine.
%  
%   Returns fluxes and equilibriums of the reactions for given
%   concentrations S and parameters mpars.
%
%
%   S                   vector of concentrations
%   options.Vmax        vector of Vmax values for rate equations
%   options.const_c     vector of constant concentrations
%   options.insulin     function handle to insulin response curve
%   options.glucagon    function handle to glucagon response curve
%   options.glucagon    function handle to epinephrine response curve
%   options.gamma       function handle to gamma response
%
% Units
%   time: minutes     [min] ,  
%   concentration     [mM] = [mmol/l] 
%   volume:           [l]
%   fluxes:           [µmol/(min kg)] kg body weight
%
%   author: Matthias Koenig 
%           Charite Berlin
%           Computational Systems Biochemistry Berlin
%           matthias.koenig@charite.de
%   date:   110211
%


%% Set constant concentrations

%{
for k=1:size(mpars.const_c, 1)
   if mpars.const_c(k,1) == 1
       S(k) = mpars.const_c(k,2);
   end
end
%}

%% Concentrations
atp         = S(1);
adp         = S(2);
amp         = S(3);
utp         = S(4);
udp         = S(5);
gtp         = S(6);
gdp         = S(7);
nad         = S(8);
nadh        = S(9);
p           = S(10);
pp          = S(11);
co2         = S(13);
glc1p       = S(15);
udpglc      = S(16);
glyglc      = S(17);
glc         = S(18);
glc6p       = S(19);
fru6p       = S(20);
fru16bp     = S(21);
fru26bp     = S(22);
grap        = S(23);
dhap        = S(24);
bpg13       = S(25);
pg3         = S(26);
pg2         = S(27);
pep         = S(28);
pyr         = S(29);
oaa         = S(30);
lac         = S(31);
glc_ext     = S(32);
lac_ext     = S(33);
co2_mito    = S(34);
p_mito      = S(35);
oaa_mito    = S(36);
pep_mito    = S(37);
acoa_mito   = S(38);
pyr_mito    = S(39);
cit_mito    = S(40);
atp_mito    = S(41);
adp_mito    = S(42);
gtp_mito    = S(43);
gdp_mito    = S(44);
coa_mito    = S(45);
nadh_mito   = S(46);
nad_mito    = S(47);

%% Test for negative concentrations

% TODO : analyse possble problems in more detail
if any(find(S<0))
   warning('Negative concentrations !!!')
   for k=1:length(S)
      if S(k) < 0
          S(k)
          k
          S(k) = 0;
      end
   end
end


%% Gamma switch (phosphorylated form)
%  Call the external defined insulin, glucagon and epinephrine functions
%       options.insulin
%       options.glucagon
%       options.epinephrine
%  If an external gamma function is defined, use this function instead

switch class(mpars.gamma)
    case 'double'
        % no gamma defined in options (calculate from the hormones)
        % depending if epinephrine is defined or not it is included in the
        % calculation or not
        switch class(mpars.epinephrine)
            case 'double'
                gamma = gamma_f(mpars.insulin(glc_ext), mpars.glucagon(glc_ext));
            case 'function_handle'
                gamma = gamma_f(mpars.insulin(glc_ext), mpars.glucagon(glc_ext), mpars.epinephrine(glc_ext));
        end
        
    case 'function_handle'
        % gamma defined in options, use this gamma function 
        gamma = mpars.gamma(glc_ext);
end

    % all switches are handled identically
    gamma_gs = gamma;       % glycogen synthase
    gamma_gp = gamma;       % glycogen phosphorylase
    gamma_pfk2 = gamma;     % pfk2
    gamma_fbp2 = gamma;     % fbp2
    gamma_pk = gamma;       % pyruvate kinase
    gamma_pdh = gamma;      % pyruvate dehydrogenase complex


%% Vmax values
Vmax = mpars.vmax;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Glucose import/export             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% *********************************** %
% v1 : GLUT2 - Transporter
% *********************************** %
% T0011_cytoYext
% GLUT 2
% 1 C00031_ext -> 1 C00031_cyto
% glucose_ext -> glucose
% glc_ext -> glc
% facilitated diffusion, low affinity, high-turnover transport system
% Lebergue2009, Elliot1982, Gold1991, Ciaraldi1986, Thorens1996,
% Nelson2008
% reversibel Michaelis Menten Kinetics; symmetrical transport of glucose by
% GLUT2
%
v1_deltag = 0;                              % [kJ/mol]
v1_keq = keq(v1_deltag);                    % []
v1_td = (glc_ext - glc/v1_keq);

v1_km = 42;                                 % [mM]
v1 = Vmax(1)/v1_km * v1_td /(1 + glc_ext/v1_km + glc/v1_km);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Glucokinase / G6Pase              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% *********************************** %
% v2 : Glucokinase
% *********************************** %
% R00299_2.7.1.2_cyto
% ATP:D-glucose 6-phosphotransferase
% C00002 + C00031 <=> C00008 + C00092	
% glc + atp -> glc6P + adp 
% Delta G0' = -16.7 kJ/mol 
% Morito1994, Agius2008
% GK has sigmoidal kinetics in glucose with high km for glucose with n
% about 1.5 - 1.8.
% Hyperobolic in the ATP response. 
% In addition the activity is regulated by GKRP. The bound GKRP + GK has
% lower affinity for glucose (14mM) and is translocated in the
% nucleus.equation (glucokinase binding protein)
% So only the free GK in the cytosol is active. The binding of GKRP and GK
% is dependent on glucose, fructose and fructose-6p.
% No product inhibition of glucose_6p to the GK.
% Dependency on glucose and fructose_6p from 
v2_deltag = -16.7;                          % [kJ/mol]
v2_keq = keq(v2_deltag);                    
v2_td = (glc*atp - glc6p*adp / v2_keq);

% Inhibition by GCRP
v2_n_gkrp = 2;
v2_km_glc1 = 15;         %[mM]
v2_km_fru6p = 0.010;     %[mM]
v2_b = 0.7;

v2_n = 1.6;
v2_km_glc = 7.5;            % [mM]
v2_km_atp = 0.26;           % [mM]

v2_gc_free = (glc^v2_n_gkrp / (glc^v2_n_gkrp + v2_km_glc1^v2_n_gkrp) ) * (1 - v2_b*fru6p/(fru6p + v2_km_fru6p));
v2 = Vmax(2) * v2_gc_free * atp/(v2_km_atp + atp) * glc^v2_n/(glc^v2_n + v2_km_glc^v2_n);


% *********************************** %
% v3 : D-Glucose-6-phosphate Phosphatase
% *********************************** %
% R00303_3.1.3.9_cyto
% D-Glucose-6-phosphate phosphohydrolase
% C00092 + C00001 <=> C00031 + C00009
% glucose_6P + H2O -> glucose + P
% Pubmed: PMID: 11879177 intracellular glucose-6-p concentration 0.05 - 1
% [Reczek1982, Arion1971, Nordlie1969]
v3_deltag = -13.8;                          % [kJ/mol]
v3_keq = keq(v3_deltag);                    
v3_td = (glc6p - glc*p/v3_keq);

v3_km_glc6p = 2;            % [mM]
v3 = Vmax(3) * glc6p / (v3_km_glc6p + glc6p);


% *********************************** %
% v4 : D-Glucose-6-phosphate Isomerase
% *********************************** %
% R00771_5.3.1.9_cyto	D-Glucose-6-phosphate ketol-isomerase	C00092 <=> C00085	
% glucose_6P <-> fructose_6P

v4_deltag = 1.7;                          % [kJ/mol]
v4_keq = keq(v4_deltag);                    
v4_td = (glc6p - fru6p/v4_keq);

v4_km_glc6p  = 0.182;       % [mM]
v4_km_fru6p = 0.071;        % [mM]
v4 = Vmax(4)/v4_km_glc6p * v4_td / (1 + glc6p/v4_km_glc6p + fru6p/v4_km_fru6p);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Glycogen metabolism               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% *********************************** %
% v5 : Glucose 1-phosphate 1,6-phosphomutase
% *********************************** %
% R00959_5.4.2.2_cyto	
% alpha-D-Glucose 1-phosphate 1,6-phosphomutase	
% 1 C00103 <=> 1 C00092
% glucose_1p <-> glucose_6p
%
% Similar to other isomerases. Reversible only depending on Km for
% substrate, product and the Keq of the reaction.
% Find km values for the reaction !!!
% [Quick1974]
% The equilibrium lies strongly toward G6P (Keq ) 28
%or Keq ) 25),5,6 and the reaction proceeds through a ping-pong
%mechanism involving aspartyl-phosphoenzyme (PGMP) and
%-glucose-1,6-bisphosphate (G16BP) intermediates 
% [Kashiwaya1994]
v5_deltag = -7.1;                          % [kJ/mol]
v5_keq = keq(v5_deltag);                    
v5_td = (glc1p - glc6p/v5_keq);

v5_km_glc6p  = 0.67;       % [mM]
v5_km_glc1p = 0.045;        % [mM]
v5 = Vmax(5)/v5_km_glc1p * v5_td / (1 + glc1p/v5_km_glc1p + glc6p/v5_km_glc6p);


% *********************************** %
% v6 : UTP:Glucose-1-phosphate uridylyltransferase (UPGase)
% *********************************** %
% R00289_2.7.7.9_cyto	
% UTP:alpha-D-glucose-1-phosphate uridylyltransferase	
% C00075 + C00103 <=> C00013 + C00029																																																																																																																																																																																																																																																												
% UTP + glucose_1P <-> UDP_glucose + PP
% Compare the different measurements; integrate the UTP inhibition.
% [Chang1995, Enzymes of sugar activation, Turnquist1974]

v6_km_utp = 0.563;       % mM   [ 0.200, 0.048]
v6_km_glc1p = 0.172;     % mM [0.050, 0.095]
v6_km_udpglc = 0.049;    % mM [0.060, 0.048]
v6_km_pp = 0.166;         % mM     [0.084, 0.210]

v6_deltag = 3.0;                          % [kJ/mol]
v6_keq = keq(v6_deltag);                  % keq = 0.31 % 0.28 - 0.34                    
v6_td = (utp * glc1p - udpglc * pp/v6_keq);

v6 = Vmax(6)/(v6_km_utp*v6_km_glc1p) * v6_td / ( (1 + utp/v6_km_utp)*(1 + glc1p/v6_km_glc1p) + (1 + udpglc/v6_km_udpglc)*(1 + pp/v6_km_pp) - 1 );

% *********************************** %
% v7 : Pyrophosphate phosphohydrolase (PPase)
% *********************************** %
% R00004_3.6.1.1_cyto	
% Pyrophosphate phosphohydrolase	
% C00013 + C00001 <=> 2 C00009
% pp + h2o -> 2 p
% Low km for pp for very low pp concentations in the cell.
% much higher km value for human form 0.25 [Reichert1974]
v7_deltag = -19.1;                          % [kJ/mol] [-19.2 Guyn1974]
v7_keq = keq(v7_deltag);
v7_td = (pp - p*p/v7_keq);
v7_km_pp = 0.005;                           %[Tamura1980]
v7 = Vmax(7) * pp/(pp + v7_km_pp);


% *********************************** %
% v8 : Glycogen synthase (GS)
% *********************************** %
% P0001_cyto
% Glycogen synthase	
% udpglc -> udp + glycogen
% irreversible reaction

% x = [0 0.05 0.07 0.20 7.2] % mM glucose 6p
% D = [33 0 20 8.9 0.3] % Km values for udpglc Synthase D
% I = [1.5 1.1 0 0 0.2] % km values for udpglc Synthase I

% [1] hard glycogen capacity point
% The storage capacity of the hepatocyte for glycogen is limited.
% With increasing glycogen content the rate drops.
v8_keq = keq(0);    % ! no data found, assumption of 0
v8_td = (udpglc - udp*glyglc/v8_keq);

v8_C = 500;             % [mM] maximal storage capacity for glycogen per volume liver
v8_k1_max = 0.2;

v8_k1_nat = 0.224;
v8_k2_nat = 0.1504;

v8_k1_phospho = 3.003; 
v8_k2_phospho = 0.09029;

v8_storage_factor = (1+v8_k1_max) * (v8_C - glyglc)/( (v8_C - glyglc) + v8_k1_max * v8_C);

v8_k_udpglc_native = v8_k1_nat / (glc6p + v8_k2_nat);
v8_k_udpglc_phospho = v8_k1_phospho / (glc6p + v8_k2_phospho);

v8_native = Vmax(8) * v8_storage_factor * udpglc / (v8_k_udpglc_native + udpglc);
v8_phospho = Vmax(8) * v8_storage_factor * udpglc / (v8_k_udpglc_phospho + udpglc); 
v8 = (1 - gamma_gs)* v8_native + gamma_gs * v8_phospho;



% *********************************** %
% v9 : Glykogen-Phosphorylase (GP)
% *********************************** %
% v9	P0002_cyto	Glykogen-Phosphorylase	1 C90001 + 1 C00001 <=> 1 C00031																																																																																																																																																																																																																																																												
% glycogen + P -> glucose_1P
% Different regulation of the a Form (phosphorylated, active Form) and the 
% unphosphorylated native b-Form.
% [Lederer1976, Tan1975, Stalmans1981, Stalmans1975, Ercan-Fang2002,
% Maddaiah1966 ]

v9_deltag = 4.0;                          % [kJ/mol]
v9_keq = keq(v9_deltag);                  % (0.21 - 0.14)                      
v9_td = (glyglc*p - glc1p/v9_keq);

v9_k_glyc_native = 4.8;     % [mM]  
v9_k_glyc_phospho = 2.7;    % [mM]  
v9_k_glc1p_native = 120;    % [mM]  
v9_k_glc1p_phospho = 2;     % [mM]
v9_k_p_native = 300;        % [mM]  
v9_k_p_phospho = 5;         % [mM]

v9_ki_glc_phospho = 5;      % [mM]
v9_ka_amp_native = 1;       % [mM]
v9_base_amp_native = 0.03;
v9_max_amp_native = 0.30;

% Dependency on available glycogen

v9_C = v8_C;             % [mM] maximal storage capacity for glycogen per volume liver
v9_k1_max = v8_k1_max;
v9_fmax = (1+v9_k1_max) * glyglc /( glyglc + v9_k1_max * v9_C);

% AMP dependency of the inactive Form
v9_vmax_native = Vmax(9) * v9_fmax * (v9_base_amp_native + (v9_max_amp_native - v9_base_amp_native) *amp/(amp+v9_ka_amp_native));
v9_native = v9_vmax_native/(v9_k_glyc_native*v9_k_p_native) * v9_td / ( (1 + glyglc/v9_k_glyc_native)*(1 + p/v9_k_p_native) + (1 + glc1p/v9_k_glc1p_native)  - 1 );

% Exponential decrease in the activity of the active a form depending on
% glucose with a halfmaximal effect at 5mM glucose.
v9_vmax_phospho = Vmax(9) * v9_fmax * exp(-log(2)/v9_ki_glc_phospho * glc);
v9_phospho = v9_vmax_phospho/(v9_k_glyc_phospho*v9_k_p_phospho) * v9_td / ( (1 + glyglc/v9_k_glyc_phospho)*(1 + p/v9_k_p_phospho) + (1 + glc1p/v9_k_glc1p_phospho)  - 1 );

v9 = (1 - gamma_gp) * v9_native + gamma_gp * v9_phospho;


% *********************************** %
% v10 : Nucleoside-diphosphate kinase (ATP, GTP)
% *********************************** %
% ATP + GDP <-> ADP + GTP
% The concentrations of the nucleotides are coupled via the NDK reaction
% [Fukuchi1994, Kimura1988, Lam1986]
v10_deltag = 0;        % [kJ/mol]  
v10_keq = keq(v10_deltag); 
v10_td = (atp*gdp - adp*gtp/v10_keq);

v10_km_atp = 1.33;       % [mM]
v10_km_adp = 0.042;      % [mM]
v10_km_gtp = 0.15;       % [mM]
v10_km_gdp = 0.031;      % [mM]

v10 = Vmax(10) / (v10_km_atp * v10_km_gdp) * v10_td / ( (1 + atp/v10_km_atp)*(1 + gdp/v10_km_gdp) + (1 + adp/v10_km_adp)*(1 + gtp/v10_km_gtp) - 1) ;


% *********************************** %
% v11 : Nucleoside-diphosphate kinase (ATP, UTP)
% *********************************** %
% ATP + UDP <-> ADP + UTP
% [Fukuchi1994, Kimura1988, Lam1986]
v11_deltag = 0;        % [kJ/mol]  
v11_keq = keq(v11_deltag); 
v11_td = (atp*udp - adp*utp/v11_keq);

v11_km_atp = 1.33;      % [mM]
v11_km_adp = 0.042;     % [mM]
v11_km_utp = 16;        % [mM]
v11_km_udp = 0.19;      % [mM]

v11 = Vmax(11) / (v11_km_atp * v11_km_udp) * v11_td / ( (1 + atp/v11_km_atp)*(1 + udp/v11_km_udp) + (1 + adp/v11_km_adp)*(1 + utp/v11_km_utp) - 1) ;


% *********************************** %
% v12 : ATP:AMP phosphotransferase (Adenylatkinase)
% *********************************** %
% v12	R00127_2.7.4.3_cyto	ATP:AMP phosphotransferase	C00002 + C00020 <=> 2 C00008
% ATP + AMP -> 2 ADP
v12_deltag = 3.6;        % [kJ/mol]  
v12_keq = keq(v12_deltag); 
v12_td = (atp*amp - adp*adp/v12_keq);

v12_km_atp = 0.09;         % [mM]
v12_km_amp = 0.08;         % [mM]
v12_km_adp = 0.11;         % [mM]

v12 = Vmax(12) / (v12_km_atp * v12_km_amp) * v12_td / ( (1+atp/v12_km_atp)*(1+amp/v12_km_amp) + (1+adp/v12_km_adp)*(1+adp/v12_km_adp) - 1); 

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
% v13 : PFK2
% *********************************** %
% v13	R02732_2.7.1.105_cyto	ATP:D-fructose-6-phosphate 2-phosphotransferase	1 C00002 + 1 C00085 <=> 1 C00008 + 1 C00665																																																																																																																																																																																																																																																												
% very sensitive to fructose6p, ATP not so important
% fru6p + atp -> fru26bp + adp
% Flux is combination of the both kinetics depending on the phosphorylation
% state

v13_deltag = -14.2;                          % [kJ/mol]
v13_keq = keq(v13_deltag);                    
v13_td = (fru6p * atp - fru26bp * adp/v13_keq);

v13_n_native = 1.3;  
v13_n_phospho = 2.1;             
v13_k_fru6p_native = 0.016;      % [mM]
v13_k_fru6p_phospho = 0.050;     % [mM]
v13_k_atp_native = 0.28;         % [mM]
v13_k_atp_phospho = 0.65;        % [mM]

v13_native = Vmax(13) * power(fru6p, v13_n_native) / (power(fru6p, v13_n_native) + power(v13_k_fru6p_native, v13_n_native)) * (atp / (atp + v13_k_atp_native));
v13_phospho = Vmax(13) * power(fru6p, v13_n_phospho) / (power(fru6p, v13_n_phospho) + power(v13_k_fru6p_phospho, v13_n_phospho)) * (atp / (atp + v13_k_atp_phospho));

v13 = (1 - gamma_pfk2) * v13_native + gamma_pfk2 * v13_phospho;

% *********************************** %
% v14 : FBPase2
% *********************************** %
% v14	R02731_3.1.3.46_cyto	D-Fructose-2,6-bisphosphate 2-phosphohydrolase	1 C00665 + 1 C00001 <=> 1 C00085 + 1 C00009																																																																																																																																																																																																																																																												
% what kind of inhibition.
% fru26bp -> fru6p + p 
v14_deltag = -16.3;                          % [kJ/mol]
v14_keq = keq(v14_deltag);                    
v14_td = (fru26bp - fru6p*p/v14_keq);

v14_km_fru26bp_native = 0.010;      %[mM]
v14_ki_fru6p_native = 0.0035;      %[mM]
v14_km_fru26bp_phospho = 0.0005;      %[mM]
v14_ki_fru6p_phospho = 0.010;      %[mM]

v14_native = Vmax(14)/(1 + fru6p/v14_ki_fru6p_native) * fru26bp / ( v14_km_fru26bp_native + fru26bp);
v14_phospho = Vmax(14)/(1 + fru6p/v14_ki_fru6p_phospho) * fru26bp / ( v14_km_fru26bp_phospho + fru26bp);
v14 = (1-gamma_fbp2) * v14_native + gamma_fbp2 * v14_phospho;


% *********************************** %
% v15 : PFK1
% *********************************** %
% v15	R00756_2.7.1.11_cyto	ATP:D-fructose-6-phosphate 1-phosphotransferase	C00002 + C00085 <=> C00008 + C00354																																																																																																																																																																																																																																																												
% regulation with fructose_26P missing
% fru6p + atp -> fru16bp + adp
v15_deltag = -14.2;                          % [kJ/mol]
v15_keq = keq(v15_deltag);                    
v15_td = (fru6p*atp - fru16bp*atp/v15_keq);

v15_km_atp = 0.111;                % [mM] [b]
v15_km_fru6p = 0.077;              % [mM] [a]
v15_ki_fru6p = 0.012;              % [mM] [ai]
v15_ka_fru26bp = 0.001;                % [mM]

% ! alternative without inhibition ?
v15 = Vmax(15) * (1 - 1./(1 + fru26bp/v15_ka_fru26bp)) * fru6p*atp / (v15_ki_fru6p*v15_km_atp + v15_km_fru6p*atp + v15_km_atp*fru6p + atp*fru6p);


% *********************************** %
% v16 : FBP1
% *********************************** %
% v16	R00762_3.1.3.11_cyto	D-Fructose-1,6-bisphosphate 1-phosphohydrolase	C00354 + C00001 <=> C00085 + C00009																																																																																																																																																																																																																																																												
% has to be controlled.
% fru16bp + h2o -> fru6p + p
v16_deltag = -16.3;                          % [kJ/mol]
v16_keq = keq(v16_deltag);                    
v16_td = (fru16bp - fru6p*p/v16_keq);

v16_ki_fru26bp = 0.001;               % [mM]
v16_km_fru16bp = 0.0013;              % [mM]
v16 = Vmax(16) / (1 + fru26bp/v16_ki_fru26bp) * fru16bp/(fru16bp + v16_km_fru16bp);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Downstream PFK                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% *********************************** %
% v17 : Aldolase
% *********************************** %
% v17	R01068_4.1.2.13_cyto	D-Fructose-1,6-bisphosphate D-glyceraldehyde-3-phosphate-lyase	C00354 <=> C00111 + C00118																																																																																																																																																																																																																																																												
% fru16bp -> grap + dhap

v17_deltag = 23.8;                          % [kJ/mol]
v17_keq = keq(v17_deltag); 
v17_td = (fru16bp - grap*dhap/v17_keq);
% keq = 0.114;                 %[mM] erythrocyte

v17_km_fru16bp = 0.0071;         %[mM]
v17_km_dhap = 0.0364;            %[mM]
v17_km_grap = 0.0071;            %[mM]
v17_ki1_grap = 0.0572;           %[mM]
v17_ki2_grap = 0.176;            %[mM]

v17 = Vmax(17)/v17_km_fru16bp * v17_td/(1 + fru16bp/v17_km_fru16bp + grap/v17_ki1_grap + dhap*(grap + v17_km_grap)/(v17_km_dhap*v17_ki1_grap) + (fru16bp*grap)/(v17_km_fru16bp*v17_ki2_grap));


% *********************************** %
% v18 : Triosephosphate Isomerase
% *********************************** %
% v18	R01015_5.3.1.1_cyto	D-Glyceraldehyde-3-phosphate ketol-isomerase	C00118 <=> C00111																																																																																																																																																																																																																																																												
% equilibrium far on side of the dhap
% dhap <-> grap

v18_deltag = 7.5;                          % [kJ/mol]
% v18_keq = 0.0407;                %[mM] erythrocyte model
v18_keq = keq(v18_deltag); 
v18_td = (dhap - grap/v18_keq); 

v18_km_dhap = 0.59;             %[mM]
v18_km_grap = 0.42;             %[mM]
v18 = Vmax(18)/v18_km_dhap * v18_td / (1 + dhap/v18_km_dhap + grap/v18_km_grap);


% *********************************** %
% v19 : D-Glyceraldehyde-3-phosphate:NAD+ oxidoreductase (GAPDH)
% *********************************** %
% v19	R01061_1.2.1.12_cyto	D-Glyceraldehyde-3-phosphate:NAD+ oxidoreductase(phosphorylating)	C00118 + C00009 + C00003 <=> C00236 + C00004 + C00080																																																																																																																																																																																																																																																												
% grap + p + nad <-> bpg13 + nadh + h
v19_deltag = 6.3;        % [kJ/mol]  
v19_keq = keq(v19_deltag); 
%v19_keq = 0.000192;         % [mM]
v19_td = ( nad * grap * p - bpg13*nadh/v19_keq); 

v19_k_nad = 0.05;        % [mM]
v19_k_grap = 0.005;      % [mM]
v19_k_p = 3.9;           % [mM]
v19_k_nadh = 0.0083;     % [mM]
v19_k_bpg13 = 0.0035;     % [mM]
v19 = Vmax(19) / (v19_k_nad*v19_k_grap*v19_k_p) * v19_td / ( (1 + nad/v19_k_nad) * (1+grap/v19_k_grap) * (1 + p/v19_k_p) + (1+nadh/v19_k_nadh)*(1+bpg13/v19_k_bpg13) - 1);


% *********************************** %
% v20 : Phosphoglycerate Kinase (PGK) ATP:3-phospho-D-glycerate 1-phosphotransferase
% *********************************** %
% v20	R01512_2.7.2.3_cyto	ATP:3-phospho-D-glycerate 1-phosphotransferase	C00002 + C00197 <=> C00008 + C00236																																																																																																																																																																																																																																																												
% adp + bpg13 -> atp + pg3

%v20_deltag = -18.5;        % [kJ/mol]  
v20_deltag = -5;        % [kJ/mol]  

v20_keq = keq(v20_deltag); 
%v20_keq = 1455;         % [mM] (1310)
v20_td = (adp*bpg13 - atp*pg3/v20_keq); 

v20_k_adp = 0.35;       %[mM]
v20_k_atp = 0.48;       %[mM]
v20_k_bpg13 = 0.002;    %[mM]
v20_k_pg3 = 1.2;        %[mM]

v20 = Vmax(20) / (v20_k_adp*v20_k_bpg13) * v20_td / ((1 + adp/v20_k_adp)*(1+bpg13/v20_k_bpg13) + (1+atp/v20_k_atp)*(1+pg3/v20_k_pg3) - 1); 


% *********************************** %
% v21 : 2-Phospho-D-glycerate 2,3-phosphomutase (PGM)
% *********************************** %
% v21	R01518_5.4.2.1_cyto	2-Phospho-D-glycerate 2,3-phosphomutase	C00631 <=> C00197																																																																																																																																																																																																																																																												
% pg3 <-> pg2
v21_deltag = 4.4;        % [kJ/mol]  
v21_keq = keq(v21_deltag); 
%v21_keq = 0.145;         % [mM] (0.1814)
v21_td = (pg3 - pg2/v21_keq); 

v21_k_pg3 = 5;      % [mM]
v21_k_pg2 = 1;      % [mM]
v21 = Vmax(21) * v21_td / (pg3 + v21_k_pg3 *(1 + pg2/v21_k_pg2));


% *********************************** %
% v22 : 2-Phospho-D-glucerate hydro-lyase (enolase)
% *********************************** %
% v22	R00658_4.2.1.11_cyto	2-Phospho-D-glucerate hydro-lyase	C00631 <=> C00074 + C00001
% pg2 <-> pep
v22_deltag = 7.5;        % [kJ/mol]  
v22_keq = keq(v22_deltag); 
%v22_keq = 1.7;         % (0.0545)
v22_td = (pg2 - pep/v22_keq); 

v22_k_pep = 1;      % [mM]
v22_k_pg2 = 1;      % [mM]

v22 = Vmax(22) * v22_td / (pg2 + v22_k_pg2 *(1 + pep/v22_k_pep));

% *********************************** %
% v23 : Pyruvatkinase (PK)
% *********************************** %
% v23	R00200_2.7.1.40_cyto	ATP:pyruvate O2-phosphotransferase	C00002 + C00022 <=> C00008 + C00074																																																																																																																																																																																																																																																												
v23_deltag = -31.4;        % [kJ/mol]  
v23_keq = keq(v23_deltag);
v23_td = (pep*adp - atp*pyr/v23_keq);            

v23_n = 3.5;
v23_n_p = 3.5;
v23_n_fbp = 1.8;
v23_n_fbp_p = 1.8;

v23_alpha = 1.0;  
v23_alpha_p = 1.1;
v23_alpha_end = 1.0;

v23_k_fbp = 0.16E-3;
v23_k_fbp_p = 0.35E-3;
v23_k_pep = 0.58;
v23_k_pep_p = 1.10;
v23_k_pep_end = 0.08;
v23_k_adp = 2.3;        % [mM]

v23_base_act = 0.08;
v23_base_act_p = 0.04;

v23_f = fru16bp^v23_n_fbp / (v23_k_fbp^v23_n_fbp + fru16bp^v23_n_fbp);
v23_f_p = fru16bp^v23_n_fbp_p / (v23_k_fbp_p^v23_n_fbp_p + fru16bp^v23_n_fbp_p);

v23_alpha_inp = (1 - v23_f) * (v23_alpha - v23_alpha_end) + v23_alpha_end;
v23_alpha_p_inp = (1 - v23_f_p) * (v23_alpha_p - v23_alpha_end) + v23_alpha_end;
v23_pep_inp = (1 - v23_f) * (v23_k_pep - v23_k_pep_end) + v23_k_pep_end;
v23_pep_p_inp = (1 - v23_f_p) * (v23_k_pep_p - v23_k_pep_end) + v23_k_pep_end;

v23_native =  Vmax(23) * v23_alpha_inp * pep^v23_n/(v23_pep_inp.^v23_n + pep^v23_n) * adp/(adp + v23_k_adp) * ( v23_base_act + (1-v23_base_act) *v23_f );
v23_phospho = Vmax(23) * v23_alpha_p_inp * pep^v23_n_p/(v23_pep_p_inp.^v23_n_p + pep^v23_n_p) * adp/(adp + v23_k_adp) * ( v23_base_act_p + (1-v23_base_act_p) * v23_f_p );

v23 = (1-gamma_pk)* v23_native + gamma_pk * v23_phospho;

% *********************************** %
% v24 : PEPCK
% *********************************** %
% Michaelis-Menten Kinetics
% mitochondrial PEPCK has very similar Kinetics
% [Yang2009, Case2007]
% oxalacetate + GTP -> PEP + GDP + CO2
v24_deltag = -15;        % [kJ/mol]  
v24_keq = keq(v24_deltag); % 337 [mM]
v24_td = ( oaa * gtp - pep*gdp*co2/v24_keq); 

v24_k_pep = 0.237;
v24_k_gdp = 0.0921;
v24_k_co2 = 25.5;
v24_k_oaa = 0.0055;
v24_k_gtp = 0.0222;

v24 = Vmax(24) / (v24_k_oaa * v24_k_gtp) * v24_td / ( (1+oaa/v24_k_oaa)*(1+gtp/v24_k_gtp) + (1+pep/v24_k_pep)*(1+gdp/v24_k_gdp)*(1+co2/v24_k_co2) - 1 );

% *********************************** %
% v25 : PEPCK mito
% *********************************** %
v25_td = ( oaa_mito * gtp_mito - pep_mito*gdp_mito*co2_mito /v24_keq); 
v25 = Vmax(25) / (v24_k_oaa * v24_k_gtp) * v25_td / ( (1+oaa_mito/v24_k_oaa)*(1+gtp_mito/v24_k_gtp) + (1+pep_mito/v24_k_pep)*(1+gdp_mito/v24_k_gdp)*(1+co2_mito/v24_k_co2) - 1 );


% *********************************** %
% v26 : Pyruvate Carboxylase
% *********************************** %
% Acetyl-CoA is allosterical activator.
% [Jitrapakdee1999, Scrutton1974]
% Irreversible reaction
% atp + pyr + co2 -> oaa + adp + p
v26_deltag = 0;                 % ??? [kJ/mol]  
v26_keq = keq(v26_deltag); 
v26_td = (atp_mito*pyr_mito*co2_mito - oaa_mito*adp_mito*p_mito/v26_keq); 

v26_k_atp = 0.22;  %[mM]
v26_k_pyr = 0.22;  %[mM]
v26_k_co2 = 3.2;   %[mM]
v26_k_acoa = 0.015; %[mM]
v26_n = 2.5;
v26 = Vmax(26) * atp_mito/(v26_k_atp + atp_mito) * pyr_mito/(v26_k_pyr + pyr_mito) * co2_mito/(v26_k_co2 + co2_mito) * acoa_mito^v26_n / (acoa_mito^v26_n + v26_k_acoa^v26_n);



% *********************************** %
% v27 : Lactate Dehydrogenase
% *********************************** %
% pyr + nadh <-> lac + nad 
v27_deltag = 21.1;        % [kJ/mol]  
v27_keq = keq(v27_deltag); 
v27_td = (pyr*nadh - lac*nad/v27_keq);


v27_k_pyr = 0.495;      % [mM]
v27_k_lac = 31.98;      % [mM]
v27_k_nad = 0.984;      % [mM]
v27_k_nadh = 0.027;      % [mM]
v27 = Vmax(27) / (v27_k_pyr * v27_k_nadh) * v27_td / ( (1+nadh/v27_k_nadh)*(1+pyr/v27_k_pyr) + (1+lac/v27_k_lac) * (1+nad/v27_k_nad) - 1);

% *********************************** %
% v28 : Lactate Transport (import)
% *********************************** %
% high capacity importer
% lactate_ext -> lactate
v28_deltag = 0;
v28_keq = keq(v28_deltag);
v28_td = (lac_ext - lac/v28_keq);

v28_k_lac = 0.8;                % [mM]
v28 = Vmax(28)/v28_k_lac * v28_td / (1 + lac_ext/v28_k_lac + lac/v28_k_lac);


% *********************************** %
% v29 : Pyruvate Transport (import mito)
% *********************************** %
v29_deltag = 0;
v29_keq = keq(v29_deltag);
v29_td = (pyr - pyr_mito/v29_keq);

v29_k_pyr = 0.1;                % [mM]
v29 = Vmax(29)/v29_k_pyr * v29_td / (1 + pyr/v29_k_pyr + pyr_mito/v29_k_pyr);

% *********************************** %
% v30 : PEP Transport (export mito)
% *********************************** %
v30_deltag = 0;
v30_keq = keq(v30_deltag);
v30_td = (pep_mito - pep/v30_keq);

v30_k_pep = 0.1;                % [mM]
v30 = Vmax(30)/v30_k_pep * v30_td / (1 + pep/v30_k_pep + pep_mito/v30_k_pep);


% *********************************** %
% v31 : PDH
% *********************************** %
% reaction is irreversibel
% PDH regulated by phosphorylation, dephosphorylation mechanism
% phosphorylated form is not very active
% unphosphorylated form is more active
% pyr + coa + nad -> acoa + co2 + nadh + h
% [Hamada1975, Korotchkina2006, Kiselevsky1990, Holness1988]

v31_keq = 1;
v31_td = (pyr_mito*coa_mito*nad_mito - acoa_mito*co2_mito*nadh_mito/v31_keq);

v31_k_pyr = 0.025;           % [mM] 
v31_k_coa = 0.013;           % [mM]
v31_k_nad = 0.050;           % [mM] 
% Acetyl-CoA competitive inhibitor for coa
v31_ki_acoa = 0.035;         % [mM]
% NADH competitive inhibitor for nad
v31_ki_nadh = 0.036;
% native form is more active
v31_alpha_nat = 5;
v31_alpha_p = 1;

v31_base = Vmax(31) * pyr_mito/(pyr_mito + v31_k_pyr) * nad_mito/(nad_mito + v31_k_nad*(1 + nadh_mito/v31_ki_nadh)) * coa_mito/(coa_mito + v31_k_coa*(1+acoa_mito/v31_ki_acoa));
v31_nat = v31_base * v31_alpha_nat;
v31_p = v31_base * v31_alpha_p;
v31 = (1 - gamma_pdh) * v31_nat + gamma_pdh * v31_p;

% *********************************** %
% v32 : CS
% *********************************** %
% acoa_mito + oaa_mito + h2o mito -> cit_mito + coa_mito
% ATP inhibition not integrated
% [Shepherd1969, Smitherman1979, Matsuoka1973, Nelson2008]
v32_deltag = -32.2;        % [kJ/mol]  
v32_keq = keq(v32_deltag); 
v32_td = (acoa_mito * oaa_mito - cit_mito*coa_mito/v32_keq);

v32_k_oaa = 0.002;           % [mM] 
v32_k_acoa = 0.016;          % [mM]
v32_k_cit = 0.420;           % [mM] 
v32_k_coa = 0.070;           % [mM]

v32 = Vmax(32)/(v32_k_oaa * v32_k_acoa) * v32_td / ... 
    ( (1+acoa_mito/v32_k_acoa)*(1+oaa_mito/v32_k_oaa) + (1+cit_mito/v32_k_cit)*(1+coa_mito/v32_k_coa) -1 );

% *********************************** %
% v33 : Nucleoside-diphosphate kinase (ATP, GTP)
% *********************************** %
% ATP + GDP <-> ADP + GTP
% The concentrations of the nucleotides are coupled via the NDK reaction
% [Fukuchi1994, Kimura1988, Lam1986]
v33_deltag = 0;        % [kJ/mol]  
v33_keq = keq(v33_deltag); 
v33_td = (atp_mito*gdp_mito - adp_mito*gtp_mito/v33_keq);

v33_k_atp = 1.33;       % [mM]
v33_k_adp = 0.042;      % [mM]
v33_k_gtp = 0.15;       % [mM]
v33_k_gdp = 0.031;      % [mM]

v33 = Vmax(33) / (v33_k_atp * v33_k_gdp) * v33_td / ( (1 + atp_mito/v33_k_atp)*(1 + gdp_mito/v33_k_gdp) + (1 + adp_mito/v33_k_adp)*(1 + gtp_mito/v33_k_gtp) - 1) ;

% *********************************** %
% v34 : OAA influx
% *********************************** %
v34_td = 0;
v34 = Vmax(34);

% *********************************** %
% v35 : Acetyl-CoA efflux
% *********************************** %
v35_td = 0;
v35 = Vmax(35);

% *********************************** %
% v36 : Citrate efflux
% *********************************** %
v36_td = 0;
v36 = Vmax(36);


%% RETURN FLUXES
V  = [v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36]';
TD = [v1_td v2_td v3_td v4_td v5_td v6_td v7_td v8_td v9_td v10_td v11_td v12_td v13_td v14_td v15_td v16_td v17_td v18_td ...
      v19_td v20_td v21_td v22_td v23_td v24_td v25_td v26_td v27_td v28_td v29_td v30_td v31_td v32_td v33_td v34_td v35_td v36_td]';
