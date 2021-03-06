function [Vmax] = pars_Vmax_opt(c)
%% PARS_VMAX Returns Vmax values for the reaction kinetics 
%
% Returns:
%   Vmax:   vector of Vmax values for the model
%
%   author: Matthias Koenig 
%   date:   110312

% Optimization hints
% - adapt pp concentration via ppase to udpgase ratio

% f is adaption factor of hepatic glucose metabolism from pp to pv
% Additional settings for perivenious and periportal start values:
% c > 0: HGU    -> pv
% c < 0: HGP    -> pp
if (nargin==0)
    c = 0;
end

fac_gly = 0.42;
fac_2 = 0.4;
d = [
  fac_gly * 1000                % SET   v1:     GLUT2 Transporter
 (1+c)* fac_gly * 60         % v2:     Glucokinase
 (1-c)* fac_gly * 45         % v3:     Glucose-6Phosphatase
  fac_gly * 1000                % SET   v4:     GPI
    fac_2 * 250 %3500   % v5:     G16PI
    fac_2 * 200        % v6:     UPGase
    fac_2 * 6           % v7:     PPase 
    fac_2 * 33          % v8:     Glycogen synthase 
    fac_2 * 17          % v9:     Glycogen phosphorylase
    fac_2 * 0                   % SET   v10:    NTK (GTP)            
  fac_gly * 7000                % SET   v11:    NTK (UTP)
  fac_gly * 0                   % SET   v12:    AK
  (1+c)* fac_gly * 0.01        % v13:    PFK2
  (1-c)* fac_gly * 0.30        % v14:    FBP2 
  (1+c)* fac_gly * 17.1         % v15:    PFK1
  (1-c)* fac_gly * 10.3         % v16:    FBP1
  fac_gly * 1000         % v17:    ALD
  fac_gly * 1000         % v18:    TPI
  fac_gly * 1000         % v19:    GAPDH
  fac_gly * 1000         % v20:    PGK
  fac_gly * 1000         % v21:    PGM
  fac_gly * 85.7         % v22:     Enolase
  fac_gly * 110 %400    % v23:    PK
  (1-c)*fac_gly * 0                   % SET v24:    PEPCK cyto
  (1-c)*fac_gly * 1300         % v25:    PEPCK mito
  fac_gly * 400         % v26:    PC
  fac_gly * 30           % v27:    LDH
  fac_gly * 12.9         % v28:    LacT
  fac_gly * 100        % v29:     PyrT
  fac_gly * 80         % v30:    PepT
  fac_gly * 32           % v31:    PDH
  fac_gly * 10          % v32:    CS
  fac_gly * 1000                % SET v33:    NDK_mito
            0                   % SET   v34:    oaa flx
            0                   % SET   v35:    acoa flx
            0                   % SET   v36:    cit flx    
];
Vmax = d;

end