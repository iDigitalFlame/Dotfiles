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
# Updated 06/05/2018

## ZSH Vars
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

## Startups
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

## Function Definitions
ed() {
  _params="$@"
  /usr/bin/gedit -s "$_params" 2> /dev/null &
}
um() {
  _disk="$1"
  /usr/bin/udevil umount "/tmp/.mounts/$USER/$_disk"
}
mo() {
  _params="$@"
  /usr/bin/udevil mount $_params
}
sle() {
  _file="$1"
  _temp_file=$(openssl rand -hex 8)
  /usr/bin/cp "$1" "/tmp/$_temp_file.tmp"
  /usr/bin/chmod 777 "/tmp/$_temp_file.tmp"
  /usr/bin/leafpad "/tmp/$_temp_file.tmp" 2> /dev/null
  /usr/bin/sudo /usr/bin/mv "/tmp/$_temp_file.tmp" "$1"
}
__sg_cmd() {
  _params=($@)
  if [ ! -z "$_params" ] && [ ${#_params[@]} -ge 2 ]; then
    _command="${_params[@]:1}"
    /usr/bin/sg "${_params[1]}" -c "$_command"
  fi
}

## IPTables Aliases
alias pip="sudo -H pip"
alias pip2="sudo -H pip2"
alias ssh="__sg_cmd iptables-ssh /usr/bin/ssh"
alias scp="__sg_cmd iptables-ssh /usr/bin/scp"
alias git="__sg_cmd iptables-web /usr/bin/git"
alias wget="__sg_cmd iptables-web /usr/bin/wget"
alias curl="__sg_cmd iptables-web /usr/bin/curl"
alias ping="__sg_cmd iptables-ping /usr/bin/ping"
alias rsync="__sg_cmd iptables-ssh /usr/bin/rsync"
alias pacman="__sg_cmd iptables-web /usr/bin/pacman"
alias pacaur="__sg_cmd iptables-web /usr/bin/pacaur"
alias wython="__sg_cmd iptables-web /usr/bin/python3"
alias wython2="__sg_cmd iptables-web /usr/bin/python2"
alias firefox="__sg_cmd iptables-web /usr/bin/firefox"
alias rdp="__sg_cmd iptables-remote /usr/bin/xfreerdp"
alias quote="sg iptables-web -c \"~/.bin/motivate -get\""
alias python-web="__sg_cmd iptables-web /usr/bin/python3"
alias python2-web="__sg_cmd iptables-web /usr/bin/python2"
alias xfreerdp="__sg_cmd iptables-remote /usr/bin/xfreerdp"

## Python Aliases
alias p="/usr/bin/python3"
alias p2="/usr/bin/python2"
alias python="/usr/bin/python3"
alias python2="/usr/bin/python2"
alias pip-update="sudo -H sh -c \"sg iptables-web -c \\\"pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U\\\"\""
alias pip2-update="sudo -H sh -c \"sg iptables-web -c \\\"pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip2 install -U\\\"\""

## System Locker Aliases
alias lock="powerctl lock -f"
alias plock="powerctl locker"
alias hib="systemctl hibernate"
alias bright="powerctl brightness"
alias lock0="powerctl lock -ft -1"
alias lock3="powerctl lock -ft 30"
alias lock6="powerctl lock -ft 60"
alias lock9="powerctl lock -ft 90"
alias lock12="powerctl lock -ft 120"
alias lock10="powerctl lock -ft 600"
alias bright-up="powerctl brightness -i"
alias bright-set="powerctl brightness -s"
alias bright-down="powerctl brightness -d"
alias coffee="powerctl locker -ks 300 -kb 300 -kl 300"
alias caffeine="powerctl locker -ks 600 -kb 600 -kl 600"
alias expresso="powerctl locker -ks 900 -kb 900 -kl 900"
alias insomnia="powerctl locker -ks true -kb true -kl true"
alias chill="powerctl locker -ks false -kb false -kl false"

## System Power Aliases
alias cpu="powerctl cpu"
alias bton="powerctl blue -e"
alias btoff="powerctl blue -d"
alias blueon="powerctl blue -e"
alias blueoff="powerctl blue -d"
alias blue-on="powerctl blue -e"
alias blue-off="powerctl blue -d"
alias power0="powerctl cpu -x 800 -m 400 -t 0 -tx 20 -tm 10"
alias power1="powerctl cpu -x 1Ghz -m 400 -t 0 -tx 35 -tm 10"
alias power2="powerctl cpu -x 1.5Ghz -m 400 -t 1 -tx 50 -tm 10"
alias power3="powerctl cpu -x 2.5Ghz -m 400 -t 1 -tx 70 -tm 10"
alias power4="powerctl cpu -x 3.0Ghz -m 400 -t 1 -tx 80 -tm 10"

## ls Aliases
alias lsl="ls -alp --group-directories-first --color=auto"
alias lsh="ls -alph --group-directories-first --color=auto"
alias lsal="ls -alp --group-directories-first --color=auto"
alias lsd="find \"\$(pwd)\" -maxdepth 1 -type d -name .\* -ls"

## Utility Aliases
alias ss="~/.bin/screenshot"
alias sel="~/.bin/screenclip"
alias ss-c="~/.bin/screenshot-copy"
alias sel-c="~/.bin/screenclip-copy"
alias wgcc="/usr/bin/x86_64-w64-mingw32-gcc"
alias music="sudo /opt/spaceport/bin/playerctl"
alias public-ip="wget -q -O - https://ifconfig.co"
alias public-ip4="wget -4 -q -O - https://ifconfig.co"

## Wine Aliases
alias wine-exit="sh -c \"export WINEPREFIX=~/.msoffice; /usr/bin/wineboot --kill &> /dev/null\""
alias wine-restart="sh -c \"export WINEPREFIX=~/.msoffice; /usr/bin/wineboot --restart &> /dev/null\""

## Convienence Aliases
alias xx="exit"
alias edit="ed"
alias exx="exit"
alias cls="clear"
alias less="less -R"
alias vsc="code -r - &"
alias nano="/usr/bin/nano -Ll"
alias se="sudo /usr/bin/rnano -Ll"
alias sedit="sudo /usr/bin/rnano -Ll"
alias suedit="sudo /usr/bin/rnano -Ll"
alias diff="/usr/bin/diff --color=auto"
alias wineboot="echo Use a dam prefix\!"
alias clip="/usr/bin/xclip -selection clipboard"

## Private Commands Import
source "$HOME/.zshrc.inc"

# EOF