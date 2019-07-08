#!/bin/bash

[[ -f $(which xclip) ]] && video="$(xclip -o)"

[[ -z "$video" ]] || url=$(echo "$video" | sed -n '/https/p')

[[ -n $url ]] && mpv --fs $video || zenity --warning --text "Скопируйте ссылку на видео" --width=300

exit 0
