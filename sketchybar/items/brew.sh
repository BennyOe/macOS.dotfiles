#!/usr/bin/env sh

# Trigger the brew_udpate event when brew update or upgrade is run from cmdline
# e.g. via function in .zshrc

sketchybar --add event brew_update                   \
           --add item brew right                     \
           --set brew script="$PLUGINS/brew.sh"      \
                      icon=􀐛                         \
                      label.padding_left=0           \
                      label.padding_right=0          \
                      icon.padding_left=20           \
                      icon.padding_right=8           \
                      icon.y_offset=-2               \
                      label=?                        \
          --subscribe brew brew_update

