#!/bin/bash -a
GAMEROOT=$(cd "${0%/*}" && echo $PWD)
UNAME=/bin/uname

export LD_LIBRARY_PATH="${GAMEROOT}"/bin/linuxsteamrt64:$LD_LIBRARY_PATH
export ENABLE_PATHMATCH=1
export SDL_VIDEO_DRIVER=x11

GAMEEXE=bin/linuxsteamrt64/cs2
MAIN="-nojoy -threads 8"
OTHER="-ignorecontentasserts -no_assert_dialog -noassert -noassertbrowser -noautoargs -noborder -nobreakpad -nocrashdialog -nohibernate -nohltv -noinitfallbacktextures -nolod -nominidumps -nopanoramajoy -nostyle -novsync -nowatchdog -sse2 -sse3 -sse4"
LAUNCHOPTS="$MAIN $OTHER"

cd "$GAMEROOT"

. ~/.cs2/pre.sh
STATUS=42
while [ $STATUS -eq 42 ]; do
	ionice -c 2 -n 0 chrt -f 99 nice -n -20	"${GAMEROOT}"/${GAMEEXE} $LAUNCHOPTS -- $@
	STATUS=$?
done
. ~/.cs2/post.sh; exit $STATUS
