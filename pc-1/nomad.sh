###
# BASE INSTALLATION:
###

chpasswd <<< "root:asdf"

useradd -m -G wheel archie
chpasswd <<< "archie:asdf"
echo "archie ALL=(ALL) ALL" >> /etc/sudoers

echo "Cmnd_Alias PACMAN = /usr/bin/pacman, /usr/bin/yaourt" >> /etc/sudoers
echo "%wheel ALL=(ALL) NOPASSWD: PACMAN" >> /etc/sudoers

echo archie > /etc/hostname

sed -i '/^#.*en_US/s/^#//' /etc/locale.gen
locale-gen

pacman -S --noconfirm grub wpa_supplicant dialog

disk="$(df . | tail -n1 | awk '{print $1}')"
disk=${disk%?}

grub-install $disk
mkinitcpio -p linux
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd

###
# USER ENVIRONMENT INSTALLATION:
###

pacman -S --noconfirm xorg-server xorg-xinit xterm i3 dmenu gvim git xclip feh xbindkeys scrot dunst alsa-utils vifm xorg-xprop vlc moc rtorrent p7zip unrar viewnior ffmpeg gpick chromium rsync bash-completion wget xorg-xrandr zathura zathura-pdf-mupdf zathura-djvu
pacman -S --noconfirm nodejs python python-pip python2 python2-pip atom gimp
pacman -Rns --noconfirm i3lock

su -c "\
mkdir -p /home/archie/Git; \
cd /home/archie/Git; \

git clone https://github.com/oliegjio/arch-linux; \
git clone https://github.com/oliegjio/sublime-text-3; \
git clone https://github.com/oliegjio/atom; \
git clone --recursive https://github.com/oliegjio/vim-arch-linux; \
git clone https://aur.archlinux.org/yaourt; \
git clone https://aur.archlinux.org/package-query; \

cd package-query; \
makepkg -sri --noconfirm; \
cd ..; \

cd yaourt; \
makepkg -sri --noconfirm; \
cd ..; \

yaourt -S --noconfirm xkblayout-state dunstify dropbox i3lock-color-git sublime-text-dev; \

cd sublime-text-3/configs; \
cp * /home/archie/.config/sublime-text-3/Packages/User/; \
cd ../..; \

cd atom/configs; \
cp * /home/archie/.atom/; \
apm install --packages-file /home/archie/.atom/packages.list; \
cd ../..; \
" archie

cd /home/archie/Git

cd arch-linux/pc-1/configs
rsync -a -C --exclude=".gitkeep" * /
cd ../../..

cd arch-linux/general
rsync -a -C --exclude=".gitkeep" * /
cd ../..

cd vim-arch-linux
./install.sh
cd ..

###
# FINISHING:
###

rm -rf /home/archie/Git/yaourt
rm -rf /home/archie/Git/package-query

rm $0

exit 
