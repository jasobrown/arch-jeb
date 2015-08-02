#!/bin/sh

# executed by startx (via slim in this case)

xsetroot -cursor_name left_ptr
[[ -x ~/.xrandr ]] && ~/.xrandr
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

#screensaver -no-splash &
#xscreencaf &
#dropboxd &
#exec xmonad
