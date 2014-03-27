function [ ] = make_figures_glucose_dependency(in_folder, out_folder)
%% Generate images from data in 'in_folder' in 'out_folder'

files = {'glucose_dependency_normal',
        'glucose_dependency_diabetes',
        'glucose_dependency_insulin_restored',
        'glucose_dependency_glucagon_restored'}
    
for k=1:length(files)
    file = files(k);
    in_file = in_folder + '/' + file;
    out_file = out_folder + '/' + file;

    make_figure_glucose_dependency(in_file, out_file);

end