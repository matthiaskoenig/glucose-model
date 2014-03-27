% sim_mca_hgp_driver
% Calculate the HGP/HGU, gluconeogenesis/glycolysis and
% glycogenolysis/glycogenesis Response coefficient due to small changes in
% the Vmax values
%
% author:   Matthias Koenig
% contact:  matthias.koenig@charite.de
% date:     120311
% version:  0.1
clear all, close all
disp('***Calculate the Respone Coefficients of HGP ***');

load_data = true;
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/mca/120311';
mpars.out_file  = strcat(out_folder, '/mca_response');

% Get the dimension of the system
[c_num, v_num] = size(model_stoichiometry());

glc_vec = [3 8];
glycogen_vec = [50 150 250 350 450];
%glc_vec = [3];
%glycogen_vec = [250];
N_glc = numel(glc_vec);
N_glycogen = numel(glycogen_vec);

if ~load_data
    % number of changed Vmax (v_num)
    R_hgp = zeros(N_glc*N_glycogen, v_num);
    R_glu = zeros(N_glc*N_glycogen, v_num);
    R_gly = zeros(N_glc*N_glycogen, v_num);

    % calculate the response coefficients;
    count = 1;
    for k = 1:N_glc
        for p = 1:N_glycogen
           [R_hgp_tmp, R_glu_tmp, R_gly_tmp] = ...
                sim_mca_hgp(glc_vec(k), glycogen_vec(p));
            R_hgp(count, :) = R_hgp_tmp;
            R_glu(count, :) = R_glu_tmp;
            R_gly(count, :) = R_gly_tmp;
            count = count + 1;
        end
    end
    save(mpars.out_file, 'R_hgp', 'R_glu', 'R_gly', '-v7.3');
else
   load(mpars.out_file); 
end

%% plot the response coefficients

sim_mca_hgp_fig(R_hgp, glc_vec, glycogen_vec, 'HGP/HGU', '01_hgphgu');
sim_mca_hgp_fig(R_glu, glc_vec, glycogen_vec, 'Gluconeogenesis/Glycolysis', '02_glugly');
sim_mca_hgp_fig(R_gly, glc_vec, glycogen_vec, 'Glycogenolysis/Glycogenesis', '03_glygly');
