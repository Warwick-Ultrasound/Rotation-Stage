function move_rotation_stage(stage, mode, value)
    % moves the rotation stage. The mode can be "abs" or "rel" indicating
    % whether you want to move to an absolute position, or one relative to
    % the current position. The value is in degrees. Will block any further
    % execution until the stage has finished moving.

    factor = 0.01; % degrees/full step (256 usteps in 1 step)

    % calculate absolute position in controller units
    if mode == "abs"
        pos = value/factor;
    elseif mode == "rel"
        status = rotation_stage_status(stage);
        pos = status.CurPosition + value/factor;
    else
        error("invalid mode in move_rotation_stage.");
    end
    upos = pos - floor(pos);
    pos = floor(pos);
    upos = round(upos*256);
    %upos = 0;

    calllib('libximc','command_move', stage, pos, upos);
    status = rotation_stage_status(stage);
    while status.MoveSts % block until complete homing
        status = rotation_stage_status(stage);
    end
end