function [c, m, r, map] = mp_glycolysis(pars)
%MP_GLYCOLYSIS Glycolysis example module
% Simplified module of glycolysis comprised of lumped reactions. Example
% for the the layout of module files.
%
% - compartments c, metabolites m and reactions r have to be defined
% - at least empty map structure has to be given in initial versions, later
%   versions will test for full mapping of the c, m and r definitions.
%
%   date        110326
%   author      Matthias Koenig
%   version     0.1

% compartment definition (list of all compartments used by metabolites and
% processes)
c = {
    'cyto'
    'ext'
    'pm'
};

% metabolite definition (list of all metabolites with compartments and
% initial concentration). Usage of standard short names.
m = {
    'glc',      'cyto',      3
    'glc_ext',  'ext',       6
    'lac',      'cyto',      2
    'lac_ext',  'ext',       0
    'atp',      'cyto',      3
    'adp',      'cyto',      1
};

% reactions (list of all processes with compartments and stoichiometries)
r = {
    'GLY', 'cyto',      {-1, 'glc'
                         -2, 'adp'
                          2, 'atp'
                          2, 'lac'}
              
    'GLCT', 'pm',       {-1, 'glc_ext' 
                          1, 'glc'}
              
    'LACT', 'pm',       {-1, 'lac' 
                          1, 'lac_ext'}
                          
    'ATPASE', 'cyto',      {-1, 'atp' 
                           1, 'adp'}
};

% Unique mapping of the compartments, metabolites and reactions to 
% standard components stored as hashmaps based on identifiers
map = struct();

% mapping for compartments
tmp = {
    'cyto',     'cytosol'          
    'ext',      'blood'
    'pm',       'plasma membrane'
};
map.c = create_ht(tmp);

% mapping for metabolites
tmp = { 
    'glc',      'M12032'
    'glc_ext',  'M12032'
    'lac',      'M00023'
    'lac_ext',  'M00023'
    'atp',      'M00001'
    'adp',      'M00002'
};
map.m = create_ht(tmp);

% mapping for reactions
tmp = {
    'GLY',  'R0001'
    'GLCT', 'R0014'
    'LACT', 'R0015'
    'ATPASE', 'R0016'
};
map.r = create_ht(tmp);

end

