gnome-screensaver &

remote_id=$(
    xinput list |
    sed -n 's/.*FootSwitch1-F1\.8.*id=\([0-9]*\).*keyboard.*/\1/p'
)
[ "$remote_id" ] || exit

mkdir -p /tmp/xkb/symbols
cat >/tmp/xkb/symbols/custom <<\EOF
xkb_symbols "remote" {
    key <AB05>  { [ UA9C5 ]       };
};
EOF

setxkbmap -device $remote_id -print | sed 's/\(xkb_symbols.*\)"/\1+custom(remote)"/' | xkbcomp -I/tmp/xkb -i $remote_id -synch - $DISPLAY 2>/dev/null
