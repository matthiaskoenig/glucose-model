function [] = sim_steele_wall()
% Simulation of the glucose time course depending on the given HGP and HGU
% values.
close all
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Transfer function for the folding
% WALL1956, STEELE1956
% Exponential fitting curves for the time course of glucose change
A1 = 0.804;
A2 = 0.095;
A3 = 0.101;

m1 = 0.804;
m2 = 0.063;
m3 = 0.0092;

% Time course of HGP and GU
tx=(0:1:50)';
x1 = A1 * exp(-m1*tx);
x2 = A2 * exp(-m2*tx);
x3 = A3 * exp(-m3*tx);

% Plot the time course of the function
fig1 = figure('Name', 'Glucose Distribution Curves');
subplot(2,1,1)
plot(tx, x1, 'rs-', tx, x2, 'bs-', tx, x3, 'gs-', tx, (A1/m1 + A2/m2 + A3/m3)*f_eff(tx), 'ks-')
legend ({'x1', 'x2', 'x3', 'f_eff'})

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulated changes in Plasma Glucose Concentration
% Changes have to be integrated

% Given Timecourses of HGP/HGU which can be integrated to changes in the
% plasma glucose
% function handles to gp and gu

t_start = 80;
t_step = 5;
t_end = 230;
t = (t_start:t_step:t_end)';


% Calculate the folding of the function

fig = figure(2)

% Performed simulations
sims = { 'saline'
                'somatostatin' 
                'insulin_replacement'
                'glucagon_replacement'
                'somatostatin_replacement'
              };
N_sims = length(sims);
for k_sim=1:N_sims
    % Get the experimental data for the simulation
    sim = sims{k_sim}
    [f_gp, f_gu, f_glc] = sim_cherrington1976_gugp_f(sim);

    % gp and gu
    subplot(4, N_sims, k_sim)
    plot(t, f_gp(t), 'rs-',  t, f_gu(t), 'bs-', t, f_gp(t)-f_gu(t), 'ks-')
    
    title(sim)
    ylabel('GP, GU, GP-GU [µmol/kg/min]')
    xlabel('time [min]')
    if k_sim == 1
        legend({'gp', 'gu', 'gp-gu'})
    end
    
    % folding effect
    subplot(4,N_sims, N_sims+k_sim)
    A = zeros(size(t));
    for k=1:length(t)
        A(k) = A_eff(t(k)); 
    end
    plot(t, f_gp(t)-f_gu(t), 'rs-', t, A, 'bs-')
    ylabel('GP-GU [µmol/kg/min]')
    xlabel('time [min]')
    if k_sim == 1
        legend('gp-gu', 'A_eff' )
    end
    

    % changes glucose and predicted changes in glucose
    bw_dog = 21.5;   % [kg] Cherrington1976
    bv_dog = 1.4;   % [l]  NIZET1948
                % (15.4)
    f_gpgu = 21.5;   % conversion factor from Cherrington1976

    glc_exp = f_glc(t);     % Cherrington1976
    glc = zeros(size(t)); 
    glc_eff = zeros(size(t));
    delta_glc = zeros(size(t));
    delta_glc_eff = zeros(size(t));

    glc(1) = glc_exp(1);
    glc_eff(1) = glc_exp(1);
    for k=2:length(t)
        % Change in glucose based on immidiate changes 
        delta_glc(k) = (f_gp(t(k-1)+5)-f_gu(t(k-1)+5))*10E-3 * t_step *bw_dog/bv_dog/f_gpgu;     
        
        % Change in glucose based on folding 
        delta_glc_eff(k) = A_eff(t(k-1)+5)*10E-3 * t_step *bw_dog/bv_dog/f_gpgu;   

        glc(k) = glc(k-1) + delta_glc(k);
        glc_eff(k) = glc_eff(k-1) + delta_glc_eff(k);

    end
    % Changes in glucose
    subplot(4,N_sims, 2*N_sims + k_sim)
    plot(t, glc_exp, 'ks-', t, glc, 'rs-')
    %plot(t, glc_exp, 'ks-', t, glc, 'rs-', t, glc_eff, 'bs-')
    ylim([4,9])
    xlabel('time [min]')
    ylabel('glucose [mM]')
    if k_sim == 1
        legend('glc_{exp}', 'glc', 'glc_eff' )
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function [d] = A_eff(x)
       % Calculate the integral
       f = @(t) (f_gp(t) - f_gu(t)).*f_eff(x-t);
       d = quad(f, t_start,x);
    end

    function [f] = f_eff(t)
    % Calculate the effective change in glucose 
        if (t<=0)
            f = 0;
        else
        f = 1/(A1/m1 + A2/m2 + A3/m3) * ...
            (A1 * exp(-m1*t) + A2 * exp(-m2*t) + A3 * exp(-m3*t));
        end
    end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





% fig2 = figure(2);
% sims =  {       'saline'
%                 'somatostatin' 
%                 'insulin_replacement'
%                 'glucagon_replacement'
%                 'somatostatin_replacement'
%               };
% 
% bw_dog =21.5;   % [kg]  % Cherrington1976
% bv_dog = 1.4;   % [l]   % NIZET1948
% for k_sim = 1:length(sims)
%     glc_0 = 6;      % [mM]
%     [f_gp, f_gu] = sim_cherrington1976_gugp_f(sim);
%     
%     
%     % Integrate the glucose equation
% 
%     dglc_dt(t) = ( gp_f(t) - gu_f(t) ) 
% 
%     delta_glc = (-data.gu_sim(kt-1) + data.gp_sim(kt-1) )*10E-3 * t_step * bw/bv
% 
% end
end