#!/usr/bin/zsh
################################
### iDigitalFlame  2016-2024 ###
#                              #
#            -/`               #
#            -yy-   :/`        #
#         ./-shho`:so`         #
#    .:- /syhhhh//hhs` `-`     #
#   :ys-:shhhhhhshhhh.:o- `    #
#   /yhsoshhhhhhhhhhhyho`:/.   #
#   `:yhyshhhhhhhhhhhhhh+hd:   #
#     :yssyhhhhhyhhhhhhhhdd:   #
#    .:.oyshhhyyyhhhhhhddd:    #
#    :o+hhhhhyssyhhdddmmd-     #
#     .+yhhhhyssshdmmddo.      #
#       `///yyysshd++`         #
#                              #
########## SPACEPORT ###########
## ZSH Environment Configuration
#
# Copyright (C) 2016 - 2024 iDigitalFlame
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

export GOROOT="/usr/lib/go"
export GOPATH="${HOME}/.local/lib/go"
export GOCACHE="${HOME}/.cache/go-build"

export CARGO_HOME="${HOME}/.config/rust/cargo"
export RUSTUP_HOME="${HOME}/.config/rust/rustup"

export GNUPGHOME="${HOME}/.local/share/gnupg"
export SSH_AUTH_SOCK="/run/user/${UID}/gcr/ssh"

export AURDEST="${HOME}/.cache/aur"
export PKGDEST="/var/cache/makepkg"
export SRCDEST="/tmp/.usercache/${USER}/aur/src"
export BUILDDIR="/tmp/.usercache/${USER}/aur/build"

export GTK_RC_FILES="${HOME}/.config/gtk-1.0/gtkrc"
export GTK2_RC_FILES="${HOME}/.config/gtk-2.0/gtkrc"

export PATH=$PATH:${GOPATH}/bin

export XDG_DESKTOP_DIR="$HOME"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_RUNTIME_DIR="/run/user/${UID}"
export XDG_PICTURES_DIR="${HOME}/Pictures"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_DOWNLOAD_DIR="${HOME}/Downloads"
export XDG_DOCUMENTS_DIR="${HOME}/Documents"
export XDG_STATE_HOME="${HOME}/.local/share"
export XDG_MUSIC_DIR="${HOME}/Documents/Music"
export XDG_VIDEOS_DIR="${HOME}/Documents/Videos"
export XDG_PUBLICSHARE_DIR="${HOME}/Documents/Public"
export XDG_TEMPLATES_DIR="${HOME}/Documents/Templates"

export LESSKEY="${HOME}/.config/lesskey"
export SCREENRC="${HOME}/.screen/screenrc"
export GNUPGHOME="${HOME}/.local/share/gnupg"
export BAT_CONFIG_PATH="${HOME}/.config/bat/config"
export PYTHON_HISTORY="${HOME}/.cache/python_history"
export PYTHONSTARTUP="${HOME}/.local/lib/python_no_history.py"

export XCURSOR_SIZE=24
export PAGER="/usr/bin/less -iR"
export BROWSER="${HOME}/.local/bin/browser"
export VISUAL="/usr/bin/nano -SLlwxiE --tabsize=4"
export EDITOR="/usr/bin/nano -SLlwxiE --tabsize=4"

export ZDOTDIR="${HOME}/.config/zsh"
export ZSH="${HOME}/.local/lib/oh-my-zsh"
export ZSH_COMPDUMP="${HOME}/.cache/zsh/zcompdump"

export HISTSIZE=1500
export SAVEHIST=1500
export ERRFILE="/dev/null"
export LESSHISTFILE="/dev/null"
export HISTFILE="${HOME}/.cache/zsh/history"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${HOME}/.config/java"

# ZSH Options (Early set here)
setopt HUP
setopt AUTO_MENU
setopt AUTO_PUSHD
setopt BAD_PATTERN
setopt PUSHD_SILENT
setopt ALWAYS_TO_END
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_BY_COPY
setopt PUSHD_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
