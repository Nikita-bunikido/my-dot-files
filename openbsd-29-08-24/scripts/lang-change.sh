#!/bin/sh

if [ $(setxkbmap -query | awk 'NR==3{print $2}') == "us" ]; then
	setxkbmap ru;
else
	setxkbmap us;
fi
