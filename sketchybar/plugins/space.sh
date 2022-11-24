#!/usr/bin/env bash

args=()
if [ "$NAME" != "space_template" ]; then
  args+=(--set $NAME label.highlight=$SELECTED \
                     icon.highlight=$SELECTED \
                 label.drawing=$SELECTED)
fi

if [ "$SELECTED" = "true" ]; then
  args+=(--set $NAME icon.background.y_offset=-15)
else
  args+=(--set $NAME icon.background.y_offset=-20)
fi

sketchybar -m --animate tanh 20 "${args[@]}"

