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

# Rust
export CARGO_HOME="${HOME}/.local/lib/rust/cargo"
export RUSTUP_HOME="${HOME}/.local/lib/rust/rustup"

# Golang
export GOPATH="${HOME}/.local/lib/go"
export GOROOT="/usr/lib/go"
export GOCACHE="${HOME}/.cache/go-build"

# Python
export PYTHONSTARTUP="${HOME}/.local/lib/python_no_history.py"

# X / Wayland
export XCURSOR_SIZE=24
export XCURSOR_THEME="MoonlightSky"

# Misc
export AURDEST="${HOME}/.cache/aur"
export GNUPGHOME="${HOME}/.local/share/gnupg"
export BAT_CONFIG_PATH="${HOME}/.config/bat/config"

# Basic Stuff
export PAGER="/usr/bin/less -iR"
export EDITOR="/usr/bin/nano -SLlwxiE --tabsize=4"
export VISUAL="/usr/bin/nano -SLlwxiE --tabsize=4"
export BROWSER="${HOME}/.local/bin/browser"

# History
export HISTFILE="${HOME}/.cache/zsh/history"
export HISTSIZE=2500
export SAVEHIST=2500

# Path Update
export PATH=$PATH:${GOPATH}/bin:${HOME}/.local/lib/rust/cargo/bin

# ZSH
export ZSH="${HOME}/.local/lib/oh-my-zsh"
export ZDOTDIR="${HOME}/.config/zsh"
export ZSH_COMPDUMP="${HOME}/.cache/zsh/zcompdump"

# ZSH (Early set here)
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
