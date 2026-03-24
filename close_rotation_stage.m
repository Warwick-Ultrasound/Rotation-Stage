function dev = close_rotation_stage(dev)
    % takes the device ID and closes the connection to the stage. Returns
    % an empty array to indicate that the device has been closed.
    device_id_ptr = libpointer('int32Ptr', dev);
    calllib('libximc','close_device', device_id_ptr);
    dev = [];
end