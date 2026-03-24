function device_id = find_rotation_stage()
    % finds any connected devices, picks the first one (corresponding to
    % channel 1) and returns the device ID which is used in future funtion
    % calls
    
    if not(libisloaded('libximc'))
        [notfound,warnings] = loadlibrary('libximc.dll', @ximcm); % ensure library is imported
    end

    probe_flags = 1 + 4; % ENUMERATE_PROBE and ENUMERATE_NETWORK flags used
    enum_hints = 'addr=192.168.1.1,172.16.2.3';
    % enum_hints = 'addr='; % Use this hint string for broadcast enumeration
    devs = ximc_enumerate_devices_wrap(probe_flags, enum_hints);
    devices_count = size(devs,2);
    if devices_count == 0
        disp('No devices found')
        return
    end
    for i=1:devices_count
        disp(['Found device: ', devs{1,i}]);
    end

    device_name = devs{1,1};
    disp(['Using device name ', device_name]);

    device_id = calllib('libximc','open_device', device_name);
    disp(['Using device id ', num2str(device_id)]);

    serial = ximc_get_serial_number(device_id);
    disp(['Serial ' mat2str(serial,100)]);

    evalc("ximc_set_microstep_256(device_id)"); % evalc suppresses output
end
