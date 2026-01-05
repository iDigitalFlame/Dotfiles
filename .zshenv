#!/usr/bin/zsh
################################
### iDigitalFlame  2016-2026 ###
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
# Copyright (C) 2016 - 2026 iDigitalFlame
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

export GOPATH="${HOME}/.local/lib/go"
export GOROOT="/usr/lib/go"
export GOCACHE="${HOME}/.cache/go-build"

export CARGO_HOME="${HOME}/.local/lib/rust/cargo"
export RUSTUP_HOME="${HOME}/.local/lib/rust/rustup"

export GNUPGHOME="${HOME}/.local/share/gnupg"
export SSH_AUTH_SOCK="/run/user/${UID}/gcr/ssh"

export AURDEST="${HOME}/.cache/aur"
export PKGDEST="/var/cache/makepkg"
export SRCDEST="${XDG_RUNTIME_DIR}/aur/src"
export BUILDDIR="${XDG_RUNTIME_DIR}/aur/build"

export GTK_RC_FILES="${HOME}/.config/gtk-1.0/gtkrc"
export GTK2_RC_FILES="${HOME}/.config/gtk-2.0/gtkrc"

export PATH=$PATH:${GOPATH}/bin:${HOME}/.local/lib/rust/cargo/bin

export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_MUSIC_DIR="${HOME}/Documents/Music"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_STATE_HOME="${HOME}/.local/share"
export XDG_VIDEOS_DIR="${HOME}/Documents/Videos"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DESKTOP_DIR="$HOME"
export XDG_RUNTIME_DIR="/run/user/${UID}"
export XDG_DOWNLOAD_DIR="${HOME}/Downloads"
export XDG_PICTURES_DIR="${HOME}/Pictures"
export XDG_DOCUMENTS_DIR="${HOME}/Documents"
export XDG_TEMPLATES_DIR="${HOME}/Documents/Templates"
export XDG_PUBLICSHARE_DIR="${HOME}/Documents/Public"

export LESSKEY="${HOME}/.config/lesskey"
export SCREENRC="${HOME}/.config/screen/screenrc"
export GNUPGHOME="${HOME}/.local/share/gnupg"
export SCREENDIR="${XDG_RUNTIME_DIR}/screen"
export PYTHONSTARTUP="${HOME}/.local/lib/python_no_history.py"
export PYTHON_HISTORY="${HOME}/.cache/python_history"
export BAT_CONFIG_PATH="${HOME}/.config/bat/config"

export PAGER="/usr/bin/less -iR"
export EDITOR="/usr/bin/nano -SLlwxiE --tabsize=4"
export VISUAL="/usr/bin/nano -SLlwxiE --tabsize=4"
export BROWSER="${HOME}/.local/bin/browser"
export XCURSOR_SIZE=24
export GDK_DPI_SCALE=0.95
export XCURSOR_THEME="MoonlightSky"

export ZSH="${HOME}/.local/lib/oh-my-zsh"
export ZDOTDIR="${HOME}/.config/zsh"
export ZSH_COMPDUMP="${HOME}/.cache/zsh/zcompdump"

export ERRFILE="/dev/null"
export HISTFILE="${HOME}/.cache/zsh/history"
export HISTSIZE=2500
export SAVEHIST=2500
export LESSHISTFILE="/dev/null"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${HOME}/.config/java"

# ZSH Options (Early set here)
setopt HUP
setopt AUTO_MENU
setopt GLOB_DOTS
setopt AUTO_PUSHD
setopt BAD_PATTERN
setopt LOCAL_TRAPS
setopt SHORT_LOOPS
setopt PUSHD_SILENT
setopt ALWAYS_TO_END
setopt CLOBBER_EMPTY
setopt PUSHD_IGNORE_DUPS
setopt INTERACTIVE_COMMENTS

unsetopt VI
unsetopt BEEP
unsetopt C_BASES
unsetopt HASH_CMDS
unsetopt HASH_DIRS
unsetopt PATH_DIRS
unsetopt CHECK_JOBS
unsetopt OCTAL_ZEROES
unsetopt ALIAS_FUNC_DEF
unsetopt RM_STAR_SILENT
unsetopt CHECK_RUNNING_JOBS

# History Specific
setopt HIST_VERIFY
setopt HIST_NO_STORE
setopt APPEND_HISTORY
setopt HIST_FCNTL_LOCK
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_BY_COPY
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

unsetopt SHARE_HISTORY
unsetopt HIST_LEX_WORDS
unsetopt HIST_IGNORE_SPACE
unsetopt HIST_NO_FUNCTIONS
unsetopt INC_APPEND_HISTORY
unsetopt INC_APPEND_HISTORY_TIME
