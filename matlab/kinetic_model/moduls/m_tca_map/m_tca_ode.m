function [v] = m_tca_ode(x, t, mpars)
%% MODEL_TCA_ODE Rate laws for integration
%  Definition of the rate laws and calculation of the fluxes for the given
%  parameters and concentrations. 
%  
%   Returns fluxes.

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
%   date:   110820

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test for negative concentrations
if any(find(x <0 ))
   warning('Negative concentrations !!!')
   for k=1:length(x)
      if x(k) < 0
          mpars.x_names{k}
          x(k)
          x(k) = 0;
      end
   end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Concentrations
atp_mito    = x(mpars.x_ind('atp_{mito}'));
adp_mito    = x(mpars.x_ind('adp_{mito}'));
gtp_mito    = x(mpars.x_ind('gtp_{mito}'));
gdp_mito    = x(mpars.x_ind('gdp_{mito}'));
nad_mito    = x(mpars.x_ind('nad_{mito}'));
nadh_mito   = x(mpars.x_ind('nadh_{mito}'));
fad_mm      = x(mpars.x_ind('fad_{mm}'));
fadh2_mm    = x(mpars.x_ind('fadh2_{mm}'));
co2_mito    = x(mpars.x_ind('co2_{mito}'));
h2o_mito    = x(mpars.x_ind('h2o_{mito}'));
p_mito      = x(mpars.x_ind('p_{mito}'));
coa_mito    = x(mpars.x_ind('coa_{mito}'));
pyr_mito    = x(mpars.x_ind('pyr_{mito}'));
acoa_mito   = x(mpars.x_ind('acoa_{mito}'));
cit_mito    = x(mpars.x_ind('cit_{mito}'));
isocit_mito = x(mpars.x_ind('isocit_{mito}'));
akg_mito    = x(mpars.x_ind('akg_{mito}'));
succoa_mito = x(mpars.x_ind('succoa_{mito}'));
suc_mito    = x(mpars.x_ind('suc_{mito}'));
fum_mito    = x(mpars.x_ind('fum_{mito}'));
mal_mito    = x(mpars.x_ind('mal_{mito}'));
oa_mito     = x(mpars.x_ind('oa_{mito}'));
pyr         = x(mpars.x_ind('pyr_{mito}'));
glu_mito    = x(mpars.x_ind('glu_{mito}'));
ca_mito     = x(mpars.x_ind('ca_{mito}'));
k_drain     = x(mpars.x_ind('k_{drain}'));
h           = x(mpars.x_ind('h'));
h_mito      = x(mpars.x_ind('h_{mito}'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Vmax = mpars.vmax;
v    = zeros(mpars.Nv, 1);


%% Calcium concentration set by k_drain
% ?NIKO? How is calcium concentration related to the k_drain concentration
% and why ?
ca_mito = 0.05 + max((k_drain-1)*2.5 , 0);

% *********************************** %
% v1 : KDRAIN : Change in k_drain parameter
% *********************************** %
% help function to change the control variable k_drain; 
kdrain_td = 0;

% External parameters vary the drain settings
switch mpars.z
    case 0
        % z*(1- 1./(exp((t-250)/50)+1));
        % 4+5./(exp((t-30)/5)+1);
        % 3+5./(exp((t-30)/5)+1);
        nadd_p = 1;
    case -1
        nadd_p = 0;
    otherwise
        nadd_p = mpars.z+1;
end
v(mpars.v_ind('KDRAIN')) = Vmax('KDRAIN') * (nadd_p - k_drain);
%v_kdrain = 0;

% *********************************** %
% v2 : PDH - Pyruvatedehydrogenase Complex
% *********************************** %	
% EC{1.2.4.1, 1.8.1.4, 2.3.1.12}
% KEGG{R00209}
% pyr_mito + coa_mito + nad_mito -> acoa_mito + co2_mito + nadh_mito +
% h_mito
% irreversible
pdh_deltag = 0;                          % [kJ/mol]
pdh_keq = keq(pdh_deltag);                    
pdh_td = (pyr_mito*coa_mito*nad_mito - acoa_mito*co2_mito*nadh_mito*h_mito/pdh_keq);

pdh_km_pyr = 0.030;      %[mM]
pdh_km_nad = 0.125;      %[mM]
pdh_km_coa = 0.005;      %[mM]
pdh_ki_acoa = 0.003;     %[mM]

v_pdh = Vmax('PDH') * pyr_mito/(pdh_km_pyr + pyr_mito) * ...
              nad_mito/(pdh_km_nad + nad_mito) * ...
              coa_mito/(pdh_km_coa*(1+acoa_mito/pdh_ki_acoa) + coa_mito);

v(mpars.v_ind('PDH')) = v_pdh * nadd_p;
          
% *********************************** %
% v3 : CS - Citrate synthase
% *********************************** %
% EC{2.3.3.1}
% KEGG{-R00351}
% oa_mito + acoa_mito + h2o_mito <-> cit_mito + coa_mito
cs_deltag = -31.5;                          % [kJ/mol]
cs_keq = keq(cs_deltag);        % niko 2.03e5;                    
cs_td = (oa_mito*acoa_mito - cit_mito*coa_mito/cs_keq);

cs_ki1_atp = 2;         %[mM]
cs_ki2_atp = 0.7;       %[mM]
cs_km_oa = 0.0036;      %[mM]
cs_km_acoa = 0.0028;    %[mM]

v(mpars.v_ind('CS')) = Vmax('CS')/(1+atp_mito/cs_ki1_atp) * oa_mito/(cs_km_oa + oa_mito) * ...
            acoa_mito/(cs_km_acoa.*(1+atp_mito/cs_ki2_atp) + acoa_mito);
        
% *********************************** %
% v4 : ACO - Aconitase
% *********************************** %
% EC{4.2.1.3}
% KEGG{R01324}
% cit_mito <-> isocit_mito
%Purification of Rat Heart and Rat Liver Citrate Synthases (Moriyama,
% Srere)
aco_deltag = 7.72;                         % [kJ/mol]
aco_keq = keq(aco_deltag);                  % niko 0.05 (0.067)                 
aco_td = (cit_mito - isocit_mito/aco_keq);

aco_km_cit = 0.45;
aco_km_isocit = 0.1;

v(mpars.v_ind('ACO')) = Vmax('ACO') * (cit_mito - isocit_mito/aco_keq) / ...
                     (1 + cit_mito/aco_km_cit + isocit_mito/aco_km_isocit);
                 
% *********************************** %
% v5: IDH - Isocitrate dehydrogenase (NAD)
% *********************************** %
% EC{1.1.1.42} -> NADP
% EC{1.1.1.41} -> NAD
% KEGG{R00709}
% isocit_mito + nad_mito -> akg_mito + co2_mito + nadh_mito + h_mito
% irreversible
idh_deltag = 0;                          % [kJ/mol]
idh_keq = keq(idh_deltag);                    
idh_td = (isocit_mito*nad_mito - akg_mito*co2_mito*nadh_mito*h_mito/idh_keq);

% Characterization of the effects of Ca2+ on the intramitochondrial
% Ca2+-sensitive enzymes from rat liver and within intact rat liver mitochondria
idh_km_isocit = 0.35;
idh_ki1_ca = 1.21;
idh_ki2_ca = 0.1;
idh_keff_isocit = idh_km_isocit*(idh_ki1_ca - ca_mito./(ca_mito+idh_ki2_ca));       

% Purification and Properties of Diphosphopyridine Nucleotidelinked
% Isocitrate Dehydrogenase of Mammalian Liver*
idh_km_nad = 0.02;
idh_ki_nadh = 0.016;
idh_keff_nad = idh_km_nad*(1+nadh_mito/idh_ki_nadh);                 

v(mpars.v_ind('IDH')) = Vmax('IDH') * isocit_mito./(isocit_mito + idh_keff_isocit) * ...
                  nad_mito./(nad_mito + idh_keff_nad);

% *********************************** %
% v6 : KGDH -  alpha - Ketoglutarate dehydrogenase
% *********************************** %
% EC{1.2.4.2, 1.8.1.4, 2.3.1.61}
% KEGG{R08549}
% akg_mito + coa_mito + nad_mito -> succoa_mito + co2_mito + nadh_mito +
% h_mito
% irreversible
% (Activation:ADP, Pi, Ca, inhibition: TTP, xXx-CoA, SucCoA, ATP, NADH, ADP)
% (Inactivation of beef brain Alpha-Ketogluterate dehydrogenase complex by ...(luder, Parks, ...))
% (Kinetic and spectral investigation of allosteric interaction of coenzymes ... (Strumilo))
% (primary Regulation of CAC ()alpha-ketogluterate dehydrogenase: a target ... (Tretter) )
% (Regulation of mitochondrial a-Ketogluterate metabolism by product
% inhibiton at ...(Smith, ...))

kgdh_deltag = 0;                          % [kJ/mol]
kgdh_keq = keq(kgdh_deltag);                    
kgdh_td = (akg_mito*coa_mito*nad_mito - succoa_mito*co2_mito*nadh_mito*h_mito/kgdh_keq);

% Characterization of the effects of Ca2+ on the intramitochondrial
% Ca2+-sensitive enzymes from rat liver and within intact rat liver mitochondria
kgdh_km_akg = 2.25;      %[mM]
kgdh_ki1_ca = 1.087;     %[]
kgdh_ki2_ca = 0.1;       %[mM]

kgdh_keff_akg = kgdh_km_akg * (kgdh_ki1_ca - ca_mito/(ca_mito+kgdh_ki2_ca));              

kgdh_km_nad = 0.021;    % [mM]
kgdh_ki_nadh = 0.0045;  % [mM]

v(mpars.v_ind('KGDH')) = Vmax('KGDH') * akg_mito/(akg_mito + kgdh_keff_akg) * ...
              nad_mito/(nad_mito + kgdh_km_nad*(1+nadh_mito/kgdh_ki_nadh));

% *********************************** %
% v7 : SCS1 - Succhinyl-CoA synthetase (ATP)
% *********************************** %
% EC{6.2.1.5}
% KEGG{-R00405}
% adp_mito + p_mito + succoa_mito <-> atp_mito + suc_mito + coa_mito
scs_deltag = -3.44;                          % [kJ/mol]
scs_keq = keq(scs_deltag);        % niko 3.8                
scs1_td = (adp_mito*p_mito*succoa_mito - ...
                atp_mito*suc_mito*coa_mito/scs_keq);

scs1_km_atp     = 0.055;    % [mM]
scs1_km_suc     = 5.1;      % [mM]
scs1_km_coa     = 0.032;    % [mM]    
scs1_km_adp     = 0.25;     % [mM]
scs1_km_succoa  = 0.041;    % [mM]
scs1_km_p = 0.72;           % [mM]

scs1_f = (1 + 1.2*p_mito^3/(p_mito^3 + 2.5^3));

v(mpars.v_ind('SCS1')) = Vmax('SCS1') * scs1_f/(scs1_km_succoa*scs1_km_adp*scs1_km_p) * ... 
    (succoa_mito*adp_mito*p_mito - 1/scs_keq*suc_mito*coa_mito*atp_mito)/ ...
        ((1+succoa_mito/scs1_km_succoa)*(1+adp_mito/scs1_km_adp)*(1+p_mito/scs1_km_p) + ...
           (1+suc_mito/scs1_km_suc)*(1+coa_mito/scs1_km_coa)*(1+atp_mito/scs1_km_atp) - 1); 

% *********************************** %
% v8 : SCS2 - Succhinyl-CoA synthetase (GTP)
% *********************************** %
% EC{6.2.1.4}
% KEGG{-R00432}
% gdp_mito + p_mito + succoa_mito <-> gtp_mito + suc_mito + coa_mito
%Affinity Chromatography and Affinity Labeling of Rat Liver Succinyl-CoA
%Synthetase

scs2_td = (gdp_mito*p_mito*succoa_mito - ...
                gtp_mito*suc_mito*coa_mito/scs_keq);

scs2_km_gtp     = 0.04;     % [mM]
scs2_km_suc     = 0.7;      % [mM]
scs2_km_coa     = 0.02;     % [mM]
scs2_km_gdp     = 0.007;    % [mM]
scs2_km_succoa  = 0.086;    % [mM]
scs2_km_p       = 2.26;     % [mM]

scs2_f = (1 + 1.2*p_mito^3/(p_mito^3 + 2.5^3));

v(mpars.v_ind('SCS2')) = Vmax('SCS2') * scs2_f/(scs2_km_succoa*scs2_km_gdp*scs2_km_p) * ...
         (succoa_mito*gdp_mito*p_mito - 1/scs_keq*suc_mito*coa_mito*gtp_mito)/ ...
         ((1+succoa_mito/scs2_km_succoa)*(1+gdp_mito/scs2_km_gdp)*(1+p_mito/scs2_km_p) + ...
          (1+suc_mito/scs2_km_suc)*(1+coa_mito/scs2_km_coa)*(1+gtp_mito/scs2_km_gtp) - 1);     

% *********************************** %
% v9 : SDH - Succhinate dehydrogenase
% *********************************** %
% EC{1.3.5.1}
% (KEGG{R02164}) Ubiquinol cofactor instead of FADH2
% suc_mito + fad_mm -> fum_mito + fadh2_mm
% ?NICO? What happens to the cofactors in the oxidative phosphorylation?
% How handled in the combination with oxidative phosphorylation?
sdh_deltag = 0;                          % [kJ/mol]
sdh_keq = keq(sdh_deltag); 
sdh_td = (suc_mito*fad_mm - fum_mito*fadh2_mm/sdh_keq);

sdh_km_suc = 1.54;      % [mM]

v(mpars.v_ind('SDH')) = Vmax('SDH') * suc_mito/(suc_mito + sdh_km_suc);


% *********************************** %
% v10 : FUMR - Fumarase
% *********************************** %
% EC{4.2.1.2}
% KEGG{-R01082}
% fum_mito + h2o_mito <-> mal_mito 
%Physicochemical, Catalytic, and Immunochemical Properties ofFmnarases
%Crystallized Separately from Mitochondrial and Cytosolic Fractions of Rat
%Liver1   
fumr_deltag = -3.82;                  % [kJ/mol]
fumr_keq = keq(fumr_deltag);          % niko 4.4
fumr_td = (fum_mito - mal_mito/fumr_keq); 

fumr_km_fum     = 0.013;        % [mM]
fumr_ki1_p      = 0.4;          % [mM]
fumr_km_mal     = 0.18;         % [mM]
fumr_ki2_p      = 3.5;          % [mM]

v(mpars.v_ind('FUMR')) = Vmax('FUMR') * (fum_mito - 1/fumr_keq*mal_mito)/ ...
    (1+fum_mito/(fumr_km_fum*(1+p_mito/fumr_ki1_p)) + mal_mito/(fumr_km_mal*(1+p_mito/fumr_ki2_p)));       


% ***************************************************** %
% v11 : MDH - Malate dehydrogenase
% ***************************************************** %
% EC{1.1.1.37}
% KEGG{R00342}
% mal_mito + nad_mito <-> oa_mito + nadh_mito + h_mito
% Rat Liver Mitochondrial Malate Purification, Kinetic Properties, in
% Ethanol Metabolism

mdh_deltag = 17.8;              % [kJ/mol] (Schuster1995)
mdh_keq = keq(mdh_deltag);      % niko 1e-3             
mdh_td = (mal_mito*nad_mito - oa_mito*nadh_mito*h_mito/mdh_keq);

mdh_km_mal  = 1.6;
mdh_km_nad  = 0.17;
mdh_km_oa   = 0.086;
mdh_km_nadh = 0.072;

v(mpars.v_ind('MDH')) = Vmax('MDH')*(mal_mito*nad_mito - 1/mdh_keq*oa_mito*nadh_mito) / ...
    ((1+mal_mito/mdh_km_mal)*(1+nad_mito/mdh_km_nad) + ... 
                        (1+oa_mito/mdh_km_oa)*(1+nadh_mito/mdh_km_nadh) - 1); 
   
% *********************************** %
% v12 : NADD : NADH drain
% *********************************** %
% 3.6 nadh_mito + 3.6 h_mito -> 3.6 nad_mito
nadd_deltag = 0;                              % [kJ/mol]
nadd_keq = keq(nadd_deltag);                    % []
nadd_td = (nad_mito^3.6 - nadh_mito^3.6*h_mito^3.6/nadd_keq);

v(mpars.v_ind('NADD')) = Vmax('NADD')*k_drain;


