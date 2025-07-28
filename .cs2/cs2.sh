#!/bin/bash -a
GAMEROOT=$(cd "${0%/*}" && echo $PWD)
UNAME=/bin/uname

export LD_LIBRARY_PATH="${GAMEROOT}"/bin/linuxsteamrt64:$LD_LIBRARY_PATH
export ENABLE_PATHMATCH=1

# custom envvars
export AMD_TEX_ANISO="0"
export ENABLE_VKBASALT="1"
export LD_PRELOAD="/usr/lib64/libSDL3.so.0"
export MANGOHUD="1"
export PULSE_LATENCY_MSEC="6"
export RADV_TEX_ANISO="0"
export SDL_VIDEO_DRIVER=wayland
export VKBASALT_LOG_LEVEL="none"

GAMEEXE=bin/linuxsteamrt64/cs2
MAIN="-nojoy -noasert -noautoargs -nocrashdialog -nominidumps -novsync"
LAUNCHOPTS="$MAIN"

cd "$GAMEROOT"

STATUS=42
while [ $STATUS -eq 42 ]; do
	"${GAMEROOT}"/${GAMEEXE} $LAUNCHOPTS -- $@
	STATUS=$?
done
exit $STATUS
