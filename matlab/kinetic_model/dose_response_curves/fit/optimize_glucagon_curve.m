function [x_opt] = optimize_glucagon_curve(condition, data) 
%% Optimize the curve given the data

% condition     = 'normal'
% condition     = 'IGT'
% condition     = 'T2DM'

% hormone_max   = x_opt(1)
% hormone_base  = x_opt(2)
% k_hormone     = x_opt(3)
% n_hormone     = x_opt(4)

% Function which is optimized
dose_response_function = @glucagon_function;


% select Data, constraints, and constraints for optimization based on
% condition
switch condition
    case 'normal'
        x0 = [100 5 4 5];
        A = [
            -1  0  0  0
             0  1  0  0
             0 -1  0  0
             0  0  1  0
             0  0 -1  0
             0  0  0  1
             0  0  0 -1 
            ];
        b = [ -190 50 0 7 -2 15 -1 ]';
    case 'IGT'
        x0 = [50 10 4 5];
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
        b = [-135 170 70 0 3.5 -3.5 15 -1 ]';
    case 'T2DM_1'
        x0 = [-50 10 4 5];
        A = [
            -1  0  0  0
             0  1  0  0
             0 -1  0  0
             0  0  1  0
             0  0 -1  0
             0  0  0  1
             0  0  0 -1 
            ];
        b = [ -50 70 0 7 -2 15 -1 ]';
    case 'T2DM_2'
        x0 = [-50 10 4 5];
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
        b = [ -50 100 70 0 7 -2 15 -1 ]';    
end

%% optimization
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