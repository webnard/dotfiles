#!/usr/bin/env bash
i3status -c ~/.config/i3status/config | while :
do
  read line
  pomodoro=`python ~/i3-gnome-pomodoro/pomodoro-client.py status`
  echo "$pomodoro| $line" || exit 1
done
