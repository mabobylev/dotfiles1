alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g L="| less"
alias -g M="| most"
alias -g B="&|"
alias -g HL="--help"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g KU="| iconv -c -f koi8r -t utf8"
alias -g CU="| iconv -c -f cp1251 -t utf8"
alias nrg2iso="dd bs=1k if=$1 of=$2 skip=300"
# дерево директорий
alias dirf='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
alias psgrep='ps aux | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'
# удаляем пустые строки и комментарии
alias delspacecomm="sed '/ *#/d; /^ *$/d' $1"
alias lor='fortune lorquotes'
alias df='df -h'
alias du='du -h'
alias lls="ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'"
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'

autoload -U pick-web-browser
alias -s {html,htm}=firefox
#----------------------------------------------------------------------------------
#Мои функции
ccd(){ cd && ls }
# создать директорию и перейти в нее
mcd(){ mkdir -p $1; cd $1 }
# если текущая директория пустая, то удалить ее и перейти в родительскую директорию
rcd(){ local P="`pwd`"; cd .. && rmdir "$P" || cd "$P"; }
fix_mp3() { find -iname '*.mp3' -print0 | xargs -0 mid3iconv -eCP1251 --remove-v1 }
mpg2flv() { ffmpeg -i $1 -ar 22050 -ab 32 -f flv -s 320x240 `echo $1 | awk -F. '{print $1}'`.flv }


#alias ...=../..
#alias ....=../../..
#alias .....=../../../..
#alias ......=../../../../..
#alias 1='cd -'
#alias 2='cd -2'
#alias 3='cd -3'
#alias 4='cd -4'
#alias 5='cd -5'
#alias 6='cd -6'
#alias 7='cd -7'
#alias 8='cd -8'
#alias 9='cd -9'
#alias CA='2>&1 | cat -A'
#alias G='| grep'
#alias H='| head'
#alias L='| less'
#alias LL='2>&1 | less'
#alias M='| most'
#alias NE='2> /dev/null'
#alias NUL='> /dev/null 2>&1'
#alias P='2>&1| pygmentize -l pytb'
#alias T='| tail'
#alias _=sudo
#alias afind='ack -il'
alias cp='cp -i'
alias cpv='rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --'
#alias d='dirs -v | head -10'
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias h=history
alias help=man
alias hgrep='fc -El 0 | grep'
alias history='fc -l 1'
#alias l='ls -lFh'
alias lS='ls -1FSsh'
#alias la='ls -lAFh'
alias lart='ls -1Fcart'
alias ldot='ls -ld .*'
#alias ll='ls -l'
alias lr='ls -tRFh'
alias lrt='ls -1Fcrt'
alias ls='ls --color=tty'
alias lsa='ls -lah'
alias lt='ls -ltFh'
alias man='nocorrect man'
alias md='mkdir -p'
alias mkdir='nocorrect mkdir'
#alias mv='mv -i'
alias mysql='nocorrect mysql'
alias p='ps -f'
alias pacin='sudo pacman -S'
alias pacins='sudo pacman -U'
alias pacinsd='sudo pacman -S --asdeps'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias paclsorphans='sudo pacman -Qdt'
alias pacmir='sudo pacman -Syy'
alias pacre='sudo pacman -R'
alias pacrem='sudo pacman -Rns'
alias pacrep='pacman -Si'
alias pacreps='pacman -Ss'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias pacupd='sudo pacman -Sy && sudo abs'
alias pacupg='sudo pacman -Syu'
alias please=sudo
alias po=popd
alias pu=pushd
alias rd=rmdir
alias rm='rm -i'
alias run-help=man
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias sortnr='sort -n -r'
alias sudo='nocorrect sudo'
alias t='tail -f'
alias unexport=unset
alias which-command=whence
alias x=extract
alias yaconf='yaourt -C'
alias yain='yaourt -S'
alias yains='yaourt -U'
alias yainsd='yaourt -S --asdeps'
alias yaloc='yaourt -Qi'
alias yalocs='yaourt -Qs'
alias yalst='yaourt -Qe'
alias yamir='yaourt -Syy'
alias yaorph='yaourt -Qtd'
alias yare='yaourt -R'
alias yarem='yaourt -Rns'
alias yarep='yaourt -Si'
alias yareps='yaourt -Ss'
alias yasu='yaourt --sucre'
alias yaupd='yaourt -Sy && sudo abs'
alias yaupg='yaourt -Syua --noconfirm'
alias zshrc='$EDITOR ~/.zshrc'
