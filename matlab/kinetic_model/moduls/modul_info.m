function [d] = modul_info(name)
% MODEL_INFO Prints information about model of the given name.
% Performs sanity and completeness check of the submodule.
% Has to be called for all the modules before they are put together.
%
%   author: Matthias Koenig
%   date:   110814
d.name = name;

% Get the modul folder and add to path
folder = strcat('./m_', name, '/')
path(path, folder)

% Get the functions for names, stoichiometry and ode
d.names_v       = create_handle(name, 'names_v');
d.names_s       = create_handle(name, 'names_s');
d.stoichiometry = create_handle(name, 'stoichiometry');
d.init          = create_handle(name, 'pars_init');
d.pars          = create_handle(name, 'pars');
d.vmax          = create_handle(name, 'pars_vmax');
d.ode            = create_handle(name, 'ode');

% Perform general checks on the modul definition
% Call the files for testing
% - if the size of the dimensions is correct for the different files
% - if the Vmax >= 0 (info for zero settings)
% - if the init > 0  (info for the zero settings)
names_v     = d.names_v();
names_s     = d.names_s();
vmax        = d.vmax();
init        = d.init();
SM          = d.stoichiometry();
[Ns, Nv]    = size(SM);
mpars       = d.pars();
v_init      = d.ode(init, 0, mpars);

% Call the tests
disp('--------------------')
tests = [   test_01();
            test_02();
            test_03();
            test_04();
            test_05();
            test_06();
            test_07(); % test ODE integration
         ]'
d
disp('--------------------')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function [res] = test_01()
    % test if the right number of Vmax values
        res = 1;
        if size(names_v) ~= size(vmax)
            res = 0;
            error(strcat('Modul: ', name, ...
                ' size names_v() and pars_vmax() mismatch'))
        end
    end

    function [res] = test_02()
    % test if the right number of initial values
        res = 1;
        if size(names_s) ~= size(init)
            res = 0;
            error(strcat('Modul: ', name, ...
                ' size names_s() and pars_init() mismatch'))
        end
    end

    function [res] = test_03()
    % test if negative or zero Vmax values
        res = 1;
        if any(vmax < 0)
            res = 0;
            I = find(vmax<0);
            names_v(I)
            error(strcat('Modul: ', name, ...
                ' Vmax values < 0, negative fluxes'))
        end
        if any(vmax == 0)
            warning(strcat('Modul: ', name, ...
                ' Vmax values = 0, no flux through reactions'))
            I = find(vmax==0);
            names_v(I)
        end
    end

    function [res] = test_04()
    % test if negative or zero initial concentrations
        res = 1;
        if any(init < 0)
            res = 0;
            error(strcat('Modul: ', name, ...
                ' Initial concentrations < 0, negative concentrations'))
        end
        if any(init == 0)
            warning(strcat('Modul: ', name, ...
                ' Initial concentrations = 0, zero concentrations'))
            I = find(init == 0);
            names_s(I)
        end        
    end

    function [res] = test_05()
    % test if the dimensions of the stoichiometric matrix are in accordance
    % with the Vmax values and initial concentrations
        res = 1;
        if (Nv ~= size(vmax))
            res = 0;
            error(strcat('Modul: ', name, ...
                'dimension mismatch size(Vmax) and stoichiometric matrix'))
        end
        if (Ns ~= size(init))
            res = 0;
            error(strcat('Modul: ', name, ...
                'dimension mismatch size(init) and stoichiometric matrix'))
        end
    end
    
    function [res] = test_06()
    % test if the ode_file returns the fitting number of fluxes 
        res = 1;
        if (size(v_init) ~= Nv)
            error(strcat('Modul: ', name, ...
         'dimension mismatch modul_ode(init,0) and stoichiometric matrix'))
        end
    end

    function [res] = test_07()
        % test integration of the system with the given information
        
        % create a combined system of ode equations from modules
        % combine the parameters of the moduls to one parameter struct
        res = 0;
        options = odeset('NonNegative', 1:size(mpars.init));
        [t,c] = ode15s(@(t,y) dxdt_f(t,y), [0 600], mpars.init, options);
        if strcmp(name, 'ppp')
            figure(1)
            plot(t,c(:, [1:5 7:end]))
        end
        if strcmp(name, 'glycolysis')
            figure(1)
            plot(t,c(:,:))
        end
        if strcmp(name, 'glycerol')
            figure(1)
            plot(t,c(:,:))
        end
        
        
        
        res = 1;
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




    function [dxdt] = dxdt_f(t,y)
        dxdt = d.stoichiometry()*d.ode(y,t,mpars);
        % set the constant concentrations
        I = cell2mat({mpars.constant{:,2}});
        dxdt(I) = 0;
    end
        
end