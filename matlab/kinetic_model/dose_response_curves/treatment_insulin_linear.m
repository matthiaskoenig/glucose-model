function [ h ] = treatment_insulin_linear(glc, ins_m, dia_strength)
%TREATMENT_INSULIN_LINEAR Generates absolute insulin treatment thearaphy.
%   Returns function handle to the treatment giving the absolute insulin
%   concentrations.

%   Matthias Koenig (matthias.koenig@charite.de)
%   Copyright 2011 Matthias Koenig
%   date:   110225  -   v0.1

h_f = treatment_insulin_linear_f(ins_m, dia_strength);
h = h_f(glc);

end

