#!/usr/bin/env sh

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

sketchybar --add       item            github.bell right                  \
           --set       github.bell     update_freq=180                    \
                                       icon=$BELL                         \
                                       label.padding_left=0               \
                                       label.padding_right=0              \
                                       icon.padding_left=20               \
                                       icon.padding_right=8               \
                                       icon.y_offset=-2                   \
                                       icon.color=$BLUE                   \
                                       label=$LOADING                     \
                                       popup.align=right                  \
                                       script="$PLUGINS/github.sh"        \
                                       click_script="$POPUP_CLICK_SCRIPT" \
           --subscribe github.bell     mouse.entered                      \
                                       mouse.exited                       \
                                       mouse.exited.global                \
                                                                          \
           --add       item            github.template popup.github.bell  \
           --set       github.template drawing=off                        \
                                       background.corner_radius=12        \
                                       background.padding_left=7          \
                                       background.padding_right=7         \
                                       background.color=$BLACK            \
                                       background.drawing=off             
