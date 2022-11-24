#!/usr/bin/env sh
sketchybar      --add item weather right       \
                --set weather                  \
                  update_freq=1800             \
                  icon.color=0xffebcb8b        \
                  script="$PLUGINS/weather.sh" 
