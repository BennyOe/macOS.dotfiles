#!/usr/bin/env sh

sketchybar          --add item battery right       \
                    --set battery                  \
                    update_freq=3                \
                    script="$PLUGINS/power.sh"   \
                    icon=                       \
                    icon.color=0xffbf616a        
