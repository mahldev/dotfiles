#!/bin/bash
xhost +SI:localuser:mahl

export XAUTHORITY=/run/user/1000/gdm/Xauthority
export DISPLAY=:1

XINPUT_BIN=/usr/bin/xinput

$XINPUT_BIN --set-prop 'pointer:''Razer Razer Viper 8KHz' 'libinput Accel Profile Enabled' 0, 1
$XINPUT_BIN --set-prop 'pointer:''Razer Razer Viper 8KHz' 'libinput Accel Speed' -0

