#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd $DIR

pacman -S --noconfirm xorg-server xorg-xinit xterm i3 dmenu gvim git xclip feh xbindkeys scrot gksu dunst alsa-utils vifm xorg-xprop vlc moc rtorrent p7zip unrar viewnior ffmpeg gpick chromium rsync bash-completion wget xorg-xrandr zathura zathura-pdf-mupdf zathura-djvu

git clone --recursive https://github.com/oliegjio/vim
git clone https://aur.archlinux.org/yaourt
git clone https://aur.archlinux.org/package-query

cd $DIR/package-query
makepkg -sri --noconfirm

cd $DIR/yaourt
makepkg -sri --noconfirm

pacman -Rns --noconfirm i3lock
su -c "yaourt -S --noconfirm xkblayout-state dunstify dropbox i3lock-color-git" archie

cd $DIR/configs
rsync -a -C --exclude=".gitkeep" * /

cd $DIR/../general
rsync -a -C --exclude=".gitkeep" * /

cd $DIR/vim/vim80
./install.sh

reboot
