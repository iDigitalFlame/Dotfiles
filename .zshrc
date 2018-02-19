# ZSH Profile
################################
# iDigitalFlame

################################
export VISUAL="nano"
export ZSH=/home/iDigitalFlame/.oh-my-zsh
ZSH_THEME="muse"
DISABLE_AUTO_UPDATE="false"
export UPDATE_ZSH_DAYS=14
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git encode64 screen sudo)
source $ZSH/oh-my-zsh.sh
PROMPT="%n $PROMPT"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

################################
# Startups
motivate | cowsay -W 75 -f small | lolcat
if [ ! -d "$HOME/Pictures/Screenshots" ]; then 
  mkdir -p "$HOME/Pictures/Screenshots"
fi

################################
# IPTables compatibility
__sg_cmd() {
  _params=($@)
  if [ ! -z "$_params" ] && [ ${#_params[@]} -ge 2 ]; then
    _command="${_params[@]:1}"
    sg "${_params[1]}" -c "$_command"
  fi
}

################################
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
################################
# IPTables Aliases
alias pip="sudo -H pip"
alias pip2="sudo -H pip2"
alias ssh="__sg_cmd iptables-ssh /usr/bin/ssh"
alias git="__sg_cmd iptables-web /usr/bin/git"
alias wget="__sg_cmd iptables-web /usr/bin/wget"
alias curl="__sg_cmd iptables-web /usr/bin/curl"
alias ping="__sg_cmd iptables-ping /usr/bin/ping"
alias pacman="__sg_cmd iptables-web /usr/bin/pacman"
alias pacaur="__sg_cmd iptables-web /usr/bin/pacaur"
alias wython="__sg_cmd iptables-web /usr/bin/python3"
alias wython2="__sg_cmd iptables-web /usr/bin/python2"
alias firefox="__sg_cmd iptables-web /usr/bin/firefox"
alias rdp="__sg_cmd iptables-remote /usr/bin/xfreerdp"
alias mail="__sg_cmd iptables-mail /usr/bin/thunderbird"
alias python-web="__sg_cmd iptables-web /usr/bin/python3"
alias python2-web="__sg_cmd iptables-web /usr/bin/python2"
alias xfreerdp="__sg_cmd iptables-remote /usr/bin/xfreerdp"
alias vncviewer="__sg_cmd iptables-remote /usr/bin/vncviewer"
alias quote="sg iptables-web -c \"/usr/bin/python3 ~/.bin/quote\""
alias chrome="__sg_cmd iptables-web /usr/bin/google-chrome-stable"

################################
# Python Aliases
alias p="/usr/bin/python3"
alias p2="/usr/bin/python2"
alias python="/usr/bin/python3"
alias python2="/usr/bin/python2"
alias pip-update="sudo -H sh -c \"sg iptables-web -c \\\"pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U\\\"\""

################################
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

################################
# System Power Aliases
alias power0="powerctl cpu -x 800 -m 400 -t 0 -tx 20 -tm 10"
alias power1="powerctl cpu -x 1Ghz -m 400 -t 0 -tx 35 -tm 10"
alias power2="powerctl cpu -x 1.5Ghz -m 400 -t 1 -tx 50 -tm 10"
alias power3="powerctl cpu -x 2.5Ghz -m 400 -t 1 -tx 70 -tm 10"
alias power4="powerctl cpu -x 3Ghz -m 400 -t 1 -tx 70 -tm 10"

################################
# ls Aliases
alias lsh="ls -aph"
alias lsl="ls -alp"
alias lsal="ls -alp"

################################
# Utility Aliases
alias vi3="nano ~/.config/i3/config"
alias vihosts="nano ~/.ssh/known_hosts"
alias wgcc="/usr/bin/x86_64-w64-mingw32-gcc"
alias public-ip="wget -q -O - https://ifconfig.co"
alias music="sudo /opt/spaceport/bin/music-player"
alias public-ip4="wget -4 -q -O - https://ifconfig.co"
alias ssc="/usr/bin/maim -u -o | xclip -selection clipboard -t image/png"
alias sselc="/usr/bin/maim -u -o -s | xclip -selection clipboard -t image/png"
alias ss="/usr/bin/maim -u -o ~/Pictures/Screenshots/\$(date +%m-%d-%Y-%H-%m-%S)-capture.jpg"
alias ssel="/usr/bin/maim -u -o -s ~/Pictures/Screenshots/\$(date +%m-%d-%Y-%H-%m-%S)-capture.jpg"
alias updatehosts="sg iptables-web -c \"/usr/bin/python3 ~/.apps/updateHosts/updateHostsFile.py --auto\";sudo sh -c \"cp ~/.apps/updateHosts/hosts /etc/hosts;systemctl restart systemd-resolved\""

################################
# General Aliases
alias xx="exit"
alias edit="ed"
alias exx="exit"
alias cls="clear"
alias pctl="powerctl"
alias lp="/usr/bin/leafpad"
alias sedit="sudo /usr/bin/rnano"
alias suedit="sudo /usr/bin/rnano"
alias diff="/usr/bin/diff --color=auto"
alias clip="/usr/bin/xclip -selection clipboard"
alias spaceport-repo-sync="/usr/bin/sg git -c \"cd /opt/spaceport; git add -A .; git commit;\"; /usr/bin/sg iptables-web -c \"cd /opt/spaceport; git push\""
