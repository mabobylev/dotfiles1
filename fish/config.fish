# start X at login
#if status --is-login
#    if test -z "$DISPLAY" -a "$XDG_VTNR" -eq "1"
#        exec startx
#    end
#end
#
#if status --is-login
#    set PATH $PATH /usr/bin /sbin
#end

function e
    eval $EDITOR $argv
end

function ev
    eval $EDITOR ~/dotfiles/vimrc
end

function ewm
    eval $EDITOR ~/dotfiles/i3/config
end

function yaupg
    yaourt -Syyua --noconfirm
end

function weather
    curl wttr.in/ulyanovsk
end

function myip
    curl ifconfig.co
end

# vim: ft=sh:
