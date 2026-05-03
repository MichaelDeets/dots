#!/bin/sh
DISCORD_ID=$(pactl list source-outputs | awk '/Source Output #/ {id=$3} /application.process.binary = "DiscordCanary"/ {print id}' | sed 's/#//')

if [ -n $DISCORD_ID ]; then
	pactl set-source-output-mute $DISCORD_ID 1
fi
