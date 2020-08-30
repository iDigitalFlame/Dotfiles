#!/usr/bin/zsh
################################
###### iDigitalFlame 2020 ######
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
# Copyright (C) 2020 iDigitalFlame
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
export SSH_AUTH_SOCK="/run/user/$UID/keyring/ssh"
export BUILDDIR="/tmp/.usercache/$USER/aur/build"

export PATH=$PATH:$GOPATH/bin

plugins=(git encode64 screen sudo)
source "$ZSH/oh-my-zsh.sh"
typeset -A ZSH_HIGHLIGHT_STYLES
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main root)
ZSH_HIGHLIGHT_STYLES[root]='bg=red'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow,bold'
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=("/media")
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=("/tmp/.mounts")
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=("$HOME/Volumes")
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

# Firewall Switch Group Helper Function
__sg_cmd() {
    args=($@); params=${args[@]:1}
    if [ ! -z "$args" ] && [ ${#args[@]} -ge 2 ]; then
        /usr/bin/sg "${args[1]}" -c $params
    fi
}

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
    flags=$@
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
    shift; shift; shift
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
gbb-exe() {
    if [ $# -lt 3 ]; then
        printf "gbp-exe <c_file> <go_file> <output> [gcc_args]\n"
        return 1
    fi
    cfile=$1; gofile=$2; output=$3
    shift; shift; shift
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
alias nc="__sg_cmd firewall-all /usr/bin/nc"
alias go="__sg_cmd firewall-web /usr/bin/go"
alias yay="__sg_cmd firewall-web /usr/bin/yay"
alias ssh="__sg_cmd firewall-ssh /usr/bin/ssh"
alias scp="__sg_cmd firewall-ssh /usr/bin/scp"
alias git="__sg_cmd firewall-web /usr/bin/git"
alias pip="__sg_cmd firewall-web /usr/bin/pip"
alias nmap="__sg_cmd firewall-all /usr/bin/nmap"
alias wget="__sg_cmd firewall-web /usr/bin/wget"
alias curl="__sg_cmd firewall-web /usr/bin/curl"
alias ping="__sg_cmd firewall-icmp /usr/bin/ping"
alias rsync="__sg_cmd firewall-ssh /usr/bin/rsync"
alias pacman="__sg_cmd firewall-web /usr/bin/pacman"
alias vnc="__sg_cmd firewall-ctl /usr/bin/vncviewer"
alias wython="__sg_cmd firewall-web /usr/bin/python3"
alias xfreerdp="__sg_cmd firewall-ctl /usr/bin/xfreerdp"
alias vncviewer="__sg_cmd firewall-ctl /usr/bin/vncviewer"
alias quote="sg firewall-web -c '$HOME/.local/bin/motivate -n'"
alias rdp="__sg_cmd firewall-ctl /usr/bin/xfreerdp /wm-class:TSRDP /size:1915x1035 +clipboard"

# Python Aliases
alias p="/usr/bin/python3"
alias python="/usr/bin/python3"

# Lock Aliases
alias lock0="lockctl -ft -1"
alias lock3="lockctl -ft 30"
alias lock6="lockctl -ft 60"
alias lock9="lockctl -ft 90"

# Power Aliases
alias bright="brightnessctl"
alias lock12="lockctl -ft 120"
alias lock10="lockctl -ft 600"
alias nohib="lockerctl -z true"
alias sus="sudo systemctl suspend"
alias bright-up="brightnessctl -i"
alias bright-set="brightnessctl -s"
alias bright-down="brightnessctl -d"
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
alias gv="sg firewall-web -c 'go vet ./...'"
alias gsc="sg firewall-web -c 'staticcheck ./...'"
alias gsc-win="sg firewall-web -c 'env GOOS=windows staticcheck ./...'"
alias gscw="sg firewall-web -c 'staticcheck -unused.whole-program ./...'"
alias gscw-win="sg firewall-web -c 'env GOOS=windows staticcheck -unused.whole-program ./...'"

# Utility Aliases
alias xx="exit"
alias exx="exit"
alias psh="pwsh"
alias rm="rm -I"
alias cls="clear"
alias less="less -R"
alias powershell="pwsh"
alias vsc="/usr/bin/vscodium"
alias code="/usr/bin/vscodium"
alias nano="/usr/bin/nano -Ll"
alias gdiff="/usr/bin/git diff"
alias sedit="sudo /usr/bin/rnano -Ll"
alias suedit="sudo /usr/bin/rnano -Ll"
alias diff="/usr/bin/diff --color=auto"
alias wgcc="/usr/bin/x86_64-w64-mingw32-gcc"
alias govet="sg firewall-web -c 'go vet ./...'"
alias gsync="git add -A .; git commit; git push"
alias clip="/usr/bin/xclip -selection clipboard"
alias side="kill -s USR1 $(pidof deadd-notification-center)"
alias weather="/usr/bin/sg firewall-web -c 'curl wttr.in/?0'"
alias nts="python3 $HOME/Projects/Scripts/Python/ntstatus.py"
alias badge="sudo /usr/bin/python3 $HOME/.local/apps/badge/led-badge-11x44.py"

source "$HOME/.local/lib/zshrc.sh"
source "$HOME/.local/share/colors.sh"
