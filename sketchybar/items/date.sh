#!/usr/bin/env sh

sketchybar      --add item date right          \
                --set date                     \
                  update_freq=100              \
                  script="$PLUGINS/date.sh"    \
                  icon=                       \
                  icon.y_offset=-2             \
                  icon.color=0xffb48ead        
