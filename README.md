# Rotation-Stage
A MATLAB wrapper library that makes it easier to control the electronic rotation stage.

# Prerequisites
You must first install the SDK for the motor driver from https://doc.xisupport.com/en/8smc5-usb/8SMCn-USB/Programming/Programming_guide/Working_with_8SMC4-USB_in_Matlab.html, following the instructions on the web page to install it in the correct directory

Once the SDK is installed, copy this code into your MATLAB folder, or somewhere else on the MATLAB path before using the functions.

# Description of functions

## find_rotation_stage
Finds the rotation stage and returns the device ID which is used in further function calls.

## home_rotation_stage(device_ID)
Homes the rotation stage to the set zero point.

## rotation_stage_set_pos_as_zero(device_ID)
Sets the current position to zero.

## move_rotation_stage(device_ID, mode, value)
Moves the rotation stage. The mode is a string and can take values "abs" or "rel" to move to an absolute value or a relative one. This function will block further execution of code until the stage has finished moving.

## rotation_stage_status(device_ID)
Returns a struct with lots of information about what the stage is currently doing, its position, etc. This function is called in a lot of the other functions.

## close_rotation_stage(device_ID)
closes the connection to the stage, and returns an empty array to replace the device_ID with so that you know it has been closed. Always call this function before trying to reopen the connection.
