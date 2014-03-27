function [V, TD] = m_ppp_model_ode(S, t, mpars)
%% MODEL_PPPP Rate laws for integration
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
%   options.epinephrine function handle to epinephrine response curve
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
%   date:   110522
%

% TODO: Delta G values for the reactions
% TODO: initial concentrations


%% Set constant concentrations

% for k=1:size(mpars.const_c, 1)
%    if mpars.const_c(k,1) == 1
%        S(k) = mpars.const_c(k,2);
%    end
% end
%{
c_inds = find(mpars.const_c(:,1)==1);
S(c_inds) = mpars.const_c(c_inds, 2);
%}

%% Test for negative concentrations
%TODO : analyse possble problems in more detail
if any(find(S<0))
   warning('Negative concentrations !!!')
   for k=1:length(S)
      if S(k) < 0
          S(k)
          k
          S(k) = 0;
          x(k) = 0;
      end
   end
end



%% Concentrations
atp = S(1);
adp = S(2);
nadp = S(3);
nadph = S(4);
p = S(5);
h2o = S(6);
co2 = S(7);
h = S(8);
glc = S(9);
glc6p = S(10);
fru6p = S(11);
fru16bp = S(12);
fru26bp = S(13);
grap = S(14);
dhap = S(15);
pgl6 = S(16);
pg6 = S(17);
ru5p = S(18);
x5p = S(19);
r5p = S(20);
s7p = S(21);
e4p = S(22);
glc_ext = S(23);
amp = S(24);
prpp = S(25);
gdp = S(26);

%% Gamma calculation
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
Vmax = mpars.Vmax;

% *********************************** %
% v1 : GLUT2
% *********************************** %
% glc_ext <-> glc
v1_deltag = 0;                              % [kJ/mol]
v1_keq = keq(v1_deltag);                    % []
v1_td = (glc_ext - glc/v1_keq);

v1_km = 42;                                 % [mM]
v1 = Vmax(1)/v1_km * v1_td /(1 + glc_ext/v1_km + glc/v1_km);


% *********************************** %
% v2 : GK
% *********************************** %	
% glc + atp -> glc6p + adp 
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

v2_gc_free = (glc^v2_n_gkrp / (glc^v2_n_gkrp + v2_km_glc1^v2_n_gkrp) ) * ...
    (1 - v2_b*fru6p/(fru6p + v2_km_fru6p));
v2 = Vmax(2) * v2_gc_free * atp/(v2_km_atp + atp) * ...
    glc^v2_n/(glc^v2_n + v2_km_glc^v2_n);


% *********************************** %
% v3 : G6P
% *********************************** %
% glc6p + h2o -> glc + p
v3_deltag = -13.8;                          % [kJ/mol]
v3_keq = keq(v3_deltag);                    
v3_td = (glc6p - glc*p/v3_keq);

v3_km_glc6p = 2;            % [mM]
v3 = Vmax(3) * glc6p / (v3_km_glc6p + glc6p);


% *********************************** %
% v4 : GPI
% *********************************** %
% glc6p <-> fru6p
v4_deltag = 1.7;                          % [kJ/mol]
v4_keq = keq(v4_deltag);                    
v4_td = (glc6p - fru6p/v4_keq);

v4_km_glc6p  = 0.182;       % [mM]
v4_km_fru6p = 0.071;        % [mM]
v4 = Vmax(4)/v4_km_glc6p * v4_td / (1 + glc6p/v4_km_glc6p + fru6p/v4_km_fru6p);


% *********************************** %
% v5: PFK2
% *********************************** %
% fru6p + atp -> fru26bp + adp
v5_deltag = -14.2;                          % [kJ/mol]
v5_keq = keq(v5_deltag);                    
v5_td = (fru6p * atp - fru26bp * adp/v5_keq);

v5_n_native = 1.3;  
v5_n_phospho = 2.1;             
v5_k_fru6p_native = 0.016;      % [mM]
v5_k_fru6p_phospho = 0.050;     % [mM]
v5_k_atp_native = 0.28;         % [mM]
v5_k_atp_phospho = 0.65;        % [mM]

v5_native = Vmax(5) * power(fru6p, v5_n_native) / ...
    (power(fru6p, v5_n_native) + power(v5_k_fru6p_native, v5_n_native)) * ...
    (atp / (atp + v5_k_atp_native));
v5_phospho = Vmax(5) * power(fru6p, v5_n_phospho) / ...
    (power(fru6p, v5_n_phospho) + power(v5_k_fru6p_phospho, v5_n_phospho)) * ...
    (atp / (atp + v5_k_atp_phospho));

v5 = (1 - gamma_pfk2) * v5_native + gamma_pfk2 * v5_phospho;


% *********************************** %
% v6 : FBP2
% *********************************** %
% fru26bp + h2o -> fru6p + p 
v6_deltag = -16.3;                          % [kJ/mol]
v6_keq = keq(v6_deltag);                    
v6_td = (fru26bp - fru6p*p/v6_keq);

v6_km_fru26bp_native = 0.010;      %[mM]
v6_ki_fru6p_native = 0.0035;      %[mM]
v6_km_fru26bp_phospho = 0.0005;      %[mM]
v6_ki_fru6p_phospho = 0.010;      %[mM]

v6_native = Vmax(6)/(1 + fru6p/v6_ki_fru6p_native) * ...
    fru26bp / ( v6_km_fru26bp_native + fru26bp);
v6_phospho = Vmax(6)/(1 + fru6p/v6_ki_fru6p_phospho) * ...
    fru26bp / ( v6_km_fru26bp_phospho + fru26bp);
v6 = (1-gamma_fbp2) * v6_native + gamma_fbp2 * v6_phospho;


% *********************************** %
% v7 : PFK1
% *********************************** %
% fru6p + atp -> fru16bp + adp
v7_deltag = -14.2;                          % [kJ/mol]
v7_keq = keq(v7_deltag);                    
v7_td = (fru6p*atp - fru16bp*atp/v7_keq);

v7_km_atp = 0.111;                % [mM] [b]
v7_km_fru6p = 0.077;              % [mM] [a]
v7_ki_fru6p = 0.012;              % [mM] [ai]
v7_ka_fru26bp = 0.001;                % [mM]

% ! alternative without inhibition ?
v7 = Vmax(7) * (1 - 1./(1 + fru26bp/v7_ka_fru26bp)) * ...
    fru6p*atp / (v7_ki_fru6p*v7_km_atp + v7_km_fru6p*atp + v7_km_atp*fru6p + atp*fru6p);


% *********************************** %
% v8 : FBP1
% *********************************** %
% fru16bp + h2o -> fru6p + p
v8_deltag = -16.3;                          % [kJ/mol]
v8_keq = keq(v8_deltag);                    
v8_td = (fru16bp - fru6p*p/v8_keq);

v8_ki_fru26bp = 0.001;               % [mM]
v8_km_fru16bp = 0.0013;              % [mM]
v8 = Vmax(8) / (1 + fru26bp/v8_ki_fru26bp) * ...
    fru16bp/(fru16bp + v8_km_fru16bp);


% *********************************** %
% v9 : ALD
% *********************************** %
% fru16bp <-> grap + dhap
v9_deltag = 23.8;                          % [kJ/mol]
v9_keq = keq(v9_deltag); 
v9_td = (fru16bp - grap*dhap/v9_keq);
% keq = 0.114;                 %[mM] erythrocyte

v9_km_fru16bp = 0.0071;         %[mM]
v9_km_dhap = 0.0364;            %[mM]
v9_km_grap = 0.0071;            %[mM]
v9_ki1_grap = 0.0572;           %[mM]
v9_ki2_grap = 0.176;            %[mM]

v9 = Vmax(9)/v9_km_fru16bp * ...
    v9_td/(1 + fru16bp/v9_km_fru16bp + grap/v9_ki1_grap + ...
    dhap*(grap + v9_km_grap)/(v9_km_dhap*v9_ki1_grap) + ...
    (fru16bp*grap)/(v9_km_fru16bp*v9_ki2_grap));


% *********************************** %
% v10 : TPI
% *********************************** %
% dhap <-> grap

v10_deltag = 7.5;                  % [kJ/mol]
% v10_keq = 0.0407;                %[mM] erythrocyte model
v10_keq = keq(v10_deltag); 
v10_td = (dhap - grap/v10_keq); 

v10_km_dhap = 0.59;             %[mM]
v10_km_grap = 0.42;             %[mM]
v10 = Vmax(10)/v10_km_dhap * ... 
        v10_td / (1 + dhap/v10_km_dhap + grap/v10_km_grap);


% ***************************************************** %
% v11 : G6PD
% ***************************************************** %
% EC{1.1.1.49}
% KEGG{R00835}
% D-Glucose 6-phosphate + NADP+ <=> D-Glucono-1,5-lactone 6-phosphate +
% ... NADPH + H+
% glc6p + nadp -> pgl6 + nadph + h
v11_deltag = -19.6;             % [kJ/mol] (Schuster1995)
v11_keq = keq(v11_deltag);                   
v11_td = (glc6p * nadp - pgl6*nadph*h/v11_keq);

v11_km_glc6p = 0.045;          % [mM] (Ozer2001, Corpas1995, Bautista1992)
v11_km_nadp  = 0.015;         % [mM] (Ozer2001, Corpas1995, Bautista1992)
v11_ki_nadph = 0.010;

v11 = Vmax(11) * glc6p/(glc6p + v11_km_glc6p) * ... 
        nadp/(nadp + v11_km_nadp*(1+nadph/v11_ki_nadph) );


% ****************************************************** %
% v12 : PGLS
% ****************************************************** %
% EC{3.1.1.31}
% KEGG{R02035}
% D-Glucono-1,5-lactone 6-phosphate + H2O <=> 6-Phospho-D-gluconate
% C01236 + C00001 <=> C00345
% pgl6 + h2o -> pg6
v12_deltag = 0;                              % [kJ/mol]
v12_keq = keq(v12_deltag);                   % []
v12_td = (pgl6 - pg6/v12_keq);

v12_km_pgl6 = 0.08;    % [mM] (Schlofield1976)
v12 = Vmax(12) * pgl6/(v12_km_pgl6 + pgl6); %


% ****************************************************** %
% v24 : PGLH
% ****************************************************** %
% spontaneous hydrolysis
% KEGG{R02035}
% D-Glucono-1,5-lactone 6-phosphate + H2O <=> 6-Phospho-D-gluconate
% C01236 + C00001 <=> C00345
% pgl6 + h2o -> pg6
v24_td = v12_td;

v24_k_pgl6 = 0.963E-3;                       % [1/s] (Schlofield1976)
v24 = v24_k_pgl6 * pgl6;                     % (Schlofield1976)



% ****************************************************** %
% v13 : PGD
% ****************************************************** %
% EC{1.1.1.44}
% KEGG{R01528}
% 6-Phospho-D-gluconate + NADP+ <=> D-Ribulose 5-phosphate + CO2 + NADPH +
% ... H+
% C00345 + C00006 <=> C00199 + C00011 + C00005 + C00080
% pg6 + nadp -> ru5p + co2 + nadph + h
v13_deltag = -12.78;           % [kJ/mol] (Schuster1995)
v13_keq = keq(v13_deltag);      
v13_td = (pg6*nadp - ru5p*co2*nadph*h/v13_keq);

v13_km_pg6 = 0.071;     % [mM] (Pascal1972, Pearse1974)
v13_km_nadp = 0.013;    % [mM] (Pascal1972, Pearse1974)
v13_ki_nadph = 0.021;   % [mM] (Pearse1974, Corpas1995a)

v13 = Vmax(13) * pg6/(v13_km_pg6 + pg6) * ...
            nadp/(nadp + v13_km_nadp*(1+nadph/v13_ki_nadph));


% ****************************************************** %
% v14 : RPE
% ****************************************************** %
% EC{5.1.3.1}
% KEGG{R01529}
% D-Ribulose 5-phosphate <=> D-Xylulose 5-phosphate
% C00199 <=> C00231
% ru5p <-> x5p
% near equilibrium reaction (X5P/Ru5P = 1.5-3 independent of diet)
% (Cassazza1986b)
v14_deltag = -2.6;          % [kJ/mol] (Schuster1995)
v14_keq = keq(v14_deltag);                    
v14_td = (ru5p - x5p/v14_keq);

v14_km_ru5p = 0.19;    % [mM] (Wood1979, Schuster1995) 
v14_km_x5p  = 0.5;     % [mM] (Schuster1995)

v14 = Vmax(14)/v14_km_ru5p * ...
            v14_td /(1 + ru5p/v14_km_ru5p + x5p/v14_km_x5p);


% ****************************************************** %
% v15 : RPIA
% ****************************************************** %
% EC{5.3.1.6}
% KEGG{R01056}
% D-Ribose 5-phosphate <=> D-Ribulose 5-phosphate
% C00117 <=> C00199
% r5p <-> ru5p
v15_deltag = 2.83;             % [kJ/mol] (Schuster1995)
v15_keq = keq(v15_deltag);      
v15_td = (r5p - ru5p/v15_keq);

v15_km_r5p   = 2.2;     % [mM] (Schuster1995)
v15_km_ru5p  = 0.78;    % [mM] (Schuster1995)

v15 = Vmax(15)/v15_km_r5p * ...
            v15_td /(1 + r5p/v15_km_r5p + ru5p/v15_km_ru5p); % ?


% ****************************************************** %
% v16 : TALDO
% ****************************************************** %
% EC{2.2.1.2}
% KEGG{R08575}
% Sedoheptulose 7-phosphate + D-Glyceraldehyde 3-phosphate <=> D-Erythrose
% ... 4-phosphate + D-Fructose 6-phosphate
% C05382 + C00118 <=> C00279 + C00085
% s7p + grap <-> e4p + fru6p
v16_deltag = 2.42;                              % [kJ/mol] (Casazza1986a, MyIntyre1989)
v16_keq = keq(v16_deltag);                    % []
v16_td = (s7p*grap - e4p*fru6p/v16_keq);

v16_km_s7p    = 0.056;   % [mM] (McIntyre1989, Horecker1955)
v16_km_grap   = 0.087;   % [mM] (McIntyre1989, Horecker1955)
v16_km_e4p    = 0.020;  % [mM] (McIntyre1989, Horecker1955, Kuhn1972)
v16_km_fru6p  = 0.200;   % [mM] (McIntyre1989, Horecker1955, Kuhn1972)

% v16 = Vmax(16) * v16_td; % ?
v16 = Vmax(16)/v16_km_s7p/v16_km_grap * v16_td / ...
    ( (1+s7p/v16_km_s7p)*(1+grap/v16_km_grap) + ... 
      (1+e4p/v16_km_e4p)*(1+fru6p/v16_km_fru6p)  -1 );
  
  


% ****************************************************** %
% v17 : TKT1
% ****************************************************** %
% EC{2.2.1.1}
% KEGG{R01641}
% Sedoheptulose 7-phosphate + D-Glyceraldehyde 3-phosphate <=> 
% ... D-Ribose 5-phosphate + D-Xylulose 5-phosphate
% C05382 + C00118 <=> C00117 + C00231
% s7p + grap <-> r5p + x5p
v17_deltag = -1.89;              % [kJ/mol] (McIntyre1989, Casazza1986a)
v17_keq = keq(v17_deltag);
v17_td = (s7p*grap - r5p*x5p/v17_keq);

v17_km_s7p = 0.86;     % [mM] (McIntyre1989)
v17_km_grap  = 0.38;   % [mM] (McIntyre1989)
v17_km_r5p = 0.30;     % [mM] (McIntyre1989, Warnock1982)
v17_km_x5p  = 0.18;    % [mM] (McIntyre1989, Warnock1982)

v17 = Vmax(17)/v17_km_s7p/v17_km_grap * v17_td / ...
    ( (1+s7p/v17_km_s7p)*(1+grap/v17_km_grap) + ... 
      (1+r5p/v17_km_r5p)*(1+x5p/v17_km_x5p)  -1 );


% ****************************************************** %
% v18 : TKT2
% ****************************************************** %
% EC{2.2.1.1}
% KEGG{R01067}
% D-Fructose 6-phosphate + D-Glyceraldehyde 3-phosphate <=> D-Erythrose
% ... 4-phosphate + D-Xylulose 5-phosphate
% C00085 + C00118 <=> C00279 + C00231
% fru6p + grap <-> e4p + x5p
v18_deltag = -8.74;            % [kJ/mol] (McIntyre1989, Casazza1986a)
v18_keq = keq(v18_deltag);
v18_td = (fru6p*grap - e4p*x5p/v18_keq);

v18_km_fru6p = 1.8;      % [mM] (McIntyre1989)
v18_km_grap  = 0.38;     % [mM] (McIntyre1989)
v18_km_e4p = 0.044;      % [mM] (McIntyre1989)
v18_km_x5p  = 0.18;      % [mM] (McIntyre1989)


v18 = Vmax(18)/v18_km_fru6p/v18_km_grap * v18_td / ...
    ( (1+fru6p/v18_km_fru6p)*(1+grap/v18_km_grap) + ... 
      (1+e4p/v18_km_e4p)*(1+x5p/v18_km_x5p)  -1 );

% ***************************************************** %
% v19 : R5PU
% ***************************************************** %
% r5p <-> 
v19_td = 0;
v19 = Vmax(19) * r5p; 


% ***************************************************** %
% v20 : NADPU
% ***************************************************** %
% nadph + h -> nadp
v20_td = 0;
v20 = Vmax(20) * nadph; 


% ***************************************************** %
% v21 : GRAPU
% ***************************************************** %
% grap <-> 
v21_td = 0;
v21 = Vmax(21) * (grap-0.1);

% ***************************************************** %
% v22 : PRPPS
% ***************************************************** %
% EC{2.7.6.1}
% KEGG{R01049}
% ATP + D-Ribose 5-phosphate <=> AMP + 5-Phospho-alpha-D-ribose
% ... 1-diphosphate
% C00002 + C00117 <=> C00020 + C00119
% atp + r5p -> amp + prpp
v22_deltag = -29.7;         % [kJ/mol] (Schuster1995)
v22_keq = keq(v22_deltag);                    
v22_td = (atp*r5p - amp*prpp/v22_keq);

v22_km_atp = 0.03;    % [mM] (Becker1975)
v22_km_r5p = 0.57;    % [mM] (Becker1975)
v22_ki_amp = 0.08;    % [mM] (Becker1975)
v22_ki_prpp = 0.06;    % [mM] (Becker1975)
v22_ki_adp = 0.11;    % [mM] (Becker1975)
v22_ki_gdp = 1.5;    % [mM] (Becker1975)

v22 = Vmax(22)/(1+amp/v22_ki_amp)/(1+gdp/v22_ki_gdp) * ...
        atp/(atp + v22_km_atp*(1+adp/v22_ki_adp)) * ...
        r5p/(r5p + v22_km_r5p*(1+prpp/v22_ki_prpp));


% ***************************************************** %
% v23 : PRPPU
% ***************************************************** %
% prpp -> 
v23_td = 0;
v23_km_prpp = 0.1;  % ? [mM]
%v23 = Vmax(23) * prpp/(prpp + v23_km_prpp);
%v23 = Vmax(23);
v23 = Vmax(23) * prpp;

%% RETURN FLUXES
V  = [v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 ...
        v19 v20 v21 v22 v23 v24]';
TD = [v1_td v2_td v3_td v4_td v5_td v6_td v7_td v8_td v9_td v10_td ...
        v11_td v12_td v13_td v14_td v15_td v16_td v17_td v18_td ...
        v19_td v20_td v21_td v22_td v23_td v24_td]';
