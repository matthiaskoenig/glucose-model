function [c, m, r, map] = mp_oxphos(pars)
%MP_OXPHOS Oxidative phosphorylation example module
%
% - compartments c, metabolites m and reactions r have to be defined
% - at least empty map structure has to be given in initial versions, later
%   versions will test for full mapping of the c, m and r definitions.
%
%   date        110408
%   author      Matthias Koenig
%   version     0.1

% compartment definition (list of all compartments used by metabolites and
% processes)
c = {
    'mm'
    'mito'
    'cyto'
};

% metabolite definition (list of all metabolites with compartments and
% initial concentration). Usage of standard short names.
m = {
    'lac',      'cyto',      2
    'atp',      'cyto',      3
    'adp',      'cyto',      1
    'atp_mito', 'mito',      3
    'adp_mito', 'mito',      1
    'o2_mito',  'mito',      1
    
};

% reactions (list of all processes with compartments and stoichiometries)
r = {
    'OXPHOS', 'cyto',      {-1, 'lac'
                            -1  'o2_mito'
                            -5  'atp_mito'
                             5, 'adp_mito'}
                             
    'ADC',      'mm',      {-1, 'atp_mito'
                            -1, 'adp_mito'
                             1, 'atp'
                             1, 'adp'}
};

% Unique mapping of the compartments, metabolites and reactions to 
% standard components stored as hashmaps based on identifiers
map = struct();

% mapping for compartments
tmp = {
    'cyto',     'cytosol'          
    'mm',       'mitochondrial membrane'
    'mito',       'mitochondrion'
};
map.c = create_ht(tmp);

% mapping for metabolites
tmp = { 
    'lac',      'M12032'
    'o2_mito',  'M00123'
    'atp_mito', 'M00001'
    'atp',      'M00001'
    'adp_mito', 'M00002'
    'adp',      'M00002'
};
map.m = create_ht(tmp);

% mapping for reactions
tmp = {
    'OXPHOS', 'R0017'
    'ADC',    'R0018'
};
map.r = create_ht(tmp);

end

