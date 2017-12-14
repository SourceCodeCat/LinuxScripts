#! /bin/bash

HAND=$1
NUM_PARAMS=$#
HELP="-------------------------------------------\nthe script aims to change the orientation of the WACOM tablet to Left handed or Right Handed.\nPass 'left' for left handed orientation or pass 'right' for right handed orientation\n-------------------------------------------"

#echo $NUM_PARAMS
#echo -e $HELP

if [ $NUM_PARAMS -gt 0 ]; then
	if [ "$HAND" == "left" ]; then
		echo "configuring as Left Handed!"
		xsetwacom set "Wacom Bamboo Pen Pen stylus" Rotate half
		xsetwacom set "Wacom Bamboo Pen Pen eraser" Rotate half
	elif [ "$HAND" == "right" ]; then
		echo "configuring as Right Handed!"
		xsetwacom set "Wacom Bamboo Pen Pen stylus" Rotate none
		xsetwacom set "Wacom Bamboo Pen Pen eraser" Rotate none
	else
		echo -e $HELP
	fi
else
	echo -e $HELP
fi
