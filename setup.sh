#!/bin/bash

declare -A links=(
    # File
    [bashrc]=~/.bashrc
    [conkyrc]=~/.conkyrc
    [i3blocks.conf]=~/.i3blocks.conf
    [rtorrent.rc]=~/.rtorrent.rc
    [screenrc]=~/.screenrc
    [vimrc]=~/.vimrc
    [xinitrc]=~/.xinitrc
    [Xresources]=~/.Xresources
    [zpreztorc]=~/.zpreztorc
    [zshrc]=~/.zshrc
    # Directory
    [dunst]=~/.config/dunst
    [bin]=~/.bin
    [i3]=~/.config/i3
    [img]=~/.background
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
elif [ "$mode" = "new" ]; then
    echo "New installation:"
    for i in "${!links[@]}"
    do
        if [ ! -h  "${links[$i]}" ]
        then
            echo "$PWD/$i -> ${links[$i]}"
            ln -s $PWD/$i ${links[$i]}
        fi
    done
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "Install minimun package:"
    echo "Please run as root:"
    echo "pacman -S `cat package-list.txt`"
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
