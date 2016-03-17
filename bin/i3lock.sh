#!/bin/bash
# i3 lock script: pixelates screen and adds lock icon

icon="$HOME/Pictures/icons/lock-icon.png"
tmpbg="/tmp/lockscreen.png"
text="/tmp/locktext.png"

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% -fill black -colorize 25% "$tmpbg"

if [ -f "$icon" ]; then
    convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
fi

[ -f $text ] || {
    convert -size 3000x60 xc:white -font Droid-Sans -pointsize 26 -fill black -gravity center -annotate +0+0 'Type password to unlock' $text;
    convert $text -alpha set -channel A -evaluate set 50% $text;
}
convert $tmpbg $text -gravity center -geometry +0+200 -composite $tmpbg
i3lock "$@" -e -i "$tmpbg"

# blur command (slower)
#i3lock -d "$@" -i <(import -window root - | convert -blur -2x5 - png:-)
