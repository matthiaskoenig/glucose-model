function [f] = hormone_f(hormone, condition)
%HORMONE_F Calculate function handle to the hormone function for the given
%hormone and condition.

x = pars_hormone(hormone, condition);
f = @hormone_handle;


    function h = hormone_handle(glc)
        switch hormone
            case 'insulin'
                h = x(2) + (x(1)-x(2)) .* glc.^x(4) ./ (glc.^x(4) + x(3)^x(4));
            case 'glucagon'
                h = x(2) + (x(1)-x(2)).*( 1 - glc.^x(4)./(glc.^x(4) + x(3)^x(4)) );
            case 'epinephrine'
                h = x(2) + (x(1)-x(2)).*( 1 - glc.^x(4)./(glc.^x(4) + x(3)^x(4)) );
            otherwise
                condition
                error('unknown hormone')
                
        end
        
    end

end
