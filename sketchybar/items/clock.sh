#!/usr/bin/env sh

sketchybar      --add item clock right         \
                --set clock                    \
                  update_freq=10               \
                  script="$PLUGINS/clock.sh"   \
                  icon=                       \
                  icon.y_offset=-2             \
                  icon.color=0xff8fbcbb        \
                  label.padding_right=10       
