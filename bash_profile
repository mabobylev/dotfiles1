#
# ~/.bash_profile
#
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- vt1 &> /dev/null
[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.local/bin
export EDITOR="vim"
export TERMINAL="termite"
export BROWSER="firefox"

# Uncomment lines below to autostart i3 when logged in:
#if [[ "$(tty)" = "/dev/tty1" ]]; then
	#pgrep i3 || exec startx
#fi
