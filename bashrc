# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
case $- in
	*i*) ;;
	  *) return;;
esac

# Add vim as default editor
export EDITOR=vim
export TERMINAL=urxvtc
export BROWSER=firefox-aurora
export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'
export TERM=xterm
export LC_ALL=en_US.UTF-8
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=2000

# set pager
#export PAGER=/usr/bin/bash

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Gtk themes 
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xhost +local:root > /dev/null 2>&1

complete -cf sudo
complete -cf man

# Shopt
shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s hostcomplete
shopt -s nocaseglob

# Colour chart
#T='123'   # The test text
#
#echo -e "\n                 40m     41m     42m     43m\
#     44m     45m     46m     47m";
#
#for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
#           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
#           '  36m' '1;36m' '  37m' '1;37m';
#  do FG=${FGs// /}
#  echo -en " $FGs \033[$FG  $T  "
#  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
#    do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
#  done
#  echo;
#done
#echo

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

color_prompt=yes

# Bash Completion
if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

# Alias definitions.
if [ -x ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Function definitions.
if [ -x ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Prompt definitions.
if [ -x ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

## MISC ALIASES ##
#alias sudo="sudo -E"
alias git-pull="git pull origin master"
alias git-push="git push origin master"
alias x="exit"
alias q="exit"
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias vp='vim PKGBUILD'
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias uninstall='sudo pacman -Rs'
alias search='pacman -Ss'
alias show='pacman -Si'
alias need='pacman -Qi'
alias missing='pacman -Qk'
alias trash='pacman -Qdt'
alias orphan='pacman -Rns $(pacman -Qtdq)'
alias record="ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -threads 0 output.mp4"
alias vga="bash /home/pazpi/.screenlayout/VGA1440x900.sh"
alias lvds="bash /home/pazpi/.screenlayout/LVDS1.sh"
alias nfspi="sudo mount -t nfs 192.168.1.190:/media/1TORRHDD /mnt/1TORRHDD"
alias sshpi="ssh pi@pazpi.local"
alias cal="cal -m"
alias tv='mpv dvb://"Italia1 HD"'
alias yotobi="livestreamer twitch.tv/yotobi"
alias :q='exit'
alias :Q='exit'
#alias v='vim'
alias pacman='sudo pacman'
alias HIST='echo > ~/.zsh/.zsh-history'
alias TMP='sudo /bin/rm -rf /tmp/* /tmp/.* &>/dev/null'
alias ls='ls -hF --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias reboot='sudo shutdown -r now'
alias shutdown='sudo shutdown -h now'
alias wifi='sudo wifi-menu wlp3s0'
alias ipwifidown='sudo ip link set wlp3s0 down'
alias ipwifiup='sudo ip link set wlp3s0 up'
alias youtube-wl='mpv -ytdl https://www.youtube.com/playlist?list=PLg-qQC6kJtcM6yLCBg1m-mUYoFRGBJ88g'
alias aurcurl='cd AurPackage && curl -O'
alias 'nvidia-settings'='optirun -b none nvidia-settings -c :8'
alias tty-clock='tty-clock -scC 3'
alias masterpdfeditor="pdfeditor"
alias rock="mpv http://tunein.com/radio/98-ROCK-979-s29726/"
alias bc="bc -l"
alias ram="watch -n 1 cat /proc/meminfo"
# Color man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

## COMPRESSION FUNCTION ##
function compress_() {
   # Credit goes to: Daenyth
   FILE=$1
   shift
   case $FILE in
      *.tar.bz2) tar cjf $FILE $*  ;;
      *.tar.gz)  tar czf $FILE $*  ;;
      *.tgz)     tar czf $FILE $*  ;;
      *.zip)     zip $FILE $*      ;;
      *.rar)     rar $FILE $*      ;;
      *)         echo "Filetype not recognized" ;;
   esac
}

## EXTRACT FUNCTION ##
extract ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# test if a file should be opened normally, or as root (edit)
argc () {
        count=0;
        for arg in "$@"; do
                if [[ ! "$arg" =~ '-' ]]; then count=$(($count+1)); fi;
        done;
        echo $count;
}

v () { if [[ `argc "$@"` > 1 ]]; then vim $@;
                elif [ $1 = '' ]; then vim;
                elif [ ! -f $1 ] || [ -w $1 ]; then vim $@;
                else
                        echo -n "File is Read-only. Edit as root? (Y/n): "
                        read -n 1 yn; echo;
                        if [ "$yn" = 'n' ] || [ "$yn" = 'N' ];
                            then vim $*;
                            else sudo -E vim $*;
                        fi
                fi
            }

fzf-locate() { xdg-open "$(locate "*" | fzf -e -m)" ;}
fzf-filetype() { xdg-open "$(locate ".$1" | fzf -e)" ;}
fzf-playonlinux() { playonlinux --run '$(ls ~/.PlayOnLinux/shortcuts | fzf -e)' ;}            

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - repeat history
fh() {
  eval $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}

# cd and ls in one
cl() {
    dir=$1
    if [[ -z "$dir" ]]; then
        dir=$HOME
    fi
    if [[ -d "$dir" ]]; then
        cd "$dir"
        ls
    else
        echo "bash: cl: '$dir': Directory not found"
    fi
}

f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
bld=$'\e[1m'
rst=$'\e[0m'
inv=$'\e[7m'
#
#
cat << EOF

$rst
 $f3  ▄███████▄                $f1  ▄██████▄    $f2  ▄██████▄    $f4  ▄██████▄    $f5  ▄██████▄    $f6  ▄██████▄    
 $f3▄█████████▀▀               $f1▄$f7█▀█$f1██$f7█▀█$f1██▄  $f2▄█$f7███$f2██$f7███$f2█▄  $f4▄█$f7███$f4██$f7███$f4█▄  $f5▄█$f7███$f5██$f7███$f5█▄  $f6▄██$f7█▀█$f6██$f7█▀█$f6▄
 $f3███████▀      $f7▄▄  ▄▄  ▄▄   $f1█$f7▄▄█$f1██$f7▄▄█$f1███  $f2██$f7█ █$f2██$f7█ █$f2██  $f4██$f7█ █$f4██$f7█ █$f4██  $f5██$f7█ █$f5██$f7█ █$f5██  $f6███$f7█▄▄$f6██$f7█▄▄$f6█
 $f3███████▄      $f7▀▀  ▀▀  ▀▀   $f1████████████  $f2████████████  $f4████████████  $f5████████████  $f6████████████  
 $f3▀█████████▄▄               $f1██▀██▀▀██▀██  $f2██▀██▀▀██▀██  $f4██▀██▀▀██▀██  $f5██▀██▀▀██▀██  $f6██▀██▀▀██▀██
 $f3  ▀███████▀                $f1▀   ▀  ▀   ▀  $f2▀   ▀  ▀   ▀  $f4▀   ▀  ▀   ▀  $f5▀   ▀  ▀   ▀  $f6▀   ▀  ▀   ▀ 
$rst
EOF


# prompt
PS1="\[\e[01;37m\]┌─\[\e[01;37m\][\[\e[01;32m\]\u\[\e[01;37m\]@\h]───[\t]: \w\[\e[01;37m\]\n\[\e[01;37m\]└──\[\e[01;37m\]──╼\[\e[0m\] "
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
