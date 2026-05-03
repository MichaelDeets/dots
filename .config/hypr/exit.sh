#!/bin/sh
pkill -f -i pipewire
pkill -f -i pipewire-pulse
pkill -f -i wireplumber 
hyprctl dispatch exit
