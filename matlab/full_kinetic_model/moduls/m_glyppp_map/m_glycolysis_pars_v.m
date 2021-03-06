function [v_names, vmax, v_ind] = m_glycolysis_pars_v(c)
%% M_PPP_PARS_V Definition of the flux names and Vmax values
%
% Returns:
%   v_names: cellarray of names
%   Vmax:    map of vmax values
%
%   author: Matthias Koenig 
%   date:   110820

% f is adaption factor of hepatic glucose metabolism from pp to pv
% Additional settings for perivenious and periportal start values:
% c > 0: HGU    -> pv
% c < 0: HGP    -> pp
if (nargin==0)
    c = 0;
end


% scaling factors for glycolysis and pentose phosphate pathway
fac_gly     = 0.42;
fac_2       = 0.4;

% flux data
data = {
'GLUT2',            fac_gly * 1000     % v1   
'GK',      (1+c)* fac_gly * 60      % v2   
'G6PASE',           (1-c)* fac_gly * 45           % v3   
'GPI',                     fac_gly * 1000              % v4
'G16PI',                        fac_2 * 250            % v5
'UPGASE',                       fac_2 * 200           % v6
'PPASE',                        fac_2 * 6           % v7 
'GS',                           fac_2 * 33              % v8 
'GP',                           fac_2 * 17              % v9
'NTK (GTP)',                    fac_2 * 0       % v10            
'NTK (UTP)',               fac_gly * 7000       % v11
'AK',                      fac_gly * 0              % v12
'PFK2',             (1+c)* fac_gly * 0.01            % v13
'FBP2',             (1-c)* fac_gly * 0.30           % v14
'PFK1',             (1+c)* fac_gly * 17.1           % v15
'FBP1',             (1-c)* fac_gly * 10.3            % v16
'ALD',                     fac_gly * 1000            % v17
'TPI',                     fac_gly * 1000             % v18
'GAPDH',                   fac_gly * 1000           % v19
'PGK',                     fac_gly * 1000            % v20
'PGM',                     fac_gly * 1000             % v21
'EN',                      fac_gly * 85.7              % v22
'PK',                      fac_gly * 110              % v23
'PEPCK',             (1-c)*fac_gly * 0       % v24
'PEPCK_{mito}',      (1-c)*fac_gly * 1300      % v25
'PC',                      fac_gly * 400             % v26
'LDH',                     fac_gly * 30             % v27
'LACT',                    fac_gly * 12.9           % v28
'PYRT',                    fac_gly * 100            % v29
'PEPT',                    fac_gly * 80            % v30
'PDH',                     fac_gly * 32             % v31
'CS',                      fac_gly * 10             % v32
'NDK_{mito}',              fac_gly * 1000        % v33
'OAA_{flx}',                0         % v34
'ACOA_{flx}',               0        % v35
'CIT_{flx}',                0        % v36
}

v_names = data(:,1);
vmax     = containers.Map(v_names, cell2mat(data(:,2)));
v_ind    = containers.Map(v_names, [1:length(v_names)]);    % necessary if stoichiometric matrix

end