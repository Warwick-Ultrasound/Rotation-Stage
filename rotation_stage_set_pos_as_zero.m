function rotation_stage_set_pos_as_zero(stage)
    % sets the current position of the stage to be zero degrees. 

    calllib('libximc','command_zero', stage)
end