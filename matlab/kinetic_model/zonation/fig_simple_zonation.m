function [] = fig_simple_zonation(t_all, glc_ext_all, lac_ext_all, x_all, v_all, pars, init)
%%FIG_SIMPLE_ZONATION Generates overview images for the resulting flux
%%along the sinosoid.
% Using the resulting flux and concentration distributions from the
% integration of the ODE system and the parameters.
close all

if nargin == 0
    load 'test.mat'
end

x = (1:pars.N_cells);


% plot the hormone concentrations
fig1 = figure('Name', 'Hormone concentrations');
for k=1:3
    subplot(3,1,k) 
    switch k
        case 1
            y = init.ins;
            plot(x, y, 'ko-');
            ylabel('insulin [pmol/l]', 'FontWeight', 'bold')
        case 2
            y = init.glu;
            plot(x, y, 'bo-');
            ylabel('glucagon [pmol/l]', 'FontWeight', 'bold')
        case 3
            y = init.epi;
            plot(x, y, 'ro-');
            ylabel('epinephrine [pmol/l]', 'FontWeight', 'bold')
    end
    xlabel('[pp] -> [pv]', 'FontWeight', 'bold');
    ylim([0 y(1)*1.1]);
    xlim([0, pars.N_cells+1]);
    
end
init.ins([1,end])
init.glu([1,end])
init.epi([1,end])

% plot the initial glucose and lactate concentrations
fig2 = figure('Name', 'Metabolite concentrations');
for k=1:2
    subplot(2,1,k) 
    switch k
        case 1
            y1 = init.glc_ext;
            y2 = glc_ext_all(:, end);
            plot(x, y1, 'ko-', x, y2, 'bo-');
            ylabel('glucose [mM]', 'FontWeight', 'bold')
            ylim([0 max(max(y1,y2))*1.1]);
        case 2
            y1 = init.lac_ext;
            y2 = lac_ext_all(:, end);
            plot(x, y1, 'ko-', x, y2, 'bo-');
            ylabel('lactate [mM]', 'FontWeight', 'bold')
            ylim([0 max(max(y1,y2))*1.1]);
    end
    xlabel('[pp] -> [pv]', 'FontWeight', 'bold');
    xlim([0, pars.N_cells+1]);
end

% video of external blood flux (movement of glucose front over time)
fig3 = figure('Name', 'Metabolite concentrations');
for k=1:2
    subplot(2,1,k) 
    switch k
        case 1
            y = glc_ext_all;
            pcolor( (1:pars.N_blood), t_all, y');
            title('glucose [mM]', 'FontWeight', 'bold')
        case 2
            y = lac_ext_all;
            pcolor((1:pars.N_blood), t_all, y');
            title('lactate [mM]', 'FontWeight', 'bold')
    end
    xlabel('[pp] -> [pv]', 'FontWeight', 'bold');
    ylabel('time [s]', 'FontWeight', 'bold');
    %ylim([0 y(1)*1.1]);
    %xlim([0, pars.N_cells+1]);
end

% plot the resulting glucose and lactate fluxes
fig4 = figure('Name', 'Fluxes in model');
for k=1:3
    subplot(3,1,k) 
    switch k
        case 1
            y = squeeze(v_all(1,:,:))
            pcolor( (1:pars.N_blood), t_all, y');
            title('HGU/HGP [µmol/kg/min]', 'FontWeight', 'bold')
        case 2
            y = squeeze(v_all(4,:,:))
            pcolor( (1:pars.N_blood), t_all, y');
            title('GLY/GNG [µmol/kg/min]', 'FontWeight', 'bold')        
        case 3
            y = squeeze(-v_all(6,:,:))
            pcolor( (1:pars.N_blood), t_all, y');
            title('GGS/GGL [µmol/kg/min]', 'FontWeight', 'bold')
    end
    xlabel('[pp] -> [pv]', 'FontWeight', 'bold');
    ylabel('time [s]', 'FontWeight', 'bold');
end

% plot HGP/HGU, glycolysis, gluconeogenesis ...
fig5 = figure('Name', 'HGP, HGU');
for k=1:3
    subplot(3,1,k)
    switch k
        case 1
            y = squeeze(v_all(1,:,end))
            plot( (1:pars.N_blood), y, 'ko-');
            title('HGP[-]/HGU[+] [µmol/kg/min]', 'FontWeight', 'bold')
        case 2
            y = squeeze(v_all(4,:,end))
            plot( (1:pars.N_blood), y, 'ko-');
            title('GNG[-]/GLY[+] [µmol/kg/min]', 'FontWeight', 'bold')        
        case 3
            y = squeeze(-v_all(5,:,end))
            plot( (1:pars.N_blood), y, 'ko-');
            title('GGL[-]/GGS[+] [µmol/kg/min]', 'FontWeight', 'bold')
    end
    xlabel('[pp] -> [pv]', 'FontWeight', 'bold');
end





