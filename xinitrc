#!/bin/sh

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="/etc/X11/xinit/.Xresources"
sysmodmap="/etc/X11/xinit/.Xmodmap"

# merge in defaults and keymaps

[ -f $sysresources ] && xrdb -load $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f $userresources ] && xrdb -merge $userresources
[ -f $usermodmap ] && xmodmap $usermodmap

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Dbus fix
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

eval "$(dircolors -b "$HOME/.dircolors.ansi-universal")"

xset +fp "$HOME/.fonts"
#xset fp+ "$HOME/.fonts/artwiz"
xset fp rehash

setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:scroll,terminate:ctrl_alt_bksp,compose:ralt"

xset -b
xset s off
xset s noblank
xset -dpms
#xsetroot -cursor_name left_ptr &

feh --bg-scale "$(find /home/xaoc/wallpapers/|shuf -n1)" &
#eval "$(source ~/.fehbg)"
#compton --focus-exclude "x = 0 && y = 0 && override_redirect = true" -CGb &
#rxvtcd &

# Start i3-wm
#if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
#	exec ck-launch-session dbus-launch --exit-with-session /usr/bin/i3
#else
exec i3
#fi

# Start dwm
#~/.local/bin/dwmbar &
#if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
#	exec ck-launch-session dbus-launch --exit-with-session /usr/bin/dwm
#else
#exec dwm
#fi
