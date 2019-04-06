# -----------------------------
# Prompt + Title
# -----------------------------

# colors
export TERM='xterm-256color'
autoload -U colors && colors

for color in red green yellow blue magenta cyan black white; do
    eval $color='%{$fg_no_bold[${color}]%}'
    eval ${color}_bold='%{$fg_bold[${color}]%}'
done

reset="%{$reset_color%}"

# Add ssh-agent on login
#if [ -z "$SSH_AUTH_SOCK" ] ; then
#  eval `ssh-agent -s` &> /dev/null
#  ssh-add &> /dev/null
#fi

# check if we are on SSH or not
#if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
#  host="${black}[${blue}%m${black}] " #SSH
#else
#  unset host # no SSH
#fi

# zsh
setopt auto_cd
setopt extended_glob
setopt interactive_comments
# disable speaker
unsetopt beep

# history
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# git
setopt prompt_subst
autoload -U add-zsh-hook
autoload -Uz vcs_info
unsetopt nomatch

add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*'   enable git
zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' actionformats "${black}[${red}%b%u%c %a${black}]"
zstyle ':vcs_info:*:*' formats       "${black}[${green}%b%u%c${black}]"

# root / user
if [ "$EUID" -eq 0 ]; then
  bracket_o="${red}["
  bracket_c="${red}]"
else
  bracket_o="${black}["
  bracket_c="${black}]"
fi

PROMPT="${host}${bracket_o}${magenta}%2~${bracket_c}${reset} "
RPROMPT='$vcs_info_msg_0_'"$reset"

# title
case $TERM in
  xterm*|rxvt*|screen*)
    precmd() { print -Pn "\e]0;%m:%~\a" }
    preexec () { print -Pn "\e]0;$1\a" }
  ;;
esac

# -----------------------------
# Misc
# -----------------------------

# better word separators (ctrl-w will become much more useful)
WORDCHARS=''
# editor
export EDITOR="vim"
export BROWSER="firefox"

# grep colors
#export GREP_COLORS="mt=33"
#export GREP_OPTIONS='--color=auto'


# -----------------------------
# History
# -----------------------------

HISTFILE=$HOME/.zsh_history
HISTSIZE=30000
SAVEHIST=30000

# -----------------------------
# Completion
# -----------------------------

# Enable zsh auto-completion
autoload -U compinit && compinit

_comp_options+=(globdots) # completion fot dotfiles

zstyle ':completion:*' menu select

# -----------------------------
# Bindings
# -----------------------------

# emacs style
bindkey -e

bindkey "\e[3~" delete-char #delete

bindkey "^[[H"  beginning-of-line #home
bindkey "^[[F"  end-of-line       #end

bindkey "^[[A"  history-beginning-search-backward #up
bindkey "^[[B"  history-beginning-search-forward  #down

bindkey '^[[1;5D'   backward-word #ctrl+left
bindkey '^[[1;5C'   forward-word  #ctrl+right

# -----------------------------
# Aliases
# -----------------------------

# tmux
#alias tmux='tmux attach || tmux new'

# ssht
#ssht () { ssh -t "$1" 'tmux attach || tmux new' }

# history
h() {
  if [[ -z "$1" ]]; then
    history
  else
    history 0 | grep "$*"
  fi
}

# permissions
perms () {
  fd . -type d -exec chmod 770 {} \;
  fd . -type f -exec chmod 660 {} \;
}

# search
ss() { fd . | xargs grep "$1" -sl }

# sys
alias ping='ping -c 1'

alias l='ls -lAh --color=auto --group-directories-first'
alias ls='ls --color=auto --group-directories-first'
alias g='grep'
alias se='sudoedit'

alias df='df -h'
alias du='du -h --max-depth=1 | sort -h'
alias off='sleep 1; xset dpms force off'
alias exzip='fd -e zip -x unzip'

# timer
#tm() { (sleep "$1" && cd /storage/music/fav && mpg123 -q "$(ls | shuf -n1)" ) & }
# t() { (sleep "$1" && mpg123 -q /storage/Dropbox/sound/old_cassette.mp3 ) & }

# yaourt / pacman
alias  y='yay -S --noconfirm'
alias yu='yay -Syu --aur --noconfirm'
alias ya='yay -Syu --aur'
alias yi='yay -Si'
alias ys='yay -Ss'
alias yr='yay -Rns'
alias yd='yay -Rdd'
alias yc='yay -Scc'
alias pacman='sudo pacman'

#alias deploy='ssh_agent && cap production deploy'

# ssh
ssh_agent() {
  if [[ -z "$SSH_AUTH_SOCK" ]]; then
    pkill ssh-agent
    eval $(ssh-agent)
    ssh-add
  fi
}

# git
alias gc='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status --short --branch'
alias gpr='git pull --rebase'
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gamend='git add -A && git commit --amend --no-edit && git push -f'

gf() {
  git add -A
  git commit -m "$*"
  git push
}

# what the commit
#alias random_commit='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
#alias grf='git add -A; random_commit; git push'
#alias mine_eth="roxterm -e 'ethminer --farm-recheck 200 -U -F http://127.0.0.1:8080/rig1' ; cd ~/mining/eth-proxy && roxterm -e 'python2 ./eth-proxy.py'"

# PATHS
[[ -s /etc/profile.d/autojump.sh ]] && . /etc/profile.d/autojump.sh

#source ~/.profile
source ~/.zprofile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--extended --height 40% --layout=reverse --border --ansi"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
