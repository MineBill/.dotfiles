#!/bin/bash

active_sink=$(pactl list short sinks | grep "analog-stereo" | awk 'BEGIN {FS="\t"}; {print $1}')

case $1 in
	toggle)
		pactl set-sink-mute $active_sink toggle
		;;
	+)
		amixer set Master ${2}%+
		;;
	-)
		amixer set Master ${2}%-
		;;
	*)
		echo "Unrecognized option"
		;;
esac
