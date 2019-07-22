#!/usr/bin/zsh
################################
###### iDigitalFlame 2019 ######
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
# iDigitalFlame

export VISUAL="nano"
export ZSH_THEME="muse"
export UPDATE_ZSH_DAYS=14
export GOROOT="/usr/lib/go"
export ENABLE_CORRECTION="true"
export DISABLE_AUTO_UPDATE="false"
export PKGDEST="/var/cache/makepkg"
export GOPATH="$HOME/.local/lib/go"
export AURDEST="$HOME/.cache/pacaur"
export COMPLETION_WAITING_DOTS="true"
export ZSH="$HOME/.local/lib/oh-my-zsh"
export SSH_AUTH_SOCK="/run/user/$UID/keyring/ssh"
export SRCDEST="/tmp/.usercache/$USER/pacaur/src"
export BUILDDIR="/tmp/.usercache/$USER/pacaur/build"

export PATH=$PATH:$GOPATH/bin

plugins=(git encode64 screen sudo)
source "$ZSH/oh-my-zsh.sh"
typeset -A ZSH_HIGHLIGHT_STYLES
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
X_ZSH_HIGHLIGHT_DIRS_BLACKLIST+=(/media)
X_ZSH_HIGHLIGHT_DIRS_BLACKLIST+=(/tmp/.mounts)
X_ZSH_HIGHLIGHT_DIRS_BLACKLIST+=($HOME/Volumes)
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

__sg_cmd() {
    _params=($@)
    if [ ! -z "$_params" ] && [ ${#_params[@]} -ge 2 ]; then
        _command="${_params[@]:1}"
        /usr/bin/sg "${_params[1]}" -c "$_command"
    fi
}

# Golang Build Functions
gbf() {
    gbf-64 $@
}
gbfc() {
    gbfc-64 $@
}
gbf-64() {
    if [ $? -eq 0 ]; then
        printf "gbf-64 <gofile> [output]\n"
        return 1
    fi
    goout_file=$(echo "$1" | sed -e 's/\.go$//g')
    if [ $# -ge 2 ]; then
        goout_file="$2"
    fi
    go build -o "$goout_file" "$1"
}
gbf-86() {
    if [ $? -eq 0 ]; then
        printf "gbf-86 <gofile> [output]\n"
        return 1
    fi
    goout_file=$(echo "$1" | sed -e 's/\.go$//g')
    if [ $# -ge 2 ]; then
        goout_file="$2"
    fi
    env GOARCH=386 go build -o "$goout_file" "$1"
}
gbf-w64() {
    if [ $? -eq 0 ]; then
        printf "gbf-w64 <gofile> [output]\n"
        return 1
    fi
    goout_file=$(echo "$1" | sed -e 's/\.go$/\.exe/g')
    if [ $# -ge 2 ]; then
        goout_file="$2"
    fi
    env GOOS=windows go build -o "$goout_file" "$1"
}
gbf-w32() {
    if [ $? -eq 0 ]; then
        printf "gbf-w32 <gofile> [output]\n"
        return 1
    fi
    goout_file=$(echo "$1" | sed -e 's/\.go$/\.exe/g')
    if [ $# -ge 2 ]; then
        goout_file="$2"
    fi
    env GOOS=windows GOARCH=386 go build -o "$goout_file" "$1"
}
gbfc-64() {
    if [ $# -lt 2 ]; then
        printf "gbfc-64 <gofile> <cmain> [output] [gccargs]\n"
        return 1
    fi
    goout_file=$(echo "$1" | sed -e 's/\.go$//g')
    if [ $# -ge 3 ]; then
        goout_file="$3"
    fi
    gcc_args=""
    if [ $# -ge 4 ]; then
        gcc_arg="$4"
    fi
    go build -v -x -buildmode=c-archive "$1"
    gcc -o "$goout_file" "$2" "$(echo $1 | sed -e 's/\.go$/\.a/g')" -fPIC -lpthread $gcc_args
}
gbfc-w64() {
    if [ $# -lt 2 ]; then
        printf "gbfc-w64 <gofile> <cmain> [output] [gccargs]\n"
        return 1
    fi
    goout_file=$(echo "$1" | sed -e 's/\.go$/\.exe/g')
    if [ $# -ge 3 ]; then
        goout_file="$3"
    fi
    gcc_args=""
    if [ $# -ge 4 ]; then
        gcc_arg="$4"
    fi
    env GOOS=windows CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -v -x -buildmode=c-archive "$1"
    x86_64-w64-mingw32-gcc -o "$goout_file" "$2" "$(echo $1 | sed -e 's/\.go$/\.a/g')" -fPIC -pthread -lwinmm -lntdll -lws2_32 -lpsapi -liphlpapi $gcc_args
}
gbfc-w64dll() {
    if [ $# -lt 2 ]; then
        printf "gbfc-w64dll <gofile> <cmain> [output] [gccargs]\n"
        return 1
    fi
    goout_file=$(echo "$1" | sed -e 's/\.go$/\.dll/g')
    if [ $# -ge 3 ]; then
        goout_file="$3"
    fi
    gcc_args=""
    if [ $# -ge 4 ]; then
        gcc_arg="$4"
    fi
    env GOOS=windows CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -v -x -buildmode=c-archive "$1"
    x86_64-w64-mingw32-gcc -c -o "${goout_file}.o" "$2" -fPIC -pthread -lwinmm -lntdll -lws2_32 -lpsapi -liphlpapi $gcc_args
    x86_64-w64-mingw32-gcc -o "$goout_file" -s -shared "${goout_file}.o" "$(echo $1 | sed -e 's/\.go$/\.a/g')" -fPIC -pthread -lwinmm -lntdll -lws2_32 -lpsapi -liphlpapi $gcc_args
    rm -f "${goout_file}.o"
}

# Firewall Aliases
alias ssh="__sg_cmd firewall-ssh /usr/bin/ssh"
alias scp="__sg_cmd firewall-ssh /usr/bin/scp"
alias git="__sg_cmd firewall-web /usr/bin/git"
alias pip="__sg_cmd firewall-web /usr/bin/pip"
alias wget="__sg_cmd firewall-web /usr/bin/wget"
alias curl="__sg_cmd firewall-web /usr/bin/curl"
alias ping="__sg_cmd firewall-icmp /usr/bin/ping"
alias rsync="__sg_cmd firewall-ssh /usr/bin/rsync"
alias goget="__sg_cmd firewall-web /usr/bin/go get"
alias pacman="__sg_cmd firewall-web /usr/bin/pacman"
alias pacaur="__sg_cmd firewall-web /usr/bin/pacaur"
alias xfreerdp="__sg_cmd firewall-ctl /usr/bin/xfreerdp"
alias quote="sg firewall-web -c \"$HOME/.local/bin/motivate -get\""
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
alias sus="systemctl suspend"
alias lock12="lockctl -ft 120"
alias lock10="lockctl -ft 600"
alias hib="systemctl hibernate"
alias nohib="lockerctl -z true"
alias bright-up="brightnessctl -i"
alias bright-set="brightnessctl -s"
alias bright-down="brightnessctl -d"

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
alias lsl="ls -alp --group-directories-first --color=auto"
alias lsh="ls -alph --group-directories-first --color=auto"
alias lsal="ls -alp --group-directories-first --color=auto"

# Screenshot Aliases
alias ss="$HOME/.local/bin/i3/shot"
alias sel="$HOME/.local/bin/i3/clip"
alias ss-c="$HOME/.local/bin/i3/shot-copy"
alias sel-c="$HOME/.local/bin/i3/clip-copy"

# Utility Aliases
alias xx="exit"
alias exx="exit"
alias psh="pwsh"
alias cls="clear"
alias less="less -R"
alias powershell="pwsh"
alias vsc="/usr/bin/vscodium"
alias code="/usr/bin/vscodium"
alias nano="/usr/bin/nano -Ll"
alias sedit="sudo /usr/bin/rnano -Ll"
alias suedit="sudo /usr/bin/rnano -Ll"
alias diff="/usr/bin/diff --color=auto"
alias wgcc="/usr/bin/x86_64-w64-mingw32-gcc"
alias gsync="git add -A .; git commit; git push"
alias clip="/usr/bin/xclip -selection clipboard"

source "$HOME/.local/lib/zshrc.sh"
