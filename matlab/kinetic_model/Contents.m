% KINETIC_MODEL
%
% Files
%   model                           - Simulate kinetic model with given parameters
%   model_glycolysis                - Rate laws for integration
%   model_ode_options               - Build ODE System from stoichiometric matrix and flux vector V
%   model_stoichiometry             - stoichiometric matrix of the system
%   names_s                         - Returns metabolite names of the model.
%   names_v                         - Returns metabolite names of the model.
%   pars_Sex                        - Inital metabolite concentrations
%   pars_Vex                        - Returns experimental flux values for the model
%   pars_Vmax                       - Returns Vmax values for the reaction kinetics 
%   sim_glucose_dependency          - Simulate varying external glucose concentrations
%   sim_glucose_glycogen_dependency - Simulate varying glycogen and glucose
%   sim_glucose_insulin_treatment   - Simulate insulin treatment regimes
%   sim_glucose_lactate_dependency  - Simulate varying lactate and glucose
%   sim_insulin_treatments          - Insulin Treatment Analysis
%   sim_make_all                    - Start all simulations
%   sim_OGGT_profile                - simulates a given OGGT profile.
%   sim_single                      - performs single simulation with model
%   sim_single_analysis             - Generates images for simple simulation.
