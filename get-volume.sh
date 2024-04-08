#!/bin/bash

MUTE=$(pamixer --get-mute)

if [ $MUTE = "true" ]; then
  echo "󰝟 mute"
else
  printf "󰕾 $(pamixer --get-volume)%%"
fi
