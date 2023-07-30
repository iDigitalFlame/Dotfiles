#!/usr/bin/zsh
################################
### iDigitalFlame  2016-2023 ###
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
################################
## ZSH Configuration
#
# Copyright (C) 2016 - 2023 iDigitalFlame
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

export ZSH_THEME="muse"
export UPDATE_ZSH_DAYS=14
export GOROOT="/usr/lib/go"
export ENABLE_CORRECTION="true"
export PAGER="/usr/bin/less -iR"
export DISABLE_AUTO_UPDATE="false"
export AURDEST="${HOME}/.cache/aur"
export PKGDEST="/var/cache/makepkg"
export GOPATH="${HOME}/.local/lib/go"
export COMPLETION_WAITING_DOTS="true"
export ZSH="${HOME}/.local/lib/oh-my-zsh"
export BROWSER="${HOME}/.local/bin/browser"
export GNUPGHOME="${HOME}/.local/share/gnupg"
export SRCDEST="/tmp/.usercache/${USER}/aur/src"
export VISUAL="/usr/bin/nano -SLlwxiE --tabsize=4"
export EDITOR="/usr/bin/nano -SLlwxiE --tabsize=4"
export BUILDDIR="/tmp/.usercache/${USER}/aur/build"
export SSH_AUTH_SOCK="/run/user/${UID}/keyring/ssh"

export PATH=$PATH:${GOPATH}/bin

export XDG_DESKTOP_DIR="${HOME}"
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

export ERRFILE="/dev/null"
export LESSHISTFILE="/dev/null"
export ZDOTDIR="${HOME}/.config/zsh"
export LESSKEY="${HOME}/.config/lesskey"
export SCREENRC="${HOME}/screen/screenrc"
export HISTFILE="${HOME}/.config/zsh/history"
export BAT_CONFIG_PATH="${HOME}/.config/bat/config"
export PYTHONSTARTUP="${HOME}/.local/lib/python_no_history.py"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${HOME}/.config/java"

export GTK_RC_FILES="${HOME}/.config/gtk-1.0/gtkrc"
export GTK2_RC_FILES="${HOME}/.config/gtk-2.0/gtkrc"

plugins=(git screen sudo)
source "$ZSH/oh-my-zsh.sh"

# ZSH History Auto Completion
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\e[A" up-line-or-beginning-search
bindkey "\e[B" down-line-or-beginning-search

typeset -A ZSH_HIGHLIGHT_STYLES
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

compinit -d "${HOME}/.cache/zcompdump-${ZSH_VERSION}"

ZSH_HIGHLIGHT_MAXLENGTH=256
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[alias]='fg=112,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=113,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=172,bold'
ZSH_HIGHLIGHT_STYLES[root]='bg=9,underline'
ZSH_HIGHLIGHT_STYLES[function]='fg=202,bold'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=202,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=93,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=118,bold,underline'
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=63,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=220,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=220,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=196,bold,underline'
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=63,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=63,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=74,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=74,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=74,bold'
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=("/media")
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=("/tmp/.mounts")
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=("${HOME}/Volumes")

PROMPT="%n $PROMPT"

motivate | cowsay -W 75 -f small
if [ ! -d "$AURDEST" ]; then
    mkdir -p "$AURDEST"
fi
if [ ! -d "$SRCDEST" ]; then
    mkdir -p "$SRCDEST"
fi
if [ ! -d "$BUILDDIR" ]; then
    mkdir -p "$BUILDDIR"
fi
if [ -d "${HOME}/Desktop" ]; then
    rmdir "${HOME}/Desktop"
fi
if [ ! -d "${HOME}/Pictures/Screenshots" ]; then
    mkdir -p "${HOME}/Pictures/Screenshots"
fi
if [ ! -d "/tmp/.usercache/${USER}/trash" ]; then
    mkdir -p "/tmp/.usercache/${USER}/trash"
    rm -f "${HOME}/.local/share/Trash"
    ln -s "/tmp/.usercache/${USER}/trash" "${HOME}/.local/share/Trash"
fi

# Older Golang version helper functions
go1.10() {
    _args=$@
    sg firewall-web -c "export GOROOT=\"${HOME}/Documents/Development/GoArchive/go1.10.8\"; export GOPATH=\"$(pwd)\"; \"${HOME}/Documents/Development/GoArchive/go1.10.8/bin/go\" $_args"
}
go1.11() {
    _args=$@
    sg firewall-web -c "export GOROOT=\"${HOME}/Documents/Development/GoArchive/go1.11.13\"; \"${HOME}/Documents/Development/GoArchive/go1.11.13/bin/go\" $_args"
}
go1.12() {
    _args=$@
    sg firewall-web -c "export GOROOT=\"${HOME}/Documents/Development/GoArchive/go1.12.17\"; \"${HOME}/Documents/Development/GoArchive/go1.12.17/bin/go\" $_args"
}
go1.13() {
    _args=$@
    sg firewall-web -c "export GOROOT=\"${HOME}/Documents/Development/GoArchive/go1.13.15\"; \"${HOME}/Documents/Development/GoArchive/go1.13.15/bin/go\" $_args"
}
go1.14() {
    _args=$@
    sg firewall-web -c "export GOROOT=\"${HOME}/Documents/Development/GoArchive/go1.14.15\"; \"${HOME}/Documents/Development/GoArchive/go1.14.15/bin/go\" $_args"
}
go1.15() {
    _args=$@
    sg firewall-web -c "export GOROOT=\"${HOME}/Documents/Development/GoArchive/go1.15.15\"; \"${HOME}/Documents/Development/GoArchive/go1.15.15/bin/go\" $_args"
}
go1.16() {
    _args=$@
    sg firewall-web -c "export GOROOT=\"${HOME}/Documents/Development/GoArchive/go1.16.15\"; \"${HOME}/Documents/Development/GoArchive/go1.16.15/bin/go\" $_args"
}
go1.17() {
    _args=$@
    sg firewall-web -c "export GOROOT=\"${HOME}/Documents/Development/GoArchive/go1.17.13\"; \"${HOME}/Documents/Development/GoArchive/go1.17.13/bin/go\" $_args"
}
go1.18() {
    _args=$@
    sg firewall-web -c "export GOROOT=\"${HOME}/Documents/Development/GoArchive/go1.18.10/\"; \"${HOME}/Documents/Development/GoArchive/go1.18.10/bin/go\" $_args"
}
go1.19() {
    _args=$@
    sg firewall-web -c "export GOROOT=\"${HOME}/Documents/Development/GoArchive/go1.19.5\"; \"${HOME}/Documents/Development/GoArchive/go1.19.5/bin/go\" $_args"
}
go1.20() {
    _args=$@
    sg firewall-web -c "export GOROOT=\"${HOME}/Documents/Development/GoArchive/go1.20.6\"; \"${HOME}/Documents/Development/GoArchive/go1.20.6/bin/go\" $_args"
}

# Firewall Aliases
alias nc="/usr/bin/gh all /usr/bin/nc"
alias yay="/usr/bin/gh web /usr/bin/yay"
alias ssh="/usr/bin/gh ssh /usr/bin/ssh"
alias scp="/usr/bin/gh ssh /usr/bin/scp"
alias git="/usr/bin/gh web /usr/bin/git"
alias pip="/usr/bin/gh  web /usr/bin/pip"
alias nmap="/usr/bin/gh all /usr/bin/nmap"
alias curl="/usr/bin/gh web /usr/bin/curl"
alias ping="/usr/bin/gh icmp /usr/bin/ping"
alias rsync="/usr/bin/gh ssh /usr/bin/rsync"
alias pacman="/usr/bin/gh web /usr/bin/pacman"
alias vnc="/usr/bin/gh ctl /usr/bin/vncviewer"
alias wython="/usr/bin/gh web /usr/bin/python3"
alias go="nocorrect /usr/bin/gh web /usr/bin/go"
alias gpg="gpg --homedir ${HOME}/.local/share/gnupg"
alias gpg2="gpg2 --homedir ${HOME}/.local/share/gnupg"
alias quote="/usr/bin/gh web ${HOME}/.local/bin/motivate -n"
alias xfreerdp="nocorrect /usr/bin/gh ctl /usr/bin/xfreerdp"
alias vncviewer="nocorrect /usr/bin/gh ctl /usr/bin/vncviewer"
alias wgo="nocorrect env GOOS=windows /usr/bin/gh web /usr/bin/go"
alias wget="/usr/bin/gh web /usr/bin/wget --hsts-file=${HOME}/.cache/wget-hsts"
alias rdp="nocorrect /usr/bin/gh ctl /usr/bin/xfreerdp /wm-class:TSRDP /size:1915x1035 +clipboard"

# Python Aliases
alias p="/usr/bin/python3"
alias python="/usr/bin/python3"

# Lock Aliases
alias lock0="lockctl -ft -1"
alias lock3="lockctl -ft 30"
alias lock6="lockctl -ft 60"
alias lock9="lockctl -ft 90"
alias lock12="lockctl -ft 120"
alias lock10="lockctl -ft 600"

# Power Aliases
alias bright="brightnessctl"
alias nohib="lockerctl -z true"
alias sus="sudo systemctl suspend"
alias hib="sudo systemctl hibernate"
alias automon="/usr/lib/smd/libexec/smd-auto-display auto"

# Locker Aliases
alias coffee="lockerctl -z 600 -kb 300 -kl 300 -s 300"
alias caffeine="lockerctl -z 600 -kb 600 -kl 600 -s 600"
alias expresso="lockerctl -z 900 -kb 900 -kl 900 -s 900"
alias insomnia="lockerctl -kz true -kb true -kl true -ks true"
alias chill="lockerctl -kz false -kb false -kl false -ks false -kd false"

# CPU Aliases
alias power0="cpuctl -x 600Mhz -m 400Mhz -t 0 -tx 20 -tm 10 -g powersave -p power"
alias power1="cpuctl -x 800Mhz -m 400Mhz -t 0 -tx 20 -tm 10 -g powersave -p balance_power"
alias power2="cpuctl -x 1.5Ghz -m 400Mhz -t 0 -tx 40 -tm 10 -g powersave -p balance_power"
alias power3="cpuctl -x 1.9Ghz -m 400Mhz -t 0 -tx 75 -tm 10 -g performance -p balance_performance"
alias power3="cpuctl -x 2.5Ghz -m 400Mhz -t 1 -tx 70 -tm 10 -g performance -p balance_performance"
alias power4="cpuctl -x 3.0Ghz -m 400Mhz -t 1 -tx 85 -tm 20 -g performance -p performance"
alias power5="cpuctl -x 4.0Ghz -m 400Mhz -t 1 -tx 100 -tm 10 -g performance -p performance"

# LSd Aliases
alias l="/usr/bin/lsd -vFl --group-directories-first --color=auto"
alias ls="/usr/bin/lsd -vF --group-directories-first --color=auto"
alias lsd="/usr/bin/lsd -vFlh --group-directories-first --color=auto"
alias lsa="/usr/bin/lsd -vFlA --group-directories-first --color=auto"

# LS Aliases (OG ls)
alias z="/usr/bin/ls -vpFNl --group-directories-first --color=auto"
alias zs="/usr/bin/ls -vpFN --group-directories-first --color=auto"
alias zsd="/usr/bin/ls -vpFNlh --group-directories-first --color=auto"
alias zsa="/usr/bin/ls -vpFNlA --group-directories-first --color=auto"

# Screenshot Aliases
alias sch="${HOME}/.local/bin/i3/shot"
alias sel="${HOME}/.local/bin/i3/clip"
alias ssc="${HOME}/.local/bin/i3/shot-copy"
alias selc="${HOME}/.local/bin/i3/clip-copy"

# Go Aliases
alias gv="/usr/bin/gh web go vet ./...'"
alias gsc="/usr/bin/gh web staticcheck ./..."
alias gmo="go list -u -m -json all | go-mod-outdated"
alias gmou="go list -u -m -json all | go-mod-outdated -update"
alias gsc-win="/usr/bin/gh web env GOOS=windows staticcheck ./..."
alias gov="/usr/bin/gh web sh -c 'go mod tidy; go vet ./...; staticcheck ./...; fieldalignment ./...'"

# Utility Aliases
alias xx="exit"
alias rm="rm -I"
alias cls="clear"
alias less="less -iR"
alias sat="/usr/bin/cat"
alias pat="/usr/bin/bat"
alias powershell="pwsh"
alias jq="/usr/bin/jq -C"
alias hydra="nocorrect hydra"
alias vsc="/usr/bin/vscodium"
alias code="/usr/bin/vscodium"
alias cat="/usr/bin/bat --paging=never"
alias diff="/usr/bin/diff --color=auto"
alias weather="gh web curl 'wttr.in/?0'"
alias nano="/usr/bin/nano -SLlwxiE --tabsize=4"
alias gsync="git add -A .; git commit; git push"
alias clip="/usr/bin/xclip -selection clipboard"
alias wgcc="nocorrect /usr/bin/x86_64-w64-mingw32-gcc"
alias pmov="python3 ${HOME}/Projects/Scripts/Python/move.py"
alias nts="python3 ${HOME}/Projects/Scripts/Python/ntstatus.py"
alias en="/usr/bin/gh web python3 ${HOME}/.local/bin/i3/sticky -"
alias dirdiff="python3 ${HOME}/Projects/Scripts/Python/dirdiff.py"
alias note="/usr/bin/gh web python3 ${HOME}/.local/bin/i3/sticky -"
# alias badge="sudo /usr/bin/python3 $HOME/.local/apps/badge/led-badge-11x44.py"
alias user_agents="/usr/bin/gh web curl -sL https://www.useragents.me/api | jq -r '.data[] | .ua' | awk -F'[()rv:]' '{n=\$2; gsub(\";\",\"\",n); print n\" [Random]: \"\$0}'"

source "${HOME}/.local/lib/zshrc.sh"
source "${HOME}/.local/share/colors.sh"
