function [x_opt] = optimize_epinephrine_curve(condition, data) 
%% Optimize the curve given the data

% condition = 'normal'
% condition = 'IGT'
% condition = 'T2DM'
% epi_max = x_opt(1)
% epi_base = x_opt(2)
% k_epi = x_opt(3)
% n_epi = x_opt(4)

% Function which is optimized
dose_response_function = @epinephrine_function;

% select Data, constraints, and constraints for optimization based on
% condition
switch condition
    case 'normal'
        x0 = [6000 0 4 5];
        A = [
            -1  0  0  0
             1  0  0  0
             0  1  0  0
             0 -1  0  0
             0  0  1  0
             0  0 -1  0
             0  0  0  1
             0  0  0 -1 
            ];
        b = [ -2000 7500 100 0 7 -2 15 -1 ]';
    case 'IGT'
        x0 = [6000 0 4 5];
        A = [
            -1  0  0  0
             1  0  0  0 
             0  1  0  0
             0 -1  0  0
             0  0  1  0
             0  0 -1  0
             0  0  0  1
             0  0  0 -1 
            ];
        b = [ -2000 7500 100 0 7 -2 15 -1 ]';
    case 'T2DM'
        x0 = [6000 0 4 5];
        A = [
            -1  0  0  0
             1  0  0  0
             0  1  0  0
             0 -1  0  0
             0  0  1  0
             0  0 -1  0
             0  0  0  1
             0  0  0 -1 
            ];
        b = [ -2000 7500 100 0 7 -2 15 -1 ]';
    case 'sleep'
        x0 = [1000 0 4 5];
        A = [
            -1  0  0  0
             1  0  0  0
             0  1  0  0
             0 -1  0  0
             0  0  1  0
             0  0 -1  0
             0  0  0  1
             0  0  0 -1 
            ];
        b = [ -500 3000 100 0 7 -2 15 -1 ]';
end

%% optimization
% options = optimset('LargeScale', 'off', 'MaxFunEvals', 1E6);
[x_opt, fval, exitflag, output] = fmincon(@fitness_function, x0, A, b);
%fval
%exitflag
%output

%% helper functions
    function f = fitness_function(x)
        % objective function
        % minimize the quadratic distance between curve and the data points
        f = 0;
        for k=1:length(data(:,1))
            f = f + (data(k,2) - dose_response_function(data(k,1), x) )^2; 
        end
    end

end