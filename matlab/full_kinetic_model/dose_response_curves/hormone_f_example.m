function [f] = hormone_f_example()
%HORMONE_F Calculate function handle to the hormone function for the given
%hormone and condition.

f = @hormone_handle;

htypes = {'increase', 'decrease'}
n = [2 4 6 8];
lnames = {'n=2','n=4','n=6','n=8'} 
xtest = [1 0 5]
glc = 0:0.1:15;
A = zeros(length(glc), length(n));


fig1 = figure('Name', 'Equation 1 and 2', 'Color', [1 1 1]);
for k=1:length(htypes)
    htype = htypes{k}
    subplot(1,2,k)
    for p = 1:length(n)
        np = n(p);
        A(:,p) = f(glc, [xtest np], htype);
    end
    hold off
    plot(glc, A)
    if k==1
        title('Equation 2 (k=5mM, h_{max}=1, h_{base}=1)')
    elseif k==2
        title('Equation 3 (k=5mM, h_{max}=1, h_{base}=1)')
    end
    xlabel('glucose [mM]')
    ylabel('h(glc)')
    legend(lnames);
    axis square   
    grid on
end

    function h = hormone_handle(glc, x, htype)
        switch htype
            case 'increase'
                h = x(2) + (x(1)-x(2)) .* glc.^x(4) ./ (glc.^x(4) + x(3)^x(4));
            case 'decrease'
                h = x(2) + (x(1)-x(2)).*( 1 - glc.^x(4)./(glc.^x(4) + x(3)^x(4)) );
        end
        
    end

bold_subplots();
end
