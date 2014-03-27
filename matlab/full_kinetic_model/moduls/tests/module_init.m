function [x0, xnames, rnames, N] = module_init(modules, pars)
% Calculate the indices in the matrix for the given modules
% Generates the input and output indeces and the stoichometric matrix based
% on the given modules
% Alsp the vector of initial concentrations is generated here.

if nargin == 1
    pars = struct();
end

% Use hashtable to store the metabolites and reactions
m_all       = java.util.Hashtable;
r_all       = java.util.Hashtable;
m0_all      = java.util.Hashtable;

m_shared    = java.util.Hashtable;
r_shared    = java.util.Hashtable;

mcount = 1;
rcount = 1;

% Generate the hashtables
for k = 1:length(modules)
    
    % Get the function handle for module
    f = modules{k};
    name = func2str(f)
    
    
    % Call the function handle for module
    [c, m, r, map] = f(pars); 
    
    % Store all the metabolites used in the module in the hashtable
    for p = 1:size(m,1)
        key = m{p,1};
        m0  = m{p,3};
        if m_all.containsKey(key)
            m_shared.put(key, m_all.get(key));
        else
            m_all.put(key, mcount);
            m0_all.put(key, m0);
            mcount = mcount + 1;
        end
    end
    
    % If reactions are shared it has to be defined which version should be
    % used (removal of reactions, blackbox events and more).
    for p = 1:size(r,1)
        key = r{p,1};
        if r_all.containsKey(key)
            r_shared.put(key, r_all.get(key))
            warning(strcat('Shared reaction between modules: ', key));
        else
            r_all.put(key, name);
            rcount = rcount +1;
        end
    end
end

m_all
r_all
m0_all
m_shared
r_shared

% Generate xnames, rnames and x0
xnames = cell(mcount, 1);
x0     = zeros(mcount, 1);
rnames = cell(rcount, 1);

xkeys = m_all.keySet()
for key_ind = 1:length(xkeys);
   key = xkeys(key_ind);
   value = m_all.get(key);
   x0_value = m0_all.get(key);
   
   
   key
   value
   round(value)
   
   
   xnames{round(value), 1} = key;
   x0(round(value), 1)     = x0_value;
end
xnames
x0

for key = r_all.keySet()
   value = r_all.get(key);
   rnames{int8(value), 1} = key;
end
rnames



% Generate the stoichiometric matrix 
% Go over all reactions
N = zeros(rcount, mcount);

% x_inds
%dxdt_inds

% Generate the indeces for all modules. Which components from x should be
% used and where are the dxdt integrated into dxdt_all


