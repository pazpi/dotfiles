#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

export OCIO="/usr/share/OpenColorIO-Configs/blender/config.ocio"
eval $(ssh-agent)
