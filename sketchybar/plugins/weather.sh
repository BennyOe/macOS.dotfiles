#!/usr/bin/env bash

status=$(curl -o /dev/null -s -w "%{http_code}\n" wttr.in)

if [[ "$status" == *"5"* ]]; then
    exit
fi

data=$(curl -s 'wttr.in/Hamburg?format=%C+|+%t')

if [[ "$data" == *"nknown"* ]]; then
  exit
fi

condition=$(echo $data | awk -F '|' '{print $1}' | tr '[:upper:]' '[:lower:]')
condition="${condition// /}"
temp=$(echo $data | awk -F '|' '{print $2}')
temp="${temp//\+/}"
temp="${temp// /}"

# add more conditions here as appropriate
case "${condition}" in
  "clear")
    icon=""
    ;;
  "sunny")
    icon=""
    ;;
  "partlycloudy")
    icon=""
    ;;
  *"lightrain"*)
    icon=""
    ;;
  *"Patchy rain"*)
    icon=""
    ;;
  *"snow"*)
    icon=""
    ;;
  "overcast")
    icon=""
    ;;
  "mist")
    icon="敖"
    ;;
  *)
    icon=""
    ;;
esac

sketchybar -m --set weather icon="$icon" \
  --set weather label="$temp"
