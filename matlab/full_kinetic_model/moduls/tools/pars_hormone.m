function [ x ] = pars_hormone(hormone, condition)
%PARS_HORMONE Definition of parameters for hormone dose response functions.
% By selecting the hormone and the condition the corresponding parameters
% for the dose response function are returned.

switch hormone
    
    % Insulin dose response parameters
    case 'insulin'
        switch condition
            case 'normal'
                x = [818.9  0   8.6   4.2];
            case 'IGT'
                x = [613.3  0   7.69    3.59];
            case 'T2DM'
                x = [280    0   10.6    6.4];
            case 'extreme_T2DM'
                x = [200    0   10.6    6.4];    
            otherwise
                condition
                error('unknown condition')
        end
    
    % Glucagon dose response parameters
    case 'glucagon'
        switch condition
            case 'normal'
                x = [190    37.9    3.01    6.40];
            case 'IGT'
                x = [135    46.6    3.5   6.48];
            case 'T2DM'
                x = [160     50.8    3.69   5.17];
            case 'extreme_T2DM'
                x = [65     50.8    2.5   5.17];
            otherwise
                condition
                error('unknown condition')
        end
            
    % Epinephrine dose response parameters
    case 'epinephrine'
        switch condition
            case 'normal'
                x = [6090   100     3.10    8.40];
            case 'IGT'
                x = [6090   100     3.10    8.40];
            case 'T2DM'
                x = [7500   100     2.48    6.06];
            case 'extreme_T2DM'
                x = [7500   100     2.48    6.06];
            case 'sleep'
                x = [1510    100     2.71    15];
            otherwise
                condition
                error('unknown condition')
        end
        
    otherwise
        hormone
        error('unknown hormone')
            
end

end

