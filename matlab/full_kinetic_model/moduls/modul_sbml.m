function [] = modul_sbml(info, out_folder)
%MODUL_SBML Generate SBML from the given modul definitions. Used for export
%and cytoscape visualization.
%
% author:   Matthias Koenig
% date:     110816

if (nargin < 2)
    out_folder = './';
end

% info contains all the information necessary for the SBML
info.stoichiometry();
info.names_s();
info.names_v();

% use python script for the visualization
