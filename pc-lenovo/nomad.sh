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

pacman -S --noconfirm refind-efi wpa_supplicant dialog

mkdir -p /boot/EFI/Boot/
cp /usr/share/refind/refind_x64.efi /boot/EFI/Boot/bootx64.efi
cp -r /usr/share/refind/drivers_x64/ /boot/EFI/Boot/
echo 'extra_kernel_version_strings linux-git,linux-lts,linux; timeout -1' > /boot/EFI/Boot/refind.conf
refind-install

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

mkdir -p '/home/archie/.config/sublime-text-3/Installed Packages/'; \
cd '/home/archie/.config/sublime-text-3/Installed Packages/'; \
wget https://packagecontrol.io/Package%20Control.sublime-package; \
mkdir -p /home/archie/.config/sublime-text-3/Packages/User/; \
cd /home/archie/Git/sublime-text-3/configs; \
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
rm -rf /home/archie/Git/atom
rm -rf /home/archie/Git/sublime-text-3
rm -rf /home/archie/Git/vim-arch-linux

rm $0

exit 
