function [f] = tc_generator(modus, m_max, m_base)
%TC_GENERATOR Generates timecourses of metabolite depending on the
% given modus of timecourse and the given m_init parameters.
% Returns function handle to function which calculates the actual value of
% the metabolites depending on time.

%f = [];
switch modus
    case 'constant'
        f = @f_constant;
    case 'gauss'
        f = @f_gauss;
    case 'sinus'
        f = @f_sinus;
    case 'step'
        f = @f_step;
end


    function m = f_constant(t)
    % Constant response over time
        m = m_max * ones(1, length(t));
    end
    

    function m = f_gauss(t)
    % Gauss peak over time
        sigma = 1;      % [s] standard deviation
        mu = 15;          % [s] peak location
        m = m_base + (m_max-m_base) * normpdf(t,mu,sigma)/normpdf(mu,mu,sigma);
    end


    function m = f_sinus(t)
    % Sinus response between m_init and m_base
        f = 0.05;                  % [Hz]
        tau = 0;
        m = m_base + 0.5*(m_max-m_base) + 0.5*(m_max-m_base)*sin(2*pi*f*t + tau);
    end

    function m = f_step(t)
    % Stepwise response for certain time
        t_start = 10;    % [s] time until onset
        t_dur = 10;   % [s] duration of step
        t_end = t_start + t_dur;

        % better with logical test
        m = ones(1, length(t));
        for k=1:length(t)
            if t(k) >= t_start && t(k) <= t_end 
                m(k) = m_max;
            else
                m(k) = m_base;
            end
        end
    end
end