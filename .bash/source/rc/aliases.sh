alias h='history | less +G'
alias hgrep='history | grep'
alias timestamp="date +'%Y%m%d_%H%M%S'"

if [ -n "$DISPLAY" ]; then
  # Add an "alert" alias for long running commands.  Use like so:
  #   sleep 10; alert
  alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
else
  alias alert=beep
fi

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

  # enable color support of ls and also add handy aliases
  alias ls='ls --color=auto'
  alias ll='ls --color=auto -lh'
  alias la='ls --color=auto -hA'

  # grep aliases and color support
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

  # enable color support for less
  alias less='less -R'

  #Check battery status
  alias batstat='upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E "percentage|time to full|time to empty|state"'
  alias bs='upower -d | grep -E "battery|mouse|keyboard|percentage|time to full|time to empty|state"'

  #ping google
  alias pingg='ping -c 5 8.8.8.8'

  # human readable file sizes
  alias lk='ls --color=auto --block-size=k -lha'
  alias lm='ls --color=auto --block-size=m -lha'
  alias lh='ls -lha --block-size=k -d .*'
  alias ld='ll -d */'

  # xclip utility
  # use like cat to_be_copied.txt | clip
  alias clip='xclip -selection clipboard'

  alias cc=countChars

  # Stopwatch
  alias timer='echo "Timer started. Stop with Ctrl-C." && date && time cat && date'

  # Show contents of /etc/resolv.conf
  alias as='cat /etc/resolv.conf && echo ""'

  # Toggle Airvpn status using stunnel and openvpn (requires sudo)
  alias at=toggleAirvpn

  #start xscreensaver
  alias xs='xscreensaver-command -lock'

  # find self external ip
  alias selfip='wget http://ipinfo.io/ip -qO -'

  # find self geo location
  alias geo='echo "Looking for self ip geolocation" && curl -s ipinfo.io/"$(wget http://ipinfo.io/ip -qO -)" | egrep -w "city|region|country"'

  # find given ip geo location
  alias geo2=geoLocate

  # test connection speed
  alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

  # set huawei netstick on
  alias netstick='sudo usb_modeswitch -J -v 0x12d1 -p 0x1446'

  # watch the last lines of the dmesg stream
  alias wdmesg='watch -n1 "dmesg | tail -n 20"'

  # run vscode as sudoer
  alias scode='sudo code --user-data-dir=/home/hemulin/data-dir .'

  # htop to watch pids of specific program
  alias htop_watch=htopp

  alias bt='python ~/.bash/headset_bt.py'

  # Functions
  toggleAirvpn() {
	cwd=$(pwd)
    cd /home/hemulin/vpn/airvpn
    sudo /home/hemulin/vpn/airvpn/airvpn_toggler.py ${1:-on} ${2:-show}
    cd $cwd
  }

  countChars() {
	echo "Chars count in input:"
    echo -n $1 | wc -c
  }

  geoLocate() {
	echo "Looking for $1 geolocation:"
    curl -s ipinfo.io/$1 | egrep -w "city|region|country"
  }

  htopp() {
	PIDS=$(pgrep $1 | xargs echo | sed 's/ /,/g')
    echo "htop is watching the following $1 pids: $PIDS"
	htop -p $PIDS
  }

fi
