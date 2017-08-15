##### TODO:
1. Grub Windows entry.
2. Wifi autostart.
3. Additional keybindings.
4. Change grub menu entries order.

### Install Arch Linux:
1. `fdisk -l`.
2. `cfdisk /dev/sda`.
    1. Create primary partition with boot flag and Linux file system (ID - 83).
    2. Create primary partition with Linux swap file system (ID - 82).
3. `mkfs.ext4 /dev/sda3`.
4. Create SWAP:
    1. `mkswap /dev/sda4`.
    2. `swapon /dev/sda4`.
5. `mount /dev/sda3 /mnt`.
5. If you have a wireless connection, run: `wifi-menu`.
6. `pacstrap /mnt base base-devel`.
7. `arch-chroot /mnt`.
8. Creating default user:
    1. `passwd`.
    2. `useradd -m -G wheel archie`.
    3. `passwd archie`.
    4. `nano /etc/sudoers` and add: `archie ALL=(ALL) ALL`.
9. Configure locales:
    1. `nano /etc/locale.gen` and uncomment two lines with "en_US" in the beginning.
    2. `locale-gen`.
10. Configure time zone:
    1. `rm /etc/localtime`.
    2. `ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime`.
11. `echo arch > /etc/hostname`.
12. `pacman -S grub os-prober`.
12. If you use wireless connection, also run: `pacman -S dialog wpa_supplicant`.
13. `grub-install /dev/sda`.
14. `os-prober`.
15. `mkinitcpio -p linux`.
16. `grub-mkconfig -o /boot/grub/grub.cfg`.
17. `exit`.
18. `genfstab /mnt >> /mnt/etc/fstab`.
19. `umount /mnt`.
20. `reboot`.

### Restore configurations:
1. Clone this repository.
2. Make all binaries executable and readable by the command: `sudo chmod uog+rx *` (while you are in the `copy/usr/bin/` directory).
3. Copy all files and folder and preserve ownerships: `sudo cp -a * /` (while in the `copy/` directory).

### Install YAOURT:
1. `git clone https://aur.archlinux.org/package-query`.
2. `git clone https://aur.archlinux.org/yaourt`.
3. And then cd to package-query and the yaourt directories and execute: `makepkg -sri`.

### Essential packages:
`xorg-server xorg-xinit xterm i3 dmenu gvim git xclip feh xbindkeys scrot gksu dunst alsa-utils vifm xorg-xprop openbox`.

AUR: `xkblayout-state dunstify`

### Useful packages:
1. `vlc` - Media player.
2. `rtorrent` - CLI torrent client.
3. `p7zip unrar` - CLI archivers.
4. `viewnior` - View images.
5. `ffmpeg` - CLI video editor.
6. `recordmydesktop` - (AUR) CLI screen recorder.
7. `gpick` - Color picker.
8. `conky` - Shows system stats on the desktop.

------

### Enable Wi-Fi on boot:
1. After using `sudo wifi-menu` you will have profile generated in: `/etc/netctl/`, open this directory.
2. Run: `sudo netctl start <PROFILE_NAME>` and `sudo netctl enable <PROFILE_NAME>`.

### Change Boot Order in Grub Menu:
1. Open `/etc/default/grub` and change `GRUB_DEFAULT=0` to `GRUB_DEFAULT=saved`.
2. Update grub: `sudo grub-mkconfig -o /boot/grub/grub.cfg`.
3. Change default boot entry (starts from 0): `sudo grub-set-default 2`.

### If OS-Prober Didn't Help:
This solution is for BIOS-MBR installation. Open `/boot/grub/grub.cfg` and add:

```
menuentry "Windows" {
    insmod part_msdos
    insmod ntfs
    insmod search_fs_uuid
    insmod ntldr     
    search --fs-uuid --set=root --hint-bios=hd0,msdos1 --hint-efi=hd0,msdos1 --hint-baremetal=ahci0,msdos1 $UUID
    ntldr /bootmgr
  }
  ```
  
  `$UUID` can be found by executing: `blkid`.

### Write ISO to USB:
`dd bs=4M if=/path/to/image.iso of=/dev/sdx status=progress && sync`.

### Virtual Box Installation:
1. `sudo pacman -S virtualbox`.
2. Enable modules: `sudo modprobe -a vboxdrv`.
3. Enable modules at startup: `sudo vim /etc/modules-load.d/virtualbox.conf`. Write down and save: `vboxdrv`.

### LAMP Stack Installation:
1. Install Apache: `sudo pacman -S apache`.
    1. Apache configuration file located in: `/etc/httpd/conf/httpd.conf`.
    2. Global serve directory: `/srv/http/`.
    3. Per-user serve directory: `~/public_html`.
    4. `~/public_html` directory and user's directory must have read-execute rights.
2. Install PHP: `sudo pacman -S php php-apache`.
3. Configure Apache in `/etc/httpd/conf/httpd.conf`:
    1. Comment line `LoadModule mpm_event_module modules/mod_mpm_event.so`.
    1. Uncomment line `LoadModule mpm_prefork_module modules/mod_mpm_prefork.so`.
    1. Uncomment line with `LoadModule rewrite_module`.
    2. Place this line `LoadModule php7_module modules/libphp7.so` and this line `AddHandler php7-script php` at the end of `LoadModule` list.
    1. Add `Options All`, `Order allow,deny` and `allow from all` to `<Directory />`.
    1. Change `AllowOverride None` to `AllowOverride All` in `<Directory />`.
    1. Change `Require all denied` to `Require all granted` in `<Directory />`.
    1. Comment sections with: `<Directory "/srv/http">` and `<Directory "/srv/http/cgi-bin">`.
    3. Place this: `Include conf/extra/php7_module.conf` at the end of `Include` list.
    4. Restart Apache: `sudo systemctl restart httpd.service`.
1. Configure PHP in `/etc/php/php.ini`:
    1. Uncomment line with `extension=mysqli.so`.
    2. Uncomment line with `extension=pdo_mysql.so`.
4. Install MySQL/MariaDB: `sudo pacman -S mariadb`.
    1. Before running MariaDB, run: `sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql`.
    2. Run MariaDB: `sudo systemctl start mariadb.service`.
5. To start Apache: `sudo systemctl start httpd.service`.

### Removing Tags and Images from MP3:
1. Install: `sudo packman -S python-eyed3` and `sudo pacman -S id3v2`.
2. Execute: `id3v2 -D *.mp3` and `eyeD3 --remove-all-images * *.mp3`.

### Shortcuts:
#### ViFM:
1. `Ctrl+G` - Show detailed information about the file.
2. `t` - Multi-select.
