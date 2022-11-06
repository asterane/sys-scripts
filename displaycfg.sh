#!/usr/bin/bash

export DISPLAY=:0

USER_NAME=`whoami`
HDMI_STAT=`cat /sys/class/drm/card0/*HDMI*/status`
HDMI_DISP=`xrandr | rg "HDMI" | cut -f1 -d' '`

echo "name: $USER_NAME ; stat: $HDMI_STAT" >> /home/matthew/bin/log.log

if [ $HDMI_STAT == "connected" ]
then
    if [ $USER_NAME == "root" ]
    then
        xrandr --output eDP --auto --output $HDMI_DISP --off
    else
        xrandr --output $HDMI_DISP --auto --output eDP --off
    fi
else
    if [ $USER_NAME == "root" ]
    then
        xrandr --output $HDMI_DISP --auto --output eDP --off
    else
        xrandr --output eDP --auto --output $HDMI_DISP --off
    fi
fi
