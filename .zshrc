#!/usr/bin/zsh
################################
### iDigitalFlame  2016-2022 ###
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
# Copyright (C) 2016 - 2022 iDigitalFlame
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

export VISUAL="nano"
export ZSH_THEME="muse"
export UPDATE_ZSH_DAYS=14
export GOROOT="/usr/lib/go"
export ENABLE_CORRECTION="true"
export AURDEST="$HOME/.cache/aur"
export DISABLE_AUTO_UPDATE="false"
export PKGDEST="/var/cache/makepkg"
export GOPATH="$HOME/.local/lib/go"
export COMPLETION_WAITING_DOTS="true"
export ZSH="$HOME/.local/lib/oh-my-zsh"
export SRCDEST="/tmp/.usercache/$USER/aur/src"
export BUILDDIR="/tmp/.usercache/$USER/aur/build"
export SSH_AUTH_SOCK="/run/user/$UID/keyring/ssh"

export PATH=$PATH:$GOPATH/bin

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
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=(/media)
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=(/tmp/.mounts)
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=($HOME/Volumes)

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
if [ ! -d "$HOME/Pictures/Screenshots" ]; then
    mkdir -p "$HOME/Pictures/Screenshots"
fi
if [ ! -d "/tmp/.usercache/$USER/trash" ]; then
    mkdir -p "/tmp/.usercache/$USER/trash"
    rm -f "$HOME/.local/share/Trash"
    ln -s "/tmp/.usercache/$USER/trash" "$HOME/.local/share/Trash"
fi

# Go Build Helper Functions
#  gbo       - Golang Build Optimized
#  gbp       - Golang Build Optimized with Packed UPX
#  gbo-win   - Golang Build Optimized for Windows
#  gbp-win   - Golang Build Optimized for Windows with Packed UPX
#  gbp-dll   - Golang Build Optimized DLL for Windows (CMain and Go) with Packed UPX
#  gbp-exe   - Golang Build Optimized for Windows (CMain and Go) with Packed UPX
#  gbo-win32 - Golang Build Optimized for Windows x86
#  gbp-win32 - Golang Build Optimized for Windows x86 with Packed UPX
gbo() {
    if [ $# -eq 0 ]; then
        printf "$0 <build opts...>\n"
        return 1
    fi
    go build -trimpath -ldflags "-s -w" $@
}
gbp() {
    if [ $# -le 1 ]; then
        printf "$0 <output> <build opts...>\n"
        return 1
    fi
    file=$1; shift
    go build -trimpath -ldflags "-s -w" -o $file $@
    if [ $? -ne 0 ]; then
        printf "go build exited with non-zero status code.\n"
        return 1
    fi
    if [ ! -f "$file" ]; then
        return 1
    fi
    upx --compress-exports=1 --strip-relocs=1 --compress-icons=2 --best --no-backup -9 "$file"
}
gbo-win() {
    GOOS=windows gbo $@
}
gbp-win() {
    GOOS=windows gbp $@
}
gbp-dll() {
    if [ $# -lt 3 ]; then
        printf "gbp-dll <c_file> <go_file> <output> [gcc_args]\n"
        return 1
    fi
    cfile=$1; gofile=$2; output=$3
    shift 3
    name="/tmp/gb-$(openssl rand -hex 6)"
    env GOOS=windows CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -ldflags "-s -w" -buildmode=c-archive -o "${name}.a" "$gofile"
    if [ $? -ne 0 ]; then
        printf "go build exited with non-zero status code.\n"
        return 1
    fi
    x86_64-w64-mingw32-gcc -c -o "${name}.o" "$cfile" -fPIC -pthread -lwinmm -lntdll -lws2_32 -lpsapi -liphlpapi $@
    if [ $? -ne 0 ]; then
        printf "win64 gcc exited with non-zero status code.\n"
        rm -f "${name}.a" 2> /dev/null
        return 1
    fi
    x86_64-w64-mingw32-gcc -o "$output" -s -shared "${name}.o" "${name}.a" -fPIC -pthread -lwinmm -lntdll -lws2_32 -lpsapi -liphlpapi $@
    rm -f "${name}.a" 2> /dev/null; rm -f "${name}.o" 2> /dev/null; rm -f "${name}.h" 2> /dev/null
    if [ ! -f "$output" ]; then
        return 1
    fi
    upx --compress-exports=1 --strip-relocs=1 --compress-icons=0 --best --no-backup -9 "$output"
}
gbp-exe() {
    if [ $# -lt 3 ]; then
        printf "gbp-exe <c_file> <go_file> <output> [gcc_args]\n"
        return 1
    fi
    cfile=$1; gofile=$2; output=$3
    shift 3
    name="/tmp/gb-$(openssl rand -hex 6)"
    env GOOS=windows CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -ldflags "-s -w" -buildmode=c-archive -o "${name}.a" "$gofile"
    if [ $? -ne 0 ]; then
        printf "go build exited with non-zero status code.\n"
        return 1
    fi
    x86_64-w64-mingw32-gcc -o "$output" "$cfile" "${name}.a" -fPIC -pthread -lwinmm -lntdll -lws2_32 -lpsapi -liphlpapi $@
    rm -f "${name}.a" 2> /dev/null; rm -f "${name}.o" 2> /dev/null; rm -f "${name}.h" 2> /dev/null
    if [ ! -f "$output" ]; then
        return 1
    fi
    upx --compress-exports=1 --strip-relocs=1 --compress-icons=2 --best --no-backup -9 "$output"
}
gbo-win32() {
    GOOS=windows GOARCH=386 gbo $@
}
gbp-win32() {
    GOOS=windows GOARCH=386 gbp $@
}

# Firewall Aliases
alias nc="/usr/bin/gh all /usr/bin/nc"
alias yay="/usr/bin/gh web /usr/bin/yay"
alias ssh="/usr/bin/gh ssh /usr/bin/ssh"
alias scp="/usr/bin/gh ssh /usr/bin/scp"
alias git="/usr/bin/gh web /usr/bin/git"
alias pip="/usr/bin/gh  web /usr/bin/pip"
alias nmap="/usr/bin/gh all /usr/bin/nmap"
alias wget="/usr/bin/gh web /usr/bin/wget"
alias curl="/usr/bin/gh web /usr/bin/curl"
alias ping="/usr/bin/gh icmp /usr/bin/ping"
alias rsync="/usr/bin/gh ssh /usr/bin/rsync"
alias pacman="/usr/bin/gh web /usr/bin/pacman"
alias vnc="/usr/bin/gh ctl /usr/bin/vncviewer"
alias wython="/usr/bin/gh web /usr/bin/python3"
alias go="nocorrect /usr/bin/gh web /usr/bin/go"
alias quote="/usr/bin/gh web $HOME/.local/bin/motivate -n"
alias xfreerdp="nocorrect /usr/bin/gh ctl /usr/bin/xfreerdp"
alias vncviewer="nocorrect /usr/bin/gh ctl /usr/bin/vncviewer"
alias wgo="nocorrect env GOOS=windows /usr/bin/gh web /usr/bin/go"
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

# LS Aliases
alias l="/usr/bin/ls -lpFN --group-directories-first --color=auto"
alias ls="/usr/bin/ls -pFN --group-directories-first --color=auto"
alias lsd="/usr/bin/ls -lpFN --group-directories-first --color=auto"
alias lst="/usr/bin/ls -pFNt --group-directories-first --color=auto"
alias lsa="/usr/bin/ls -AlpFN --group-directories-first --color=auto"
alias lsl="/usr/bin/ls -AlpFN --group-directories-first --color=auto"
alias lsh="/usr/bin/ls -AlpFNh --group-directories-first --color=auto"
alias lsdt="/usr/bin/ls -lpFNt --group-directories-first --color=auto"
alias lsal="/usr/bin/ls -AlpFN --group-directories-first --color=auto"
alias lsat="/usr/bin/ls -AlpFNt --group-directories-first --color=auto"
alias lslt="/usr/bin/ls -AlpFNt --group-directories-first --color=auto"
alias lsht="/usr/bin/ls -AlpFNht --group-directories-first --color=auto"
alias lsalt="/usr/bin/ls -AlpFNt --group-directories-first --color=auto"

# Screenshot Aliases
alias ss="$HOME/.local/bin/i3/shot"
alias sel="$HOME/.local/bin/i3/clip"
alias ssc="$HOME/.local/bin/i3/shot-copy"
alias selc="$HOME/.local/bin/i3/clip-copy"

# Go Aliases
alias gv="gh web go vet ./...'"
alias gsc="gh web staticcheck ./..."

alias gsc-win="gh web env GOOS=windows staticcheck ./..."
alias gov="gh web sh -c 'go mod tidy; go vet ./...; staticcheck ./...; fieldalignment ./...'"

# Utility Aliases
alias xx="exit"
alias rm="rm -I"
alias cls="clear"
alias less="less -iR"
alias powershell="pwsh"
alias hydra="nocorrect hydra"
alias vsc="/usr/bin/vscodium"
alias code="/usr/bin/vscodium"
alias diff="/usr/bin/diff --color=auto"
alias weather="gh web curl 'wttr.in/?0'"
alias nano="/usr/bin/nano -SLlwxiE --tabsize=4"
alias gsync="git add -A .; git commit; git push"
alias clip="/usr/bin/xclip -selection clipboard"
alias wgcc="nocorrect /usr/bin/x86_64-w64-mingw32-gcc"
alias en="gh web python3 $HOME/.local/bin/i3/sticky -"
alias note="gh web python3 $HOME/.local/bin/i3/sticky -"
alias pmov="python3 $HOME/Projects/Scripts/Python/move.py"
alias nts="python3 $HOME/Projects/Scripts/Python/ntstatus.py"
# alias badge="sudo /usr/bin/python3 $HOME/.local/apps/badge/led-badge-11x44.py"

source "$HOME/.local/lib/zshrc.sh"
source "$HOME/.local/share/colors.sh"
