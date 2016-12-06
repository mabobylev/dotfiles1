#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL=vim
export EDITOR=vim
#PATH="$PATH:~/.local/bin"
#export PATH

shopt -s autocd
shopt -s checkwinsize

alias ls='ls --color=auto'
alias ll='ls -la'

# PROMPT
PS1='\W \$ '

export HISTCONTROL=ignoredups

# Some functions
man() {
    env \
        LESS_TERMCAP_mb=$'\e[01;31m' \
        LESS_TERMCAP_md=$'\e[01;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[01;44;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[01;32m' \
        man "$@"
}

exec /usr/bin/fish
