################################
###### iDigitalFlame 2018 ######
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
# iDigitalFlame 2018

# ZSH Vars
export VISUAL="nano"
export ZSH_THEME="muse"
export GOPATH="$HOME/.go"
export UPDATE_ZSH_DAYS=14
export GOROOT="/usr/lib/go"
export ZSH="$HOME/.oh-my-zsh"
export AURDEST="$HOME/.pacaur"
export ENABLE_CORRECTION="true"
export DISABLE_AUTO_UPDATE="false"
export PKGDEST="/var/cache/makepkg"
export COMPLETION_WAITING_DOTS="true"
export SRCDEST="/tmp/.$USER-pacaur-src"
export BUILDDIR="/tmp/.$USER-pacaur-build"

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

# Startups
~/.bin/motivate | cowsay -W 75 -f small | lolcat
if [ ! -d "$HOME/.pacaur" ]; then
  mkdir -p "$HOME/.pacaur"
fi
if [ ! -d "/tmp/.$USER-pacaur-src" ]; then
  mkdir -p "/tmp/.$USER-pacaur-src"
fi
if [ ! -d "/tmp/.$USER-pacaur-build" ]; then
  mkdir -p "/tmp/.$USER-pacaur-build"
fi
if [ ! -d "$HOME/Pictures/Screenshots" ]; then
  mkdir -p "$HOME/Pictures/Screenshots"
fi

# Function Definitions
__sg_cmd() {
  _params=($@)
  if [ ! -z "$_params" ] && [ ${#_params[@]} -ge 2 ]; then
    _command="${_params[@]:1}"
    /usr/bin/sg "${_params[1]}" -c "$_command"
  fi
}

# IPTables Aliases
alias ssh="__sg_cmd iptables-ssh /usr/bin/ssh"
alias scp="__sg_cmd iptables-ssh /usr/bin/scp"
alias git="__sg_cmd iptables-web /usr/bin/git"
alias wget="__sg_cmd iptables-web /usr/bin/wget"
alias curl="__sg_cmd iptables-web /usr/bin/curl"
alias ping="__sg_cmd iptables-ping /usr/bin/ping"
alias rsync="__sg_cmd iptables-ssh /usr/bin/rsync"
alias pacman="__sg_cmd iptables-web /usr/bin/pacman"
alias pacaur="__sg_cmd iptables-web /usr/bin/pacaur"
alias rdp="__sg_cmd iptables-remote /usr/bin/xfreerdp"
alias quote="sg iptables-web -c \"~/.bin/motivate -get\""
alias xfreerdp="__sg_cmd iptables-remote /usr/bin/xfreerdp"

# Python Aliases
alias p="/usr/bin/python3"
alias p2="/usr/bin/python2"
alias python="/usr/bin/python3"
alias python2="/usr/bin/python2"

# System Locker Aliases
alias lock0="lockctl -ft -1"
alias lock3="lockctl -ft 30"
alias lock6="lockctl -ft 60"
alias lock9="lockctl -ft 90"
alias bright="brightnessctl"
alias lock12="lockctl -ft 120"
alias lock10="lockctl -ft 600"
alias hib="systemctl hibernate"
alias nohib="lockerctl -s true"
alias bright-up="brightnessctl -i"
alias bright-set="brightnessctl -s"
alias bright-down="brightnessctl -d"
alias coffee="lockerctl -s 300 -kb 300 -kl 300"
alias caffeine="lockerctl -s 600 -kb 600 -kl 600"
alias expresso="lockerctl -s 900 -kb 900 -kl 900"
alias insomnia="lockerctl -ks true -kb true -kl true"
alias chill="lockerctl -ks false -kb false -kl false"

# System Power Aliases
alias power9="cpuctl -x 600 -m 400 -t 0 -tx 15 -tm 10 -g powersave -p power"
alias power0="cpuctl -x 800 -m 400 -t 0 -tx 20 -tm 10 -g powersave -p balance_power"
alias power1="cpuctl -x 1Ghz -m 400 -t 0 -tx 35 -tm 10 -g powersave -p balance_power"
alias power2="cpuctl -x 1.5Ghz -m 400 -t 1 -tx 50 -tm 15 -g preformance -p balance_preformance"
alias power3="cpuctl -x 2.5Ghz -m 400 -t 1 -tx 70 -tm 20 -g preformance -p balance_preformance"
alias power4="cpuctl -x 3.0Ghz -m 400 -t 1 -tx 80 -tm 20 -g preformance -p preformance"

# ls Aliases
alias lsl="ls -alp --group-directories-first --color=auto"
alias lsh="ls -alph --group-directories-first --color=auto"
alias lsal="ls -alp --group-directories-first --color=auto"

# Utility Aliases
alias ss="~/.bin/i3/shot"
alias sel="~/.bin/i3/clip"
alias ss-c="~/.bin/i3/shot-copy"
alias sel-c="~/.bin/i3/clip-copy"
alias wgcc="/usr/bin/x86_64-w64-mingw32-gcc"
alias public-ip="wget -q -O - https://ifconfig.co"
alias public-ip4="wget -4 -q -O - https://ifconfig.co"

## Convienence Aliases
alias xx="exit"
alias exx="exit"
alias cls="clear"
alias less="less -R"
alias vsc="code -r - &"
alias nano="/usr/bin/nano -Ll"
alias sedit="sudo /usr/bin/rnano -Ll"
alias suedit="sudo /usr/bin/rnano -Ll"
alias diff="/usr/bin/diff --color=auto"
alias clip="/usr/bin/xclip -selection clipboard"

## Private Commands Import
source "$HOME/.zshrc.inc"

# EOF