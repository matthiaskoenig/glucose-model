function [Vmax] = pars_Vmax_new()
%% PARS_VMAX Returns Vmax values for the reaction kinetics 
%
% Returns:
%   Vmax:   vector of Vmax values for the model
%
%   author: Matthias Koenig 
%   date:   110312


d = [
            7000        % SET   v1:     GLUT2 Transporter
            196         % v2:     Glucokinase
            364         % v3:     Glucose-6Phosphatase
            7000        % SET   v4:     GPI
            3500        % v5:     G16PI
            700         % v6:     UPGase
            700         % v7:     PPase 
            3500        % v8:     Glycogen synthase 
            35          % v9:     Glycogen phosphorylase
            0           % v10:    NTK (GTP)            
            7000        % v11:    NTK (UTP)
            0           % SET   v12:    AK
            0.049       % v13:    PFK2
            0.7583      % v14:    FBP2 
            14.7        % v15:    PFK1
            9.1         % v16:    FBP1
            7000        % v17:    ALD
            7000        % v18:    TPI
            7000        % v19:    GAPDH
            7000        % v20:    PGK
            7000        % v21:    PGM
            700         % v22:    Enolase
            1400        % v23:    PK
            0           % v24:    PEPCK cyto
            9100        % v25:    PEPCK mito
            7000        % v26:   PC
            210         % v27:    LDH
            70          % v28:    LacT
            700         % v29:    PyrT
            700         % v30:    PepT
            210         % v31:    PDH
            70          % v32:    CS
            7000        % v33:    NDK_mito
            0           % SET   v34:    oaa flx
            0           % SET   v35:    acoa flx
            0           % SET   v36:    cit flx    
];
Vmax = d;

end