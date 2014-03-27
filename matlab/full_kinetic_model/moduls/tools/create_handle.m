    function [f] = create_handle(name, f_name)
    % Create the function handle from the given name of the function.
        f = str2func(strcat('m_', name, '_', f_name));
    end