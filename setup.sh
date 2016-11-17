#!/bin/bash

set -e

d1=$(pwd)

ln -sfn "${d1}/xinitrc" "${HOME}/.xinitrc"
ln -sfn "${d1}/profile" "${HOME}/.profile"
ln -sfn "${d1}/bash_profile" "${HOME}/.bash_profile"
ln -sfn "${d1}/zprofile" "${HOME}/.zprofile"
ln -sfn "${d1}/xresources" "${HOME}/.Xresources"
ln -sfn "${d1}/gruvbox-dark" "${HOME}/.gruvbox-dark"
ln -sfn "${d1}/urxvtrc" "${HOME}/.urxvtrc"
ln -sfn "${d1}/vimrc" "${HOME}/.vimrc"
ln -sfn "${d1}/vimrc.local" "${HOME}/.vimrc.local"
ln -sfn "${d1}/termite" "${HOME}/.config/termite"
ln -sfn "${d1}/i3" "${HOME}/.config/i3"
