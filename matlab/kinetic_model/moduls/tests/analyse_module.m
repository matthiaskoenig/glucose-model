function [] = analyse_module(f_module, pars)
%%ANALYSE_MODULE Basic overview over module content
%
% Called with the module definition function.
% Displays information from module definition.

% TODO: create stoichiometric matrix
% TODO: link  two modules together
% TODO: generate a simple diffusion layout
% TODO: generate hepatocyte sinosoid model

%   date        110406
%   author      Matthias Koenig
%   version     0.1

if nargin == 1
    pars = [];
end

% General information of module
%help(func2str(f_module))

% Get the module information
[c, m, r, map] = f_module(pars);

% Test the module definition
test_compartment_map(c, map);
test_metabolite_map(m, map);
test_reaction_map(r, map);

test_metabolites(m, map);
test_reactions(r, map);

% Test for unused components
test_unused_metabolites()
test_unused_compartments()

% print compartments
fprintf('\n*** Compartments ***\n');
print_compartments(c, map)

% print metabolites
fprintf('\n*** Metabolites ***\n');
print_metabolites(m, map)

% print reactions
fprintf('\n*** Reactions ***\n');
print_reactions(r, map)

% print stoichiometric matrix
fprintf('\n*** N ***\n');
N = create_N(r, map);
print_N(N);



    function res = test_compartment_map(c, map)
    % Test if all the compartments are maped to the correct identifiers
    res = true;
    if isfield(map, 'c')
        ht = map.c;
    else
        res = false;
        return
    end
    % 1. test if all compartments are maped
    for k=1:length(c)
        if ht.containsKey(c{k,1}) ~= true
            fprintf(' "%s" not found in compartment map', c(k))
            res = false;
        end
    end
    % 2. test if the mapping is correct
    
    end

    function res = test_metabolite_map(m, map)
    % Test if all the metabolites are maped to the correct identifiers
    res = true;
    if isfield(map, 'm')
        ht = map.m;
    else
        res = false;
        return
    end
    % 1. test if all metabolites are maped    
    for k=1:size(m,1)
        if ht.containsKey(m{k,1}) ~= true
            fprintf(' "%s" not found in metabolite map', m{k,1})
            res = false;
        end
    end
    % 2. test if the mapping is correct
    
    end

    function res = test_reaction_map(r, map)
    % Test if all reactions are maped to correct identifiers
    res = true;
    if isfield(map, 'm')
        ht = map.r;
    else
        res = false;
        return
    end
    % 1. test if all metabolites are maped

    for k=1:size(r,1)
        if ht.containsKey(r{k,1}) ~= true
            fprintf(' "%s" not found in metabolite map', m(k))
            res = false;
        end
    end
    % 2. test if the mapping is correct
    end


    function res = test_metabolites(m, map)
    % Tests if all compartments used in the metabolites are defined in the
    % compartments definition
    res = true;
    
    end

    function res = test_reactions(r, map)
    % Tests if all metabolites used in the reactions are defined in the
    % metabolites definition
    res = true;
    
    % Tests if all compartments used in the reactions are defined in the
    % metabolites definition
    
    
    end

    function res = test_unused_metabolites()
    % Tests if metabolites are defined which are not used in any reaction
    end

    function res = test_unused_compartments()
    % Tests if compartmets are defined which are not used in any metabolite
    % or reaction
    end

    function N = create_N(r, map)
    % Create the stoichiometric matrix from the given reactions 
        N = [];
    end

    function print_N(N)
    % print the stoichiometric matrix for the module
        N = [];
    end


    function [] = print_compartments(c, map)
        tf = isfield(map, 'c');
        if tf == 0
            for k = 1:length(c)
                fprintf('[%i] %s\n', k, c{k,1}');
            end
        else
            ht = map.c;
            for k = 1:length(c)
                fprintf('[%i] %10s\t%10s\n', k, c{k,1}, ht.get(c{k,1}));
            end
        end
    end


    function [] = print_metabolites(m, map)
        if isfield(map, 'm') == false
            for k = 1:size(m,1)
                fprintf('[%i] %s (%s)\t %5g mM\n', k, m{k,1}, m{k,2}, m{k,3});
            end
        else
            ht = map.m;
            for k = 1:size(m,1)
                fprintf('[%i] %s\t%s (%s)\t %5g mM\n', k, ht.get(m{k,1}), m{k,1}, m{k,2}, m{k,3} );
            end
        end
    end


    function [] = print_reactions(r, map)
        if isfield(map, 'r') ~= false
            for k = 1:size(r,1)
                eq = make_equation(r{k,3});
                fprintf('[%i] %s\t%s\n', k, r{k,1}, eq);
        
            end
        else
            ht = map.r;
            for k = 1:size(r,1)
                fprintf('[%i] %s\t%s (%s)\t %5g mM\n', k, ht.get(m{k,1}), m{k,1}, m{k,2}, m{k,3} );
            end
        end
    end

    function eq = make_equation(data)
       sep = '<=>';
       eq = '';
       % sort on the left and right side
       left = {};
       right = {};
       for k=1:length(data)
           if data{k,1} < 0
              left{end+1} = ['+ ', num2str(-1 * data{k,1}), ' ', data{k,2}];
           else
               right{end+1} = ['+ ', num2str(data{k,1}), ' ', data{k,2}];
           end
       end
       % combine to equation string
       for k=1:length(left)
          eq = [eq, ' ', left{k}];
       end
       eq = [eq, ' ', sep];
       for k=1:length(right)
          eq = [eq, ' ', right{k}];
       end
       
       eq = strcat(eq);
       
    end
        
        


end