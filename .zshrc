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
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
PROMPT="%n $PROMPT"

# Startups
motivate | cowsay -W 75 -f small | lolcat
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

# Functions
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
  cp "$1" "/tmp/$_temp_file.tmp"
  chmod 777 "/tmp/$_temp_file.tmp"
  /usr/bin/leafpad "/tmp/$_temp_file.tmp" 2> /dev/null
  sudo mv "/tmp/$_temp_file.tmp" "$1"
}
__sg_cmd() {
  _params=($@)
  if [ ! -z "$_params" ] && [ ${#_params[@]} -ge 2 ]; then
    _command="${_params[@]:1}"
    sg "${_params[1]}" -c "$_command"
  fi
}

# IPTables Aliases
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
alias python-web="__sg_cmd iptables-web /usr/bin/python3"
alias python2-web="__sg_cmd iptables-web /usr/bin/python2"
alias xfreerdp="__sg_cmd iptables-remote /usr/bin/xfreerdp"
alias quote="sg iptables-web -c \"/usr/bin/python3 ~/.bin/quote\""
alias chrome="__sg_cmd iptables-web /usr/bin/google-chrome-stable"

# Python Aliases
alias p="/usr/bin/python3"
alias p2="/usr/bin/python2"
alias pip3-update="pip-update"
alias python="/usr/bin/python3"
alias python2="/usr/bin/python2"
alias pip-update="sudo -H sh -c \"sg iptables-web -c \\\"pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U\\\"\""
alias pip2-update="sudo -H sh -c \"sg iptables-web -c \\\"pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip2 install -U\\\"\""

# System Locker Aliases
alias lo="powerctl lock -f"
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

# System Power Aliases
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
alias power4="powerctl cpu -x 3.0Ghz -m 400 -t 1 -tx 70 -tm 10"

# ls Aliases
alias lsl="ls -alp --group-directories-first --color=auto"
alias lsh="ls -alph --group-directories-first --color=auto"
alias lsal="ls -alp --group-directories-first --color=auto"
alias lsd="find \"\$(pwd)\" -maxdepth 1 -type d -name .\* -ls"

# Utility Aliases
alias ss="~/.bin/screenshot"
alias ssel="~/.bin/screenclip"
alias ssc="~/.bin/screenshot-copy"
alias sselc="~/.bin/screenclip-copy"
alias wgcc="/usr/bin/x86_64-w64-mingw32-gcc"
alias music="sudo /opt/spaceport/bin/playerctl"
alias public-ip="wget -q -O - https://ifconfig.co"
alias public-ip4="wget -4 -q -O - https://ifconfig.co"
alias sync-hosts="sg iptables-web -c \"/usr/bin/python3 ~/.apps/updateHosts/updateHostsFile.py --auto\"; sudo sh -c \"cp ~/.apps/updateHosts/hosts /etc/hosts; systemctl restart systemd-resolved\""

# WIne Aliases
alias wine-exit="sh -c \"export WINEPREFIX=~/.msoffice; /usr/bin/wineboot --kill &> /dev/null\""
alias wine-restart="sh -c \"export WINEPREFIX=~/.msoffice; /usr/bin/wineboot --restart &> /dev/null\""

# General Aliases
alias xx="exit"
alias edit="ed"
alias exx="exit"
alias cls="clear"
alias less="less -R"
alias vsc="code -r - &"
alias lp="/usr/bin/leafpad"
alias se="sudo /usr/bin/rnano"
alias nano="/usr/bin/nano -Ll"
alias sedit="sudo /usr/bin/rnano -Ll"
alias suedit="sudo /usr/bin/rnano -Ll"
alias diff="/usr/bin/diff --color=auto"
alias wineboot="echo Use a dam prefix\!"
alias clip="/usr/bin/xclip -selection clipboard"

source "$HOME/.zshrc.inc"

# EOF