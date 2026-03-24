function status = rotation_stage_status(stage)
    % returns the current status of the rotation stage
    status = ximc_get_status(stage);
end