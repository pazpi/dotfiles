#!/bin/bash

declare -A links=(
    # File
    [bashrc]=~/.bashrc
    [conkyrc]=~/.conkyrc
    [conkyCLOCK]=~/.conkyCLOCK
    [conkyMPD]=~/.conkyMPD
    [i3blocks.conf]=~/.i3blocks.conf
    [rtorrent.rc]=~/.rtorrent.rc
    [screenrc]=~/.screenrc
    [vimrc]=~/.vimrc
    [xinitrc]=~/.xinitrc
    [Xresource]=~/.Xresource
    [zpreztorc]=~/.zpreztorc
    [zshrc]=~/.zshrc
    # Directory
    [dunst]=~/.config/dunst
    [bin]=~/.bin
    [i3]=~/.config/i3
    [mpd]=~/.config/mpd
    [mpv]=~/.config/mpv
    [ncmpcpp]=~/.ncmpcpp
    [openbox]=~/.config/openbox
    [ranger]=~/.config/ranger
    [terminator]=~/.config/terminator
    [tint2]=~/.config/tint2
    [zsh]=~/.zsh
)

mode=$1
if [ "$mode" = "clean" ]; then
    echo "Removing links:"
    for i in "${!links[@]}"
    do
        echo "rm ${!links[$i]}"
        rm ${links[$i]}
    done
else
    echo "creating new links:"
    for i in "${!links[@]}"
    do
        if [ ! -h  "${links[$i]}" ]
        then
            echo "$PWD/$i -> ${links[$i]}"
            ln -s $PWD/$i ${links[$i]}
        fi
    done
fi
