#!/usr/bin/env bash
i3status -c ~/.config/i3status/config | while :
do
  read line
  echo "$line" || exit 1
done
