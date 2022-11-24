#!/usr/bin/env sh

SPACE_ICONS=("􀤙" "􀓕" "􀼺" "􀽎" "1" "2" "3" "4")
SPACE_LABELS=("code" "web" "misc" "com" "1" "2" "3" "4")
SPACE_CLICK_SCRIPT="yabai -m space --focus \$SID 2>/dev/null"

sid=0
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid left                               \
             --set space.$sid associated_space=$sid                         \
                              icon=${SPACE_ICONS[i]}                        \
                              icon.padding_left=10                          \
                              icon.padding_right=10                         \
                              icon.font="sketchybar-app-font:Bold:19.0" \
                              label.font="sketchybar-app-font:Bold:17.0" \
                              icon.highlight_color=$BLUE                    \
                              label.highlight_color=$BLUE                    \
                              icon.background.height=4 \
                              icon.background.color=$BLUE \
                              icon.background.y_offset=-25 \
                              background.padding_left=9 \
                              background.padding_right=9 \
                              script="$PLUGINS/space.sh"                    \
                              click_script="$SPACE_CLICK_SCRIPT"
done

