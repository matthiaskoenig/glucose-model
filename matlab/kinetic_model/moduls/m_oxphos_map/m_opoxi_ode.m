function [v] = m_opoxi_ode(x, t, mpars)
%% MODEL_OXPHOS_ODE Rate laws for metabolic parts of the reactions
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
%   date:   110821

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
% Concentrations
h_cyto      = x(mpars.x_ind('h_{cyto}'));
na_cyto     = x(mpars.x_ind('na_{cyto}'));
k_cyto      = x(mpars.x_ind('k_{cyto}'));
cl_cyto     = x(mpars.x_ind('cl_{cyto}'));
ca_cyto     = x(mpars.x_ind('ca_{cyto}'));

h_mito      = x(mpars.x_ind('h_{mito}'));
na_mito     = x(mpars.x_ind('na_{mito}'));
k_mito      = x(mpars.x_ind('k_{mito}'));
cl_mito     = x(mpars.x_ind('cl_{mito}'));
ca_mito     = x(mpars.x_ind('ca_{mito}'));

vmm         = x(mpars.x_ind('vmm'));

o2_ext        = x(mpars.x_ind('o2_{ext}'));
o2            = x(mpars.x_ind('o2'));
q_mm          = x(mpars.x_ind('q_{mm}'));
qh2_mm        = x(mpars.x_ind('qh2_{mm}'));
cytcox_mm    = x(mpars.x_ind('cytcox_{mm}'));
cytcred_mm   = x(mpars.x_ind('cytcred_{mm}'));

atp         = x(mpars.x_ind('atp'));
adp         = x(mpars.x_ind('adp'));
p           = x(mpars.x_ind('p'));

atp_mito   = x(mpars.x_ind('atp_{mito}'));
adp_mito   = x(mpars.x_ind('adp_{mito}'));
p_mito     = x(mpars.x_ind('p_{mito}'));
nad_mito   = x(mpars.x_ind('nad_{mito}'));
nadh_mito  = x(mpars.x_ind('nadh_{mito}'));

suc_mito   = x(mpars.x_ind('suc_{mito}'));
fum_mito   = x(mpars.x_ind('fum_{mito}'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vmax = mpars.vmax;
v    = zeros(mpars.Nv, 1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% constants
F = 96490.0;    % [C/mol]
R = 8.3;        % [J/mol/K]
T = 293.0;      % [K]

% membrane capacity
Cm = 0.9e-6;    % [cm^2] 

% geometric constants
N_mito = 1000;                              % [ ] number of mitochondrions
r_cell = 6.36;                              % [10E-6m]
r_mito = 0.35;                              % [10E-6m] radius mitochondrion
A_cell =    1.6 * 4*pi*r_cell^2/(1.0e8);    % [cm^2]
A_mito = N_mito * 4*pi*r_mito^2/(1.0e8);    % [cm^2] area mitochondrions
V_cell =         4.0/3.0*pi*r_cell^3/(1.0e15);  % [L]
V_mito = N_mito *4.0/3.0*pi*r_mito^3/(1.0e15);  % [L]

% membrane permeability
P_h  = 4.0e-4;      % [m/s]
P_cl  = 0.5e-9;     % [m/s]
P_k  = 0.2e-9;      % [m/s]
P_na = 0.1e-9;      % [m/s]
P_ca = 1.0e-9;      % [m/s]

% pumped protons
c1_h   = 4;       % complex 1
c3_h   = 2;       % complex 3
c4_h   = 4;       % complex 4
atps_h = 3;       % atp-synthetase

% scale factor for the oxidative phosphorylation
scale_oxi = 15;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Currents always in direction from cytosol -> mitochondrium
% (cyto) -> I -> (mito)

% currents in [10^-4 A]
% in A=cm*cm, P=m/s, F=C/Mol, X_in/out/sub=mMol/liter=Mol/m^3
% => cm*cm*m/s*C/Mol*Mol/m3 = 10^-4 m^3/s*C*Mol/Mol/m^3 = 10-4 C/s = 10^-4A
U = vmm/1000.0*F/R/T;       % [V]

% [calcium] (k=+2)
% ca_cyto + h_mito -> ca_mito + h_cyto
I_ca_P  = N_mito * 1e-10*(ca_mito - 3e6*ca_cyto^3);       % [10^-4 A] pump
I_ca_ED = 2.0 * (A_mito*U*F)*P_ca * ...
    (ca_cyto-ca_mito*exp(2.0*U))/(1-exp(2.0*U));          % [10^-4 A]
I_ca    = I_ca_ED + I_ca_P;                               % [10^-4 A]

% [chlorid] (k=-1)
I_cl_ED  = (A_mito*U*F)*P_cl * ...
                 (cl_cyto-cl_mito*exp(-U))/(1-exp(-U));   % [10^-4 A]
I_cl     = I_cl_ED;                                       % [10^-4 A]

% [potassium] (k=+1)
% k_cyto + h_mito -> k_mito + h_cyto
I_k_P  = N_mito * 3e-8*(k_cyto*h_mito-k_mito*h_cyto);           % [10^-4 A]
I_k_ED = - A_mito*P_k*U*F*(k_cyto-k_mito*exp(U))/(1-exp(U));    % [10^-4 A]
I_k    = I_k_ED + I_k_P;                                        % [10^-4 A]

% [sodium] (k=+1)
% na_cyto + h_mito -> na_mito + h_cyto
I_na_P  = N_mito * 2e-7*(na_cyto*h_mito-na_mito*h_cyto);        % [10^-4 A]
I_na_ED = - (A_mito*U*F)*P_na * ...
                        (na_cyto-na_mito*exp(U))/(1-exp(U));    % [10^-4 A]
I_na    = I_na_ED + I_na_P; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% thermodynamic
dGpH = R*T/F*1000*log(h_cyto/h_mito);   % [mV]
dGp = - vmm + dGpH;                     % [mV]

Em_N = -291 + 0.5*R*T/F*1000*log(nad_mito/nadh_mito);       % [mV]
Em_Q =   87 + 0.5*R*T/F*1000*log(q_mm/qh2_mm);              % [mV]
Em_C =  221 +     R*T/F*1000*log(cytcox_mm./cytcred_mm);  % [mV]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% C1 - Complex 1 
% c1_h * h_mito + nadh_mito + h_mito + q_mm -> c1_h*h_cyto + nad + qh2_mm
% 4 h_mito + nadh_mito + h_mito + q_mm -> 4 h_cyto + nad + qh2_mm
%Vmax_c1 = 33e-5;
dG1 = Em_Q - Em_N - 2*dGp;
v_c1 = Vmax('C1')* A_mito * (dG1);

% C2 - Complex 2
% suc_mito + q_mm -> fum_mito + qh2_mm 
%Vmax_c2 = 0.55;
c2_km_suc = 1.6;
v_c2 = Vmax('C2') * suc_mito/(suc_mito + c2_km_suc);
v_c2 = 0;   %!!!

% C3 - Complex 3 
% c3_h * h_mito + qh2_mm + cytcox_mm -> c3_h*h_cyto + q_mm + cytcred_mm
% 2 h_mito + qh2_mm + 2 cytcox_mm -> 2 h_cyto + q_mm + 2 cytcred_mm
%Vmax_c3 = 51E-5;
dG3 = Em_C - Em_Q  - dGp;
v_c3  = Vmax('C3') * A_mito * (dG3);

% C4 - Complex 4
% c4_h*h_mito + 2 cytcred + 0.5 o2_mito -> c4_h*h_cyto + 2 cytcox + 0.5 h20_mito
% 4*h_mito + 2 cytcred + 0.5 o2_mito -> 4*h_cyto + 2 cytcox + 0.5 h20_mito
% Vmax_c4 = 15E6;
v_c4  = Vmax('C4') * A_mito /((1+h_cyto/h_mito)^12) * ... 
                    cytcred_mm/(cytcred_mm + 0.01);
                
% ATPS : ATPSynthetase
% atps_h*h_cyto + adp_mito + p_mito -> atps_h*h_mito + atp_mito 
% 3 h_cyto + adp_mito + p_mito -> 3 h_mito + atp_mito 
%Vmax_atps = 6*10E-9;
atps_k_adp = 2.5;       % [mM]
atps_n = 8;
v_atps = Vmax('ATPS') * N_mito * adp_mito^atps_n/(adp_mito + atps_k_adp)^atps_n;

% ATPEX : ATP-ADP-Exchanger mito and cyto
% atp_mito + adp -> atp + adp_mito
% Vmax_atpex = 10.64E-10;
atpex_n = 2;
atpex_k1 = 0.37;
atpex_k2 = 0.4;
v_atpex = Vmax('ATPEX') * N_mito  * adp^atpex_n / ...
            (adp^atpex_n + (atpex_k1*atp)^atpex_n * atp_mito/(atp_mito+atpex_k2));

% PTM : phosphate transport mito
% p_cyto + h_cyto <-> p_mito + h_mito
% Vmax_ptm = 9.65E9*V_mito = 1.7331E-3;
v_ptm = Vmax('PTM') * N_mito * (p*h_cyto - p_mito*h_mito);

% ATPUSE : ATP usage in the cytosol
% atp -> adp + p
% Vmax_atpuse = 68E-6;
v_atpuse =   Vmax('ATPUSE') * N_mito * atp/(atp + 0.1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% proton current
% (cyto) -> I -> (mito)
I_h_MP          = - c1_h*v_c1 - c3_h*v_c3 - c4_h*v_c4;  % pumps oxidative phosphorylation
I_h_P           = - I_na_P - I_k_P - I_ca_P;            % pumps for other ions
I_h_ED          = - (A_mito*U*F)*P_h * (h_cyto-h_mito*exp(U))/(1-exp(U));   % electro-diffusion
I_h_reactions   =   v_ptm + atps_h*v_atps;            % transporter
I_h    =  I_h_MP + I_h_P + I_h_ED + I_h_reactions ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Changes in ion concentration (fluxes)
% I_X=10^-4 A = 10^-4 C/s; I_X / F= 10^-4 C/s / C/Mol = 10^-4 Mol/s;
% I_X/F / Vol = 10^-4 Mol/s / liter = 10^-4 M/s = 10^-1 mM/s daher:
% 1e-1* I_X/F/Vol = mM/s 
v_fac = 1E-1;

v_h         =   v_fac*I_h/F;
v_h_cyto    = - v_h/V_cell;
v_h_mito    =   v_h/V_mito;

v_na         =   v_fac*I_na/F;
v_na_cyto    = - v_na/V_cell;
v_na_mito    =   v_na/V_mito;

v_k         =   v_fac*I_k/F;
v_k_cyto    = - v_k/V_cell;
v_k_mito    =   v_k/V_mito;

v_cl         =   v_fac*I_cl/F;
v_cl_cyto    = - v_cl/V_cell;
v_cl_mito    =   v_cl/V_mito;

v_ca         =   1/2.0 * v_fac*I_na/F;      % stoichiometric factors
v_ca_cyto    = - v_ca/V_cell;
v_ca_mito    =   v_ca/V_mito;

% Membrane voltage
% 1/c_m*A=1/F*cm*cm/cm*cm=1/F=1/C/V=V/C; I_X=10^-4 A =10^-4 C/s
%=>1/(cm*A)*I_X = 10^-4 V/s; v_V soll in 10^-3 V/s gemessen werden:
%=>10^-4 V/s =10^-1 * 10^-3 V/s, daher:

% all electrogen transports ? don't understand this belance (ca?)
v_vmm =  1e-1*1/(Cm*A_mito) * (-I_cl + I_k + I_h + I_na - v_ptm + v_atpex);%  

% metabolite changes
f_cell = 1e-1/F/V_cell;
f_cyto = 1e-1/F/(V_cell-V_mito);
f_mito = 1e-1/F/V_mito;

v_o2 = (20*(o2_ext-o2) + 0.05*I_h_P*f_cyto) * scale_oxi;
v_o2_ext    = 0;

v_q_mm         = 1e7*(-v_c1 - v_c2 + v_c3) * scale_oxi;  % ? why 1E7
v_qh2_mm       = 1e7*(+v_c1 + v_c2 - v_c3) * scale_oxi;  % ? why 1E7
v_cytcox_mm    = 1e7*(-v_c3 + v_c4) * scale_oxi;         %
v_cytcred_mm   = 1e7*(+v_c3 - v_c4) * scale_oxi;         %

v_atp =    (- v_atpuse + f_cyto * v_atpex) * scale_oxi;
v_adp =    - v_atp; 
v_p         = (- v_ptm * f_cyto + v_atpuse) * scale_oxi;

v_atp_mito = (v_atps - v_atpex) * f_mito * scale_oxi;
v_adp_mito =  - v_atp_mito;
v_p_mito    = (v_ptm - v_atps) * f_mito * scale_oxi;

v_nad_mito  =   v_c1 * f_mito * scale_oxi;
v_nadh_mito = - v_nad_mito; 

v_suc_mito = - v_c2 * f_mito * scale_oxi;
v_fum_mito =   v_c2 * f_mito * scale_oxi;

% constant concentrations (handled in dxdt with info from pars_x)
%{
v_h_cyto    = 0;
v_na_cyto   = 0;
v_k_cyto    = 0;
v_cl_cyto   = 0;
v_ca_cyto   = 0;
v_o2_ext    = 0;                   
v_p         = 0;                
%}

v(mpars.v_ind('H_{CYTO}'))      = v_h_cyto;
v(mpars.v_ind('NA_{CYTO}'))     = v_na_cyto;
v(mpars.v_ind('K_{CYTO}'))      = v_k_cyto;
v(mpars.v_ind('CL_{CYTO}'))     = v_cl_cyto;
v(mpars.v_ind('CA_{CYTO}'))     = v_ca_cyto;

v(mpars.v_ind('H_{MITO}'))      = v_h_mito;
v(mpars.v_ind('NA_{MITO}'))     = v_na_mito;
v(mpars.v_ind('K_{MITO}'))      = v_k_mito;
v(mpars.v_ind('CL_{MITO}'))     = v_cl_mito;
v(mpars.v_ind('CA_{MITO}'))     = v_ca_mito;
v(mpars.v_ind('VMM'))           = v_vmm;

v(mpars.v_ind('O2_{EXT}'))      = v_o2_ext;
v(mpars.v_ind('O2'))            = v_o2;

v(mpars.v_ind('Q_{MM}'))        = v_q_mm;
v(mpars.v_ind('QH2_{MM}'))      = v_qh2_mm;
v(mpars.v_ind('CYTCOX_{MM}'))   = v_cytcox_mm;
v(mpars.v_ind('CYTCRED_{MM}'))  = v_cytcred_mm;

v(mpars.v_ind('ATP'))           = v_atp;
v(mpars.v_ind('ADP'))           = v_adp;
v(mpars.v_ind('P'))             = v_p;
v(mpars.v_ind('ATP_{MITO}'))    = v_atp_mito;
v(mpars.v_ind('ADP_{MITO}'))    = v_adp_mito;
v(mpars.v_ind('P_{MITO}'))      = v_p_mito;
v(mpars.v_ind('NAD_{MITO}'))    = v_nad_mito;
v(mpars.v_ind('NADH_{MITO}'))   = v_nadh_mito;

v(mpars.v_ind('SUC_{MITO}'))    = v_suc_mito;
v(mpars.v_ind('FUM_{MITO}'))    = v_fum_mito;





