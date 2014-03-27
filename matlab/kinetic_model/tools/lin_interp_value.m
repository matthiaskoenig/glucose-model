function [values] = lin_interp_value(t, t_vec, data_vec)
   % returns the linear interpolated data value for the given time
   % point. If the timepoint is before the first data point the first
   % data point is used. If the timepoint is after the last data point
   % the last data point is used.
   
   %disp('Interpolation')
   if numel(t_vec) ~= numel(data_vec)
       error('wrong dimensions');
   end
   
   % vectorized version of the function
   values = zeros(size(t));
   for k=1:length(t)
        t_val = t(k);
       
       % index before the timepoint
       ind_f = find(t_vec <= t_val, 1, 'last');
       if numel(ind_f) == 0;
           ind_f = 1;
       end
       t_f = t_vec(ind_f);
       data_f = data_vec(ind_f);

       % index after the timepoint
       ind_l = find(t_vec >= t_val, 1, 'first');
       if numel(ind_l) == 0;
           ind_l = numel(t_vec);
       end
       t_l = t_vec(ind_l);
       data_l = data_vec(ind_l);

       % calculate the linear interpolation
       if t_l == t_f
           values(k) = data_f;
       else
           values(k) = data_f + (t_val-t_f)/(t_l-t_f) * (data_l-data_f);
       end
   
   end
end
    