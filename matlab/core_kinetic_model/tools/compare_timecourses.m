function [] = compare_timecourses(sim_fname, ref_fname)
% Control class to check that different model implementations
% give the same timecourse and flux results.
% Compare the integration results provided in the two files.

format shortg

% load simulation 
load(sim_fname);
s = res;
clear res;

% load reference
load(ref_fname);
x = res;
clear res;

fprintf('\n* Difference c *\n');
fprintf('----------------\n');
fprintf('c(0)  c(end)\n');
fprintf('----------------\n');
delta_c = [(s.c(1,:) - x.c(1,:))' (s.c(end,:) - x.c(end,:))']

fprintf('\n* Difference v *\n');
fprintf('----------------\n');
fprintf('v(0)  v(end)\n');
fprintf('----------------\n');
delta_v = [(s.v(1,:) - x.v(1,:))' (s.v(end,:) - x.v(end,:))']

disp('******************************');
disp('* Delta c > 1E-6 *');
find(abs(delta_c) > 1E-6)
disp('* Delta v > 1E-6 *');
find(abs(delta_v) > 1E-6)

% disp('******************************');
% disp('* Delta c > 1E-8 *');
% find(abs(delta_c) > 1E-8)
% disp('* Delta v > 1E-8 *');
% find(abs(delta_v) > 1E-8)
% disp('******************************');
% disp('* Delta c > 1E-10 *');
% find(abs(delta_c) > 1E-10)
% disp('* Delta v > 1E-10 *');
% find(abs(delta_v) > 1E-10)
% disp('******************************');

end