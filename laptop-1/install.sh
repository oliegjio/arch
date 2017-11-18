#!/bin/bash

pacman -S --noconfirm xorg-server xorg-xinit xterm i3 dmenu gvim git xclip feh xbindkeys scrot gksu dunst alsa-utils vifm xorg-xprop vlc moc rtorrent p7zip unrar viewnior ffmpeg gpick chromium rsync bash-completion wget xorg-xrandr zathura zathura-pdf-mupdf zathura-djvu

git clone --recursive https://github.com/oliegjio/vim
git clone https://aur.archlinux.org/yaourt
git clone https://aur.archlinux.org/package-query

cd package-query
makepkg -sri --noconfirm

cd ../yaourt
makepkg -sri --noconfirm

cd ..

pacman -Rns --noconfirm i3lock
su -c "yaourt -S --noconfirm xkblayout-state dunstify dropbox i3lock-color-git" archie

cd configs
rsync -a -C --exclude=".gitkeep" * /

cd ../../general
rsync -a -C --exclude=".gitkeep" * /

cd ../laptop-1/vim/vim80
./install.sh

systemctl enable i3lock-on-sleep.service

chmod uog+rwx -R /sys/class/backlight/intel_backlight

reboot
