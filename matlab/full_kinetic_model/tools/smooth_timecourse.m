function [f_handle] = smooth_timecourse(t_vec, d_vec, t_change)
% Returns function handle through the timepoints with an t_half changetime
% between data_values
% one less data point needed than time point (data gives the value within
% the interval
%
% author: Matthias Koenig
% data: 120312

if (numel(t_vec) ~= (numel(d_vec)+1) )
    error('Wrong number of datapoints')
end
tmp = t_vec(2:end)-t_vec(1:end-1);
if any(tmp<0)
    error('Timepoints in wrong order')
end

    f_handle = @get_timecourse
    

    function [res] = get_timecourse(t)        
        % find the cornering timepoints and data points
        ind1 = find(t_vec<=t, 1, 'last');
        ind2 = find(t_vec>=t, 1, 'first');
        
        if numel(ind1) == 0
            res = d_vec(1);
            return
        end
        if numel(ind2) == 0
            res = d_vec(end);
            return
        end
        if ind1 == 1
           res = d_vec(1); 
           return
        end
        if ind2 == numel(t_vec);
           res = d_vec(end); 
           return
        end
        
        % start time current interval
        tstart = t_vec(ind1); 
        
        % data in current interval
        d_cur = d_vec(ind1)        
        % data in last interval
        d_last = d_vec(ind1-1)
        
        % which case of interval
        if (d_cur > d_last)
            dtype = 'rising';
        elseif (d_cur < d_last)
            dtype = 'falling';
        else
            disp('[1] constant')
            res = d_cur;
            return
        end
        
        % already risen or fallen
           t_dif = (t-tstart)-t_change
           if (t-tstart) >= t_change
              disp('[2] already changed')
              res = d_cur;
              return
           else
               % still rising
               if strcmp(dtype, 'rising')               
                   disp('rising')
                    res =  d_cur + 0.5*(d_last-d_cur) - ...
                        0.5*(d_cur-d_last) * cos(pi/t_change*(t - tstart));
                    return
                    
                      % glu_tmp = glu_min + 0.5*(glu_max-glu_min) - ...
               % 0.5*(glu_max-glu_min)*cos(pi/base_t*(t - inf_t_end));    
                    
                    
               % still falling
               elseif strcmp(dtype, 'falling')
                   disp('falling')
                   res = d_cur + 0.5*(d_last-d_cur) + ...
                        0.5*(d_last-d_cur) * cos(pi/t_change*(t - tstart));
                   return
               end
           end
    end
        
        
end