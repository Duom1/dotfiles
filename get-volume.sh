#!/bin/bash

# Function to check if the sink is muted
is_muted() {
  pactl list sinks | grep -A 15 'Sink #' | grep -q 'Mute: yes'
}

# Function to get the volume percent
get_volume_percent() {
  pactl list sinks | grep -A 15 'Sink #' | grep 'Volume:' | \
  sed -n 's/.* \([0-9][0-9]*\)% .*/\1/p'
}

# Main script
if is_muted; then
  echo "󰝟 Muted"
else
  volume=$(get_volume_percent)
  echo "Volume: $volume%"
fi

