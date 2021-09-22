#!/bin/bash

mkdir -p bash
cp ~/.bash_history bash/bash_history
cp ~/.bashrc bash/bashrc
cp ~/.inputrc bash/inputrc
cp ~/.profile bash/profile


mkdir -p tmux
cp ~/.tmux.conf tmux/tmux.conf

mkdir -p ahk
cp -r '/mnt/c/Users/cen/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/AHK' ahk/
cp '/mnt/c/Users/cen/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/autohotkey.ahk' ahk/

mkdir -p ssh
cp -r ~/.ssh/config ssh/

mkdir -p vim
cp -r ~/.vimrc vim/vimrc

mkdir -p vpn/openvpn
cp -r ~/VPN/openvpn/*.ovpn vpn/openvpn/
cp -r ~/VPN/openvpn/*.sh vpn/openvpn/

mkdir -p vpn/openconnect
cp ~/VPN/openconnect/* vpn/openconnect/ 
