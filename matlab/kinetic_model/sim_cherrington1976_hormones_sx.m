function [ins, glu, gu] = sim_cherrington1976_hormones_sx(t, sim, ins_max, glu_max, gu_max)
% Function which calculates the hormone profiles during the infusion based
% on the given experimentell data. 
% The data is transferred from dog to human by taking the relative change
% in value relative the mean of the initial control period.

% Time points in between experimentell data points are linearly
% interpolated

    type_m = 'preinfusion_infusion';
    
    %% Calculate the mean of the initial time interval before infusion
    % get data for simulation
    d = sim_cherrington1976_data(sim);

    % Calculate the mean relative to which the changes in hormones and
    % glucose utilization are measured.
    
    switch type_m
        case 'preinfusion'
            % mean of ins, glu and gu in preinfusion perion (135 min)
            ins_mean = mean(d.ins_data(1:4));
            glu_mean = mean(d.glu_data(1:4));
            gu_mean = mean(d.gu_data(1:3));
        case 'preinfusion_infusion'
            %ins_mean = mean(d.ins_data(1:9));
            %glu_mean = mean(d.glu_data(1:9));
            ins_mean = mean(d.ins_data(1:4));
            glu_mean = mean(d.glu_data(1:4));
            gu_mean = mean(d.gu_data(1:9));
    end

    % get the current experimentell value by linear interpolation
    ins_abs = lin_interp_value(t, d.ins_t, d.ins_data);
    ins = ins_abs/ins_mean * ins_max;

    glu_abs = lin_interp_value(t, d.glu_t, d.glu_data);
    glu = glu_abs/glu_mean * glu_max;

    gu_abs = lin_interp_value(t, d.gu_t, d.gu_data);
    gu = gu_abs/gu_mean * gu_max;

end