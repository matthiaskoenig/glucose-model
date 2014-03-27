function [Vmax] = pars_Vmax(modus, c)
%% PARS_VMAX Returns Vmax values for the reaction kinetics 
%
% Returns:
%   Vmax:   vector of Vmax values for the model
%
%   author: Matthias Koenig 
%   date:   110211

% Additional settings for perivenious and periportal start values:
% c > 0: HGU    -> pv
% c < 0: HGP    -> pp
if (nargin==1)
    c = 0;
end
% changed enzymes:



Vmaxdata = [%start %lb %ub
            1000        1      100            1000    % v1:     GLUT2 Transporte
            40          1      100     (1+c)* 40      % v2:     Glucokinase
            40          1      100     (1-c)* 40      % v3:     Glucose-6Phosphatase
            1000        1      100            1000    % v4:     GPI
            500         1      100            500     % v5:     G16PI
            100         1      100            100     % v6:     UPGase
            100         1      100            100     % v7:     PPase 
            500         0.1    100            500     % v8:     Glycogen synthase 
            5           1E-5   10             5       % v9:     Glycogen phosphorylase
            0           0       0             0       % v10:    NTK (GTP)            
            1000        1000  1000            1000    % v11:    NTK (UTP)
            0           0      0              0       % v12:    AK
            0.01        1      100     (1+c)* 0.01    % v13:    PFK2
            0.1/1.2     1      100     (1-c)* 0.1/1.2 % v14:    FBP2 
            3           1      1000    (1+c)* 3       % v15:    PFK1
            1           1      1000    (1-c)* 1       % v16:    FBP1
            1000        1      1000           1000    % v17:    ALD
            1000        1      1000           1000    % v18:    TPI
            1000        1      1000           1000    % v19:    GAPDH
            1000        1      1000           1000    % v20:    PGK
            1000        1      1000           1000    % v21:    PGM
            100         1      1000           100     % v22:    Enolase
            200         1      1000           200     % v23:    PK
            0           0      0       (1-c)* 0       % v24:    PEPCK cyto
            1000        10      10000  (1-c)* 1000    % v25:    PEPCK mito
            1000        10      10000         1000          % v26:   PC
            30          1E-7      1           30            % v27:    LDH
            10          1E-7      10          10            % v28:    LacT
            100         1     1000            100           % v29:    PyrT
            100         1      1000           100           % v30:    PepT
            30          1      1000           30            % v31:    PDH
            10          1      1000           10            % v32:    CS
            1000        1000      1000        1000          % v33:    NDK_mito
            0           0      0              0             % v34:    oaa flx
            0           0      0              0       % v35:    acoa flx
            0           0      0              0       % v36:    cit flx    
];
switch modus
    case 'start'
        Vmax = Vmaxdata(:,1);
    case 'lb'
        Vmax = Vmaxdata(:,2);
    case 'ub'
        Vmax = Vmaxdata(:,3);
    case 'pp_pv'
        Vmax = Vmaxdata(:,4);
        
end