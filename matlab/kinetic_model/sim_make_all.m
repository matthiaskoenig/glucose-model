%SIM_MAKE_ALL Perform all necessary simulations in batch mode.
%
%  ! the settings for the simulations have to be defined in the individual
%  simulation files before all simulations are started !
%  
%  Outer script to start the simulations over night. The output folder has
%  to be set before start and the folders for the output have to be
%  generated (Test folders).

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110225  -   v0.1

sim_glucose             = 1;
sim_glucose_glycogen    = 1;
sim_glucose_treatments  = 0;
sim_glucose_gamma       = 1;
%sim_glucose_lactate     = 1;

main_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110314_data/';
dia_strengths = {'extreme_T2DM'}

%% Test folders
% glucose_dependency
if sim_glucose
    folder = strcat(main_folder, 'glucose_dependency/');
    % test folders
    for k=1:length(dia_strengths)
        dia_strength = dia_strengths{k};
        out_folder = strcat(folder, dia_strength)
        save(strcat(out_folder, '/tmp'))     % test if possible to save to folder
        %sim_glucose_dependency(out_folder, dia_strengths{k})
    end
end
%glucose_glycogen_dependency
if sim_glucose_glycogen
    folder = strcat(main_folder, 'glucose_glycogen_dependency/');
    for k=1:length(dia_strengths)
        dia_strength = dia_strengths{k};
        out_folder = strcat(folder, dia_strength)
        save(strcat(out_folder, '/tmp'))     % test if possible to save to folder
        %sim_glucose_glycogen_dependency(out_folder, dia_strength);
    end
end

% glucose_insulin_treatment
if sim_glucose_treatments
    folder = strcat(main_folder, 'glucose_insulin_treatment/');
    % test folders
    for k=1:length(dia_strengths)
        dia_strength = dia_strengths{k};
        out_folder = strcat(folder, dia_strength)
        save(strcat(out_folder, '/tmp'))     % test if possible to save to folder
        %sim_glucose_insulin_treatment(out_folder, dia_strengths{k})
    end
end

%glucose_gamma_dependency
if sim_glucose_gamma
    out_folder = strcat(main_folder, 'glucose_gamma_dependency/');
    save(strcat(out_folder, '/tmp'))     
    %sim_glucose_gamma_dependency(out_folder);
end

%% Simulate
% glucose_dependency
if sim_glucose
    folder = strcat(main_folder, 'glucose_dependency/');
    % test folders
    for k=1:length(dia_strengths)
        dia_strength = dia_strengths{k};
        out_folder = strcat(folder, dia_strength)
        save(strcat(out_folder, '/tmp'))     % test if possible to save to folder
        sim_glucose_dependency(out_folder, dia_strengths{k})
    end
end
%glucose_glycogen_dependency
if sim_glucose_glycogen
    folder = strcat(main_folder, 'glucose_glycogen_dependency/');
    for k=1:length(dia_strengths)
        dia_strength = dia_strengths{k};
        out_folder = strcat(folder, dia_strength)
        save(strcat(out_folder, '/tmp'))     % test if possible to save to folder
        sim_glucose_glycogen_dependency(out_folder, dia_strength);
    end
end

%glucose_insulin_treatment
if sim_glucose_treatments
    folder = strcat(main_folder, 'glucose_insulin_treatment/');
    % test folders
    for k=1:length(dia_strengths)
        dia_strength = dia_strengths{k};
        out_folder = strcat(folder, dia_strength)
        save(strcat(out_folder, '/tmp'))     % test if possible to save to folder
        sim_glucose_insulin_treatment(out_folder, dia_strengths{k})
    end
end

%glucose_gamma_dependency
if sim_glucose_gamma
    out_folder = strcat(main_folder, 'glucose_gamma_dependency/');
    save(strcat(out_folder, '/tmp'))     
    sim_glucose_gamma_dependency(out_folder);
end
