#!/usr/bin/env sh

SPACE_ICONS=(":terminal:" ":google_chrome:" ":camera:" ":slack:" ":terminal:" ":google_chrome:" ":whats_app:" ":slack:")
SPACE_LABELS=("code" "web" "misc" "com" "1" "2" "3" "4")
SPACE_CLICK_SCRIPT="yabai -m space --focus \$SID 2>/dev/null"

sid=0
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid left                               \
             --set space.$sid associated_space=$sid                         \
                              icon=${SPACE_ICONS[i]}                        \
                              icon.padding_left=12                           \
                              icon.padding_right=16                          \
                              icon.font="sketchybar-app-font:Regular:18.0"  \
                              label.font="sketchybar-app-font:Bold:17.0"    \
                              icon.highlight_color=$BLUE                    \
                              label.highlight_color=$BLUE                   \
                              icon.background.height=4                      \
                              icon.background.color=$BLUE                   \
                              background.padding_left=2                     \
                              background.padding_right=2                    \
                              script="$PLUGINS/space.sh"                    \
                              click_script="$SPACE_CLICK_SCRIPT"
done
sketchybar   --add item       separator left                          \
             --set separator  icon=                                  \
                              icon.font="Hack Nerd Font:Regular:16.0" \
                              background.padding_left=36              \
                              background.padding_right=25             \
                              label.drawing=off                       \
                              associated_display=active               \
                              icon.color=$WHITE
