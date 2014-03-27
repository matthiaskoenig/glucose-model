function [ph] = sim_mca_double_muts()
% SIM_MCA_DOUBLE_MUTS
% Simulate compensatory double mutations for given single mutation.
% Reference state is the undisturbed system state. 
% The double mutation is scored based on the difference in steady state
% fluxes and concentrations between the reference state and the double
% mutation state.
%
%   Compensatory effect is different for different external glucose
%   concentrations.
%
% author: Matthias Koenig
% date  : 110810

% file for storage of double mutants
out_folder = '/home/mkoenig/Desktop/kinetic_model_results/simulations/110810_data/mca';
save(strcat(out_folder, '/tmp'))     % test if possible to save to folder

d_type = 'mean_lin';         % type of distance function for calculation
glc_ext = 3;                 % reference glucose
out_file = strcat(out_folder, '/mca_g6p_double_mutants_tmp_glc_', num2str(glc_ext));

% concentrations and fluxes not used for difference calculation
Ic_out = [1:3 8:10 12:14 17 32:35 41:42 45:49];
Iv_out = [10 12 24 34:36];


%% Reference state (undisturbed)
vmax_ref = pars_Vmax_opt(); 
[c_ref, v_ref] = get_steady_state_data(vmax_ref, glc_ext);
ph_ref = struct(    'name', 'reference', ...
                    'dm_index', NaN, ...
                    'dm_activity', NaN, ...
                    'c_ss', c_ref, ...
                    'v_ss', v_ref, ...
                    'd_c', 0.0, ...
                    'd_v', 0.0, ...
                    'd_t', 0.0);

%% Single mutation 
sm_index = 3;           % glucose-6p (30% activity)
sm_activity = 0.3;
sm_name = 'g6p_0.3';
vmax_sm = vmax_ref;
vmax_sm(sm_index) = sm_activity * vmax_sm(sm_index);  
[c_sm, v_sm] = get_steady_state_data(vmax_sm, glc_ext); 
d_c_sm = dm_distance(c_ref, c_sm, Ic_out, d_type);
d_v_sm = dm_distance(v_ref, v_sm, Iv_out, d_type);
d_t_sm = d_c_sm + d_v_sm;
ph_sm = struct(     'name', 'sm_name', ...
                    'dm_index', NaN, ...
                    'dm_activity', NaN, ...
                    'c_ss', c_sm, ...
                    'v_ss', v_sm, ...
                    'd_c', d_c_sm, ...
                    'd_v', d_v_sm, ...
                    'd_t', d_t_sm);

%% Double mutation
% store dm information in solution struct
ph_dm = struct(    'name', {}, ...
                'dm_index', {}, ...
                'dm_activity', {}, ...
                'c_ss', {}, ...
                'v_ss', {}, ...
                'd_c', {}, ...
                'd_v', {}, ...
                'd_t', {})

% Variance in the Vmax values for double mutation
[c_num, v_num] = size(model_stoichiometry());
v_names = names_v();
%dm_activities = [linspace(0.1, 0.9 ,9) linspace(1.1, 2.0, 10) 3.0 4.0 5.0];
dm_activities = [0.1 0.5];

counter = 1;
for dm_index = 1:v_num
    for dmai = 1:length(dm_activities)
        
        % do not mutate single mutation enzyme
        if dm_index == sm_index
            continue
        end
        
        % do not mutate reactions which have no effect
        if any(Iv_out == dm_index)
           continue 
        end
        
        % generate double mutation
        dm_activity = dm_activities(dmai);
        name = strcat('dm_', sm_name, '_', v_names{dm_index}, '_', num2str(dm_activity));
        vmax_dm = vmax_ref;
        vmax_dm(sm_index) = sm_activity * vmax_dm(sm_index);
        vmax_dm(dm_index) = dm_activity * vmax_dm(dm_index);
        
        % calculate dm steady states
        [c_dm, v_dm] = get_steady_state_data(vmax_dm, glc_ext);
        
        % calculate distances
        d_c_dm = dm_distance(c_ref, c_dm, Ic_out, d_type);
        d_v_dm = dm_distance(v_ref, v_dm, Iv_out, d_type);
        d_t_dm   = d_c_dm + d_v_dm;
        
        % create solution struct and store
        ph_dm(counter) = struct('name', name, ...
                                'dm_index', dm_index, ...
                                'dm_activity', dm_activity, ...
                                'c_ss', c_dm, ...
                                'v_ss', v_dm, ...
                                'd_c', d_c_dm, ...
                                'd_v', d_v_dm, ...
                                'd_t', d_t_dm);
        counter = counter +1;        
                            
        % display the result
        disp_mutation(name, dm_index, dm_activity, d_c_dm, d_v_dm, d_t_dm);
        
    end
end
% Save the data
save(out_file, 'ph_ref', 'ph_sm', 'ph_dm')

% Display the mutation phenotype
function disp_mutation(name, vi, mut_val, dist_c_dm, dist_v_dm, dist_dm)
    name
    [vi mut_val dist_c_dm dist_v_dm dist_dm]
end

end