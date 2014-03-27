function [res] = modul_plot_init(info)
% Plot the initial concentrations of the module from given modul
% information file.
% Module information file via 'modul_info(name)'

names_s = info.names_s(); 
init    = info.init();

res = {};

disp('-------------------------------------------------------------------')
disp(strcat('Initial concentrations [mM] :   ', info.name))
disp('-------------------------------------------------------------------')

for k=1:length(init)
    fprintf('%i \t %s \t %f \n', k, names_s{k, 1}, init(k))
end
disp('-------------------------------------------------------------------')

