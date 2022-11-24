#!/usr/bin/env sh

sketchybar      --add item sound right         \
                --set sound                    \
                  update_freq=5                \
                  icon.color=0xff5e81ac        \
                  script="$PLUGINS/sound.sh"   
