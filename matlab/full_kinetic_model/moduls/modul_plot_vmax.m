function [res] = modul_plot_vmax(info)
% Plot the initial concentrations of the module from given modul
% information file.
% Module information file via 'modul_info(name)'

names = info.names_v(); 
data  = info.vmax();

res = {};

disp('-------------------------------------------------------------------')
disp(strcat('Vmax values :   ', info.name))
disp('-------------------------------------------------------------------')

for k=1:length(data)
    fprintf('%i \t %s \t %f \n', k, names{k, 1}, data(k))
end
disp('-------------------------------------------------------------------')

