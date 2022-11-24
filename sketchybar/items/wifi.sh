#!/usr/bin/env sh
sketchybar      --add item wifi right          \
                --set wifi                     \
                  script="$PLUGINS/wifi.sh"    \
                  update_freq=5                
