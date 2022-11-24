#!/bin/bash

# W I N D O W  T I T L E 
# WINDOW_TITLE=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.title')

if [[ $WINDOW_TITLE = "" ]]; then
  WINDOW_TITLE=$(/usr/local/bin/yabai -m query --windows --window | jq -r '.app')
fi

if [[ ${#WINDOW_TITLE} -gt 50 ]]; then
  WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-50)
  sketchybar -m --set title label=" $WINDOW_TITLE ." \
  label.font="sketchybar-app-font:Bold:14.0"    
  exit 0
fi

sketchybar -m --set title label=" $WINDOW_TITLE ." \
label.font="sketchybar-app-font:Bold:14.0"    
