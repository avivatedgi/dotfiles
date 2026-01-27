#!/bin/sh

# Front app switched event
# Updates the app icon and name

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set front_app icon.background.image="app.$INFO"
  sketchybar --set front_app.name label="$INFO"
fi
