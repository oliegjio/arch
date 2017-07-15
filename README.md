### Install Arch Linux:
1. ```fdisk -l```.
2. ```cfdisk /dev/sda```.
    1. Create primary partition with boot flag and Linux file system (ID - 83).
    2. Create primary partition with Linux swap file system (ID - 82).
3. ```mkfs.ext4 /dev/sda3```.
4. Create SWAP:
    1. ```mkswap /dev/sda4```.
    2. ```swapon /dev/sda4```.
5. ```mount /dev/sda3 /mnt```.
6. ```pacstrap /mnt base base-devel```.
7. ```arch-chroot /mnt```.
8. Creating default user:
    1. ```passwd```.
    2. ```useradd -m -G wheel archie```.
    3. ```passwd archie```.
    4. ```nano /etc/sudoers``` and add: ```archie ALL=(ALL) ALL```.
9. Configure locales:
    1. ```nano /etc/locale.gen``` and uncomment two lines with "en_US" in the beginning.
    2. ```locale-gen```.
10. Configure time zone:
    1. ```rm /etc/localtime```.
    2. ```ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime```.
11. ```echo arch > /etc/hostname```.
12. ```pacman -S grub os-prober```.
13. ```grub-install /dev/sda```.
14. ```os-prober```.
15. ```mkinitcpio -p linux```.
16. ```grub-mkconfig -o /boot/grub/grub.cfg```.
17. ```exit```.
18. ```genfstab /mnt >> /mnt/etc/fstab```.
19. ```umount /mnt```.
20. ```reboot```.

### Installing i3:
1. Login with non-root (archie) user account.
2. ```sudo pacman -S xorg-server xorg-xinit xterm i3 dmenu gvim```.
3. ```vim /home/archie/.xinitrc``` and write: ```exec i3```.
4. ```reboot```.

### Essential packages:
```git xclip feh xbindkeys scrot gksu dunst alsautils```.

### Useful packages:
1. ```parole gst-libav gst-plugins-ugly gst-plugins-bad gst-plugins-base``` - Media player.
2. ```rtorrent``` - CLI torrent client.
3. ```p7zip unrar``` - CLI archivers.
4. ```viewnior``` - View images.

### Restore configurations:
1. Clone this repository.
2. Make all binaries executable by the command: ```sudo chmod uog+rwx *``` (while you are in the ```copy/usr/bin/``` directory).
3. Copy all files and folder and preserve ownerships: ```sudo cp -a * /``` (while in the ```copy/``` directory).

### Install YAOURT:
1. ```git clone https://aur.archlinux.org/package-query```.
2. ```git clone https://aur.archlinux.org/yaourt```.
3. And then cd to package-query and the yaourt directories and execute: ```makepkg -sri```.

### Write ISO to USB:
```dd bs=4M if=/path/to/image.iso of=/dev/sdx status=progress && sync```.

### Virtual Box Installation:
1. ```sudo pacman -S virtualbox```.
2. Enable modules: ```sudo modprobe -a vboxdrv```.
3. Enable modules at startup: ```sudo vim /etc/modules-load.d/virtualbox.conf```. Write down and save: ```vboxdrv```.

### Removing Tags and Images from MP3:
1. Install: ```sudo packman -S python-eyed3``` and ```sudo pacman -S id3v2```.
2. Execute: ```id3v2 -D *.mp3``` and ```eyeD3 --remove-all-images * *.mp3```.
