# start X at login
#if status --is-login
#    if test -z "$DISPLAY" -a "$XDG_VTNR" -eq "1"
#        exec startx
#    end
#end
#
if status --is-login
  set -x PATH $PATH /usr/bin /sbin .bin
  set -U EDITOR vim
end


if status --is-login
    set PATH $PATH /usr/bin /sbin ~/.bin
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end

#if status --is-login
#    set PATH $PATH /usr/bin /sbin
#end

function su
        /bin/su --shell=/usr/bin/fish $argv
end

function e
    eval $EDITOR $argv
end

function ev
    eval $EDITOR ~/.vimrc
end

function ewm
    eval $EDITOR ~/.config/i3/config
end

function yupg
    yaourt -Syyu --noconfirm
end

function yupg
    yay -Syyu --noconfirm
end

function weather
    curl wttr.in/ulyanovsk
end

function myip
    curl ifconfig.co
end

function chtsh
  curl -s "https://cht.sh/$argv[1]"
end

# vim: ft=sh:
