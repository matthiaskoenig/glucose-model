function [dxdt] = mv4_dxdt(c)
%% MV4_DXDT ODE rate laws for model v4
%  Definition of the rate laws and calculation of the fluxes for the given
%  parameters and concentrations. This function is called by the ODE
%  integration routine.
%  
%   dxdt                vector of fluxes (changes in ODE)
%   c                   vector of concentrations

% Units
%   time: minutes     [s] ,  
%   concentration     [mM] = [mmol/l] 
%   volume:           [l]
%
%   author: Matthias Koenig 
%           Charite Berlin
%           Computational Systems Biochemistry Berlin
%           matthias.koenig@charite.de
%   date:   110805


%% Test for negative concentrations
if any(find(c<0))
   warning('Negative concentrations !!!')
   for k=1:length(c)
      if c(k) < 0
          c(k)
          k
          c(k) = 0;
      end
   end
end

%% Concentrations
GE = c(1);  % glucose extern
G  = c(2);  % glucose%
GY = c(3);  % glycogen
L  = c(4);  % lactate
LE = c(5);  % lactate extern

%% Rates from fited response curves
x = GE; y = GY;
        C = [  -0.013260401508103  -0.000078240970095   0.478235644004833  ...
                0.000002861605817   0.000932752106971  -2.492569641130055  ...
                0.000000166945924  -0.000125285017396   0.015354944655784  ...
               -4.975026288067225];
v_gly = 90E-3 * 1/60 *( ... 
                C(1)*x^3 + C(2)*x^2*y + C(3)*x^2 + C(4)*x*y^2 + C(5)*x*y ...
                +C(6)*x + C(7)*y^3 + C(8)*y^2 + C(9)*y + C(10) );
            
        C = [   0.015298362033754  -0.000289250010776  -0.547536679729713  ...
               -0.000005684726209   0.010350112006466   6.232845830004314  ...
               -0.000000348461291   0.000282613503037  -0.115405862243966  ...
              -13.439952615163973];
v_glys = 90E-3 * 1/60 *( ...
            C(1)*x^3 + C(2)*x^2*y + C(3)*x^2 + C(4)*x*y^2 + C(5)*x*y ...
            +C(6)*x + C(7)*y^3 + C(8)*y^2 + C(9)*y + C(10) );    

% adaption of gluconeogenesis rate for low lactate
p_KLE = 0.1;    % [mM]
p_n  = 2;      
v_gly(v_gly<0) = LE^p_n/(LE^p_n + p_KLE^p_n) * v_gly(v_gly<0);

% adaption of glycogenolysis rate for low glycogen and
% adaption of glycogen synthesis rate for high glycogen (has to reach zero)
% due to polynom fit not absolute zero
p_GY = 5;
p_C = 500;
v_glys(v_glys<0) = GY^p_n/(GY^p_n + p_GY^p_n) * v_glys(v_glys<0);
v_glys(v_glys>0) = (p_C-GY)^p_n/((p_C-GY)^p_n + p_GY^p_n) * v_glys(v_glys>0);
         

% *********************************** %
% v1 : GLC transporter (import)
% *********************************** %
% GLC_ext <-> GLC
v1 = v_gly + v_glys;

% *********************************** %
% v2 : LAC transporter (import)
% *********************************** %
% LAC_ext <-> LAC
% lactate uptake rate relative to glycolysis
v2 = -2 * v_gly;

% *********************************** %
% v3 : 2 LAC -> GLC (gluconeogenesis)
% *********************************** %
% 2 LAC <-> GLC
v3 = - v_gly;

% *********************************** %
% v4 : Glycogen synthesis
% *********************************** %
% GLY -> GLC
v4 = v_glys;

%% RETURN FLUXES
dxdt  = [v1 v2 v3 v4]';
