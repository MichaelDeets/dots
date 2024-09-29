#!/bin/sh
PID="$(herbstclient attr clients.focus.pid)"

kill -9 $PID

herbstclient close_and_remove
