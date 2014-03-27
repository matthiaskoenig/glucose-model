function [x_opt] = optimize_insulin_curve(condition) 
%% Optimize the curve given the data
% Fitting of the dose response curves for the hormones depending on
% glucose.
% Data points for fit and initial guesses as well as an assumed functional
% relationship for the hormones from glucose are needed for the fit.
%
% Fit curves for insulin, glucagon and epinephrine for the normal cases and
% for cases of impaired glucose tolerance or T2DM.
% condition = 'normal'
% condition = 'IGT'
% condition = 'T2DM'
% ins_max = x_opt(1)
% ins_base = x_opt(2)
% k_ins = x_opt(3)
% n_ins = x_opt(4)

% Data for the normal insulin dose response curve via OGGT
data_insulin_normal = [
    data_insulin_normal_OGGT_Ferrannini1988
    data_insulin_normal_OGGT_Fery1993
    data_insulin_normal_Lerche2009	 
    data_insulin_normal_OGGT_Gerich1993
    data_insulin_normal_OGGT_Basu2009	 
    data_insulin_normal_OGGT_Henkel2005
    data_insulin_normal_OGGT_Butler1991	 
    data_insulin_normal_OGGT_Knop2007
    data_insulin_normal_OGGT_Cobelli2010	 
    data_insulin_normal_OGGT_Mitrakou1992
];
% Data for the insulin dose response curve via OGGT in impaired glucose
% tolerance (IGT)
data_insulin_IGT = [
    data_insulin_IGT_OGGT_Butler1991  
    data_insulin_IGT_OGGT_Henkel2005
    data_insulin_IGT_OGGT_Fery1993
    data_insulin_IGT_OGGT_Mitrakou1992
];
% Data for the insulin dose response curve via OGGT in T2DM
data_insulin_T2DM = [
    data_insulin_T2DM_OGGT_Fery1993
    data_insulin_T2DM_OGGT_Basu2009	 
    data_insulin_T2DM_OGGT_Gerich1993
    data_insulin_T2DM_OGGT_Butler1991	 
    data_insulin_T2DM_OGGT_Henkel2005
    data_insulin_T2DM_OGGT_Ferrannini1988
    data_insulin_T2DM_OGGT_Knop2007
];

% select Data, constraints, and constraints for optimization based on
% condition
switch condition
    case 'normal'
        data = data_insulin_normal;
        x0 = [520 20 8.33 5];
        A = [
            -1  0  0  0
             0  1  0  0
             0 -1  0  0
             0  0  1  0
             0  0 -1  0
             0  0  0  1
             0  0  0 -1 
            ];
        b = [ -500 50 0 12 -3 7 -2 ]';
    case 'IGT'
        data = data_insulin_IGT;
        x0 = [520 20 8.33 5];
        A = [
            -1  0  0  0
             0  1  0  0
             0 -1  0  0
             0  0  1  0
             0  0 -1  0
             0  0  0  1
             0  0  0 -1 
            ];
        b = [ -200 50 0 12 -3 7 -2 ]';
    case 'T2DM'
        data = data_insulin_T2DM;
        x0 = [520 20 8.33 5];
        A = [
            -1  0  0  0
             0  1  0  0
             0 -1  0  0
             0  0  1  0
             0  0 -1  0
             0  0  0  1
             0  0  0 -1 
            ];
        b = [ -200 50 0 12 -3 7 -2 ]';
end

%% optimization
% options = optimset('LargeScale', 'off', 'MaxFunEvals', 1E6);
[x_opt, fval, exitflag, output] = fmincon(@fitness_function, x0, A, b);
fval
exitflag
output

%% helper functions
    function f = fitness_function(x)
        % objective function
        % minimize the quadratic distance between curve and the data points
        f = 0;
        for k=1:length(data(:,1))
            f = f + (data(k,2) - insulin_function(data(k,1), x) )^2; 
        end
    end

end