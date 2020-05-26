#!/bin/bash

set -e
set -o pipefail

stepsize=5

# https://unix.stackexchange.com/questions/132230/read-out-pulseaudio-volume-from-commandline-i-want-pactl-get-sink-volume
vol=$(pactl list sinks |
      grep '^[[:space:]]Volume:' |
      head -n 1 |
      sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

if [[ $1 = d ]]; then
  tgt=$((vol - stepsize))
else
  if [[ $1 = u ]]; then
    tgt=$((vol + stepsize))
  else
    echo "Pass d or u for volume down or volume up."
    exit 1
  fi
fi

if [[ $tgt -lt 0 ]]; then
  tgt=0
fi
if [[ $tgt -gt 100 ]]; then
  tgt=100
fi

pactl set-sink-volume "@DEFAULT_SINK@" "${tgt}%"
