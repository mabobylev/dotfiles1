# start X at login
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
    eval $EDITOR ~/public/dotfiles/vimrc
end

function ei3
    eval $EDITOR ~/public/dotfiles/i3/config
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

# vim: ft=sh:
