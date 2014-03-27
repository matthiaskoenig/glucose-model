function [Vmax] = pars_Vmax_opt()
%% PARS_VMAX Returns Vmax values for the reaction kinetics 
%
% Returns:
%   Vmax:   vector of Vmax values for the model
%
%   author: Matthias Koenig 
%   date:   110312

% Optimization hints
% - adapt pp concentration via ppase to udpgase ratio

d = [
            1000                % SET   v1:     GLUT2 Transporter
            500         % v2:     Glucokinase
            260         % v3:     Glucose-6Phosphatase
            7000                % SET   v4:     GPI
            3500 %3500   % v5:     G16PI
            1000        % v6:     UPGase
            5           % v7:     PPase 
            45          % v8:     Glycogen synthase 
            70          % v9:     Glycogen phosphorylase
            0                   % SET   v10:    NTK (GTP)            
            1000                % SET   v11:    NTK (UTP)
            0                   % SET   v12:    AK
            0.05        % v13:    PFK2
            2.0        % v14:    FBP2 
            25         % v15:    PFK1
            50         % v16:    FBP1
            1000         % v17:    ALD
            1000         % v18:    TPI
            1000         % v19:    GAPDH
            1000         % v20:    PGK
            1000         % v21:    PGM
            5         % v22:     Enolase
            500 %400    % v23:    PK
            0                   % SET v24:    PEPCK cyto
            100         % v25:    PEPCK mito
            2000         % v26:    PC
            2           % v27:    LDH
            100         % v28:    LacT
            7000        % v29:    PyrT
            2000         % v30:    PepT
            30           % v31:    PDH
            20          % v32:    CS
            7000                % SET v33:    NDK_mito
            0                   % SET   v34:    oaa flx
            0                   % SET   v35:    acoa flx
            0                   % SET   v36:    cit flx    
];
Vmax = d;

end