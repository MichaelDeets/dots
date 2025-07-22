#!/bin/bash -a
GAMEROOT=$(cd "${0%/*}" && echo $PWD)
UNAME=/bin/uname

export LD_LIBRARY_PATH="${GAMEROOT}"/bin/linuxsteamrt64:$LD_LIBRARY_PATH
export ENABLE_PATHMATCH=1
export SDL_VIDEO_DRIVER=x11
export LD_PRELOAD="/usr/lib64/libSDL3.so.0:/usr/lib64/libSDL2-2.0.so.0:/usr/lib64/libEGL.so:/usr/lib64/libGLESv2.so:/usr/lib64/libvulkan.so:/usr/lib64/libxkbcommon.so.0:/usr/lib64/librenderdoc.so:/usr/lib64/libpangoft2-1.0.so"

GAMEEXE=bin/linuxsteamrt64/cs2
MAIN="-nojoy -noasert -noautoargs -nocrashdialog -nominidumps -novsync"
LAUNCHOPTS="$MAIN"

cd "$GAMEROOT"

. ~/.cs2/pre.sh
STATUS=42
while [ $STATUS -eq 42 ]; do
	"${GAMEROOT}"/${GAMEEXE} $LAUNCHOPTS -- $@
	STATUS=$?
done
. ~/.cs2/post.sh; exit $STATUS
