function home_rotation_stage(stage)
    % homes the rotation stage

    calllib('libximc','command_move', stage, 0, 0);
    status = rotation_stage_status(stage);
    while status.MoveSts % block until complete homing
        status = rotation_stage_status(stage);
    end
end