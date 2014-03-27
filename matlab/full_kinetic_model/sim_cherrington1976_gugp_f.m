function [f_gp, f_gu, f_glc] = sim_cherrington1976_gugp_f(sim)
%GUGP_F Calculate function handle to the gu and gp time courses

% get data for simulation
d = sim_cherrington1976_data(sim);

% create function handle
f_gp = @gp_handle;
f_gu = @gu_handle;
f_glc = @glc_handle;

    % functions are linear interpolations of the given time curves
    function gu = gu_handle(t)
        gu = lin_interp_value(t, d.gu_t, d.gu_data);
    end

    function gp = gp_handle(t)
        gp = lin_interp_value(t, d.gp_t, d.gp_data);
    end

    function gp = glc_handle(t)
        gp = lin_interp_value(t, d.glc_t, d.glc_data);
    end
end