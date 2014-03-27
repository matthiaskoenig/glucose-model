function ht = create_ht(m)
%%CREATE_HT Creates hashtable from given cell array.
% Used for the storage of the mapping information for the compartments,
% reactions and metabolites.

%   date        110326
%   author      Matthias Koenig
%   version     0.1

    % Create the hashtables for the metabolite mapping
    ht = java.util.Hashtable;
    for k=1:length(m)
        ht.put(m{k,1}, m{k,2});
    end
    
end