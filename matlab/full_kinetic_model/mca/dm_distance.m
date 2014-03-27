function [d] = dm_distance(data_ref, data, I_out, d_type)
% DM_DISTANCE Calculates the relative distance between reference data and
% data. 
%   
%   I_out  : indeces deleted and not used for comparison
%   d_type : type of distance measurement
%
%   author: Matthias Koenig
%   date:   110810

    switch d_type
        case 'mean_square'
            dist_f = @f_mean_square;
        case 'mean_lin'
            dist_f = @f_mean_lin;
        otherwise
            error('Invalid distance function');
    end
    
    % delete data (if not all entries should be compared)
    data_ref(I_out) = [];
    data(I_out) = [];
    
    % calculate distance with given distance function
    assert(length(data_ref) == length(data))
    N = length(data_ref);
    d = dist_f(data_ref, data);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    function [d] = f_mean_square(a,b)
    % mean square distance between vectors
        d = 0;
       for k=1:N
          d = d + ( (a(k) - b(k))/a(k) )^2;
       end
       d = d/N;
       
       %d = sum ( ( a-b./a ).^2) /N;
    end
    
    function [d] = f_mean_lin(a,b)
    % mean absolute distance between vectors
       d = 0;
       for k=1:N
          d = d + abs(a(k) - b(k))/a(k);
       end
       d = d/N;
       
       % d = sum ( abs( (a-b)./a ) );
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
