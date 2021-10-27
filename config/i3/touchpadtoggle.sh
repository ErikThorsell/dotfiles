#!/bin/bash
VALUE=xinput list-props 11 | grep "Synaptics Off 

if [ "$VALUE" = "0" ]; then
    synclient TouchpadOff=1
    VALUE="1"
else
    synclient TouchpadOff=0
    VALUE="0"
fi;
