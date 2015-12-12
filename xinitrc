#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
urxvtd -q -f -o

export "XDG_CONFIG_HOME=$HOME/.config"
export "MPD_HOST=192.168.1.190"
export "MPD_PORT=6600"

# setup ssh-agent
# set environment variables if user's agent already exists
SSH_AUTH_SOCK=$(ls -l /tmp/ssh-*/agent.* 2> /dev/null | grep $(whoami) | awk '{print $9}')
SSH_AGENT_PID=$(echo $SSH_AUTH_SOCK | cut -d. -f2)
[ -n "$SSH_AUTH_SOCK" ] && export SSH_AUTH_SOCK
[ -n "$SSH_AGENT_PID" ] && export SSH_AGENT_PID

# start agent if necessary
if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then  # if no agent & not in ssh
  eval `ssh-agent -s` > /dev/null
fi

# setup addition of keys when needed
if [ -z "$SSH_TTY" ] ; then                     # if not using ssh
  ssh-add -l > /dev/null                        # check for keys
  if [ $? -ne 0 ] ; then
    alias ssh='ssh-add -l > /dev/null || ssh-add && unalias ssh ; ssh'
    if [ -f "/usr/lib/ssh/x11-ssh-askpass" ] ; then
      SSH_ASKPASS="/usr/lib/ssh/x11-ssh-askpass" ; export SSH_ASKPASS
    fi
  fi
fi

# xscreensaver -no-splash &
# nitrogen --restore &
# compton -CGb &

# exec i3
exec openbox-session

# session=${1:-openbox}
# case $session in
    # awesome           ) exec awesome;;
    # bspwm             ) sxhkd & exec bspwm;;
    # catwm             ) exec catwm;;
    # cinnamon          ) exec cinnamon-session;;
    # dwm               ) exec dwm;;
    # enlightenment     ) exec enlightenment_start;;
    # ede               ) exec startede;;
    # fluxbox           ) exec startfluxbox;;
    # gnome             ) exec gnome-session;;
    # gnome-classic     ) exec gnome-session --session=gnome-classic;;
    # i3|i3wm           ) exec i3;;
    # icewm             ) exec icewm-session;;
    # jwm               ) exec jwm;;
    # kde               ) exec startkde;;
    # mate              ) exec mate-session;;
    # monster|monsterwm ) exec monsterwm;;
    # notion            ) exec notion;;
    # openbox           ) exec openbox-session;;
    # unity             ) exec unity;;
    # xfce|xfce4        ) exec startxfce4;;
    # xmonad            ) exec xmonad;;
    # # No known session, try to run it as command
    # *) exec $1;;
# esac

