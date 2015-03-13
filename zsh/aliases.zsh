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
alias youtube-max='youtube-dl -f bestvideo+bestaudio '
alias aurcurl='cd AurPackage && curl -O'
alias 'nvidia-settings'='optirun -b none nvidia-settings -c :8'
alias tty-clock='tty-clock -scC 3'
alias masterpdfeditor="pdfeditor"
alias rock="mpv http://tunein.com/radio/98-ROCK-979-s29726/"
alias bc="bc -l"
alias ram="watch -n 1 cat /proc/meminfo"
#
# Use colors in coreutils utilities output
# alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Update dotfiles
function dfu() {
    (
        cd ~/.dotfiles && git pullff && ./install -q
    )
}

# Use pip without requiring virtualenv
function syspip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# cd to git root directory
alias cdgr='cd "$(git root)"'

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

# Check if a file contains non-ascii characters
function nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' ${1}
}

# Mirror a website
alias mirrorsite='wget -m -k -K -E -e robots=off'
