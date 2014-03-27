% Compare the integration results
format shortg

load('../results/standard.mat');
s = res;
clear res;

load('../results/new.mat');
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