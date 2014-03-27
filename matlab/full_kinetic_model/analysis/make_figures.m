%% Creates the main figures for the publication from given data folder
% and stores the figures in the figure folders
% The simulation data has to be generated before (make_simulations) and
% the figure export folder has to exist.

% Folders
data_folder   = './110129_data'
figure_folder = './110129_figures'

% Test if the folders exist


%% glucose_dependency
in_folder = data_folder + '/glucose_dependency'
out_folder = figure_folder
make_figures_glucose_dependency(in_folder, out_folder)

%{
%% glucose_lactate_dependency
in_folder = data_folder + '/glucose_lactate_dependency'
out_folder = figure_folder
make_figures_glucose_lactate_dependency(in_folder, out_folder)

%% glucose_glycogen_dependendy
in_folder = data_folder + '/glucose_glycogen_dependency'
out_folder = figure_folder
make_figures_glucose_glycogen_dependency(in_folder, out_folder)

%% insulin_treatment
in_folder = data_folder + '/insulin_treatment'
out_folder = figure_folder
make_figures_insulin_treatment(in_folder, out_folder)
%}



