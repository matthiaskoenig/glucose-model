function [f] = hormone_constant_f(value)
%HORMONE_CONSTANT_F Calculate function handle to constant hormone
%concentration. Needed if no dose-response curve is used, but the response
%is based on external calculations

f = @hormone_handle;

    function h = hormone_handle(glc)  
        h = value;
    end

end
