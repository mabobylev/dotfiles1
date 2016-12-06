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
