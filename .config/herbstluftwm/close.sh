#!/bin/sh
PID="herbstclient attr clients.focus.pid"
for i in $(ls /proc/$($PID)/task); do
	kill -9 $i
done
herbstclient close_and_remove
