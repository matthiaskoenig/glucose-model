[t, x, v] = simulate_modules()
%SIMULATE_MODULS Simulate the registered modules and return the time

% TODO:
% 1. Simulate single module
% 2. Simulate combined modules
% 3. Generate cubes
% 4. Simulate cube layouts
% 5. Simulate layout sinusoid


% All data of the model is stored in structure M
% Module definitions (definition of ODEs
modules = {
            @mp_blood_left
            @mp_blood_middle
            @mp_blood_right
            @mp_glycolysis
            @mp_oxphos
           };

cubes = {
           @cube_hepatocyte(@mp_glycolyis, @mp_oxphos), 10
           @cube_blood_left(@mp_blood_left), 1
           @cube_blood_middle(@mp_blood_middle), 18
           @cube_blood_right(@mp_blood_right), 1
           };
       
% Interfaces are defined in the cubes (contact areas to next cubes)
       


}
% Layout (define the cubes and in which cubes the modules are located)
cubes = {
            
% Calculate the indices in the matrix for the given modules
% Generates the input and output indeces and the stoichometric matrix based
% on the given modules
% Alsp the vector of initial concentrations is generated here.
[x_ins, dxdt_inds, xnames, r_names, N] = module_init(modules)


% Generate the function handle for the derivative function from the
% registered modules
% Get a function handle that can be called with (t,x,pars)
M.dxdt = f_dxtd_all(M.modules, M.indices);


% Define additional parameters which control the behaviour in the modules
pars.z = 'test';

% Generate initial concentration vector from registered modules
% Handle varying concentrations of shared metabolites in modules
M.x0   = @make_x0(M);



% Simulate the given system
opt=odeset('AbsTol', 1e-10);
tspan = [0 100];
[t,x]=ode15s(M.dxdt,[0 1e6], M.xO, opt, pars);
dd=size(x);
x0=x(dd(1),:); %Ruhezustand

% calculate the fluxes
v = 0;
