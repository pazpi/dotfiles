# alias git-pull="git pull origin master"
# alias git-push="git push origin master"
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
#alias nfspi="sudo mount -t nfs 192.168.1.190:/media/1TORRHDD /mnt/1TORRHDD"
alias nfspi="sudo mount -t nfs archpi.local:/srv/nfs4/1TORRHDD /mnt/1TORRHDD"
alias winmount="sudo mount /dev/sda3 /mnt/Windows"
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
alias youtube-wl="mpv -ytdl https://www.youtube.com/playlist\?list=PLg-qQC6kJtcM6yLCBg1m-mUYoFRGBJ88g"
alias youtube-max='youtube-dl -f bestvideo+bestaudio '
alias youtube-dl-wl='cd ~/Videos/WatchLater && youtube-dl https://www.youtube.com/playlist\?list=PLg-qQC6kJtcM6yLCBg1m-mUYoFRGBJ88g -o "%(upload_date)s-%(title)s.%(ext)s"'
alias aurcurl='cd AurPackage && curl -O'
alias 'nvidia-settings'='optirun -b none nvidia-settings -c :8'
alias tty-clock='tty-clock -scC 3'
alias rock="mpv http://tunein.com/radio/98-ROCK-979-s29726/"
alias bc="bc -l"
alias ram="watch -n 1 cat /proc/meminfo"
alias serveThis="php -S localhost:8080"
alias rtorrent="screen -m -fa -S rtorrent /usr/bin/rtorrent"
alias matlab="screen -m -fa -S matlab /usr/local/bin/matlab"
alias packlist="pacman -Qe | awk '{print $1}'"
alias ranger='TERM=xterm-256color ranger'
alias bot='cd ~/Projects/Eclipse-workspace/ruTorrent-bot && source env/bin/activate'
alias battery='upower -i `upower -e | grep 'BAT'`'
alias 1080p='sh ~/.screenlayout/HDMI1920x1080.sh'
alias ssh-tunnel='ssh -D 5000 -N at-nas-pi'
#
# Use colors in coreutils utilities output
# alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
# alias cp='cp -i'
# alias mv='mv -i'

# Update dotfiles
function dfu() {
    (
        cd ~/Projects/dotfiles && git pullff && ./install -q
    )
}

# Get total duration of video in a directory (recursive)
function getDuration() {
    echo "Only mp4 file"
    find . -iname '*.mp4' -exec ffprobe -v quiet -of csv=p=0 -show_entries format=duration {} \; | paste -sd+ -| bc
}

# Use pip without requiring virtualenv
function syspip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# cd to git root directory
# alias cdgr='cd "$(git root)"'

# Create a directory and cd into it
function mcd() {
    mkdir "${1}" && cd "${1}"
}

# Jump to directory containing file
function jump() {
    cd "$(dirname ${1})"
}

# cd replacement for screen to track cwd (like tmux)
function scr_cd()
{
    builtin cd $1
    screen -X chdir $PWD
}

if [[ -n $STY ]]; then
    alias cd=scr_cd
fi

# Go up [n] directories
function up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for i in {1..${1}}; do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
function in() {
    (
        cd ${1} && shift && ${@}
    )
}

# Open vim in a smart way
v () { if [[ `argc "$@"` > 1 ]]; then vim $@;
                elif [ $1 = '' ]; then vim;
                elif [ ! -f $1 ] || [ -w $1 ]; then vim $@;
                else
                        echo -n "File is Read-only. Edit as root? (Y/n): "
                        read yn; echo;
                        if [ "$yn" = 'n' ] || [ "$yn" = 'N' ];
                            then vim $*;
                            else sudo -E vim $*;
                        fi
                fi
            }

# Check if a file contains non-ascii characters
function nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' ${1}
}

# fzf-shortcut
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

# Mirror a website
alias mirrorsite='wget -m -k -K -E -e robots=off'

# fh - repeat history
fh() {
  eval $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed 's/ *[0-9]* *//')
}
