### Shortcuts:

#### rTorrent:
1. `Ctrl-D` - Stop an active download or remove a stopped download.
2. `Ctrl-S` - Start download. Runs hash first unless already done.

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
18. `genfstab /mnt >> /mnt/etc/fstab`.
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
12. `pacman -S grub os-prober dialog wpa_supplicant`.
13. `grub-install /dev/sda`.
14. `os-prober`.
15. `mkinitcpio -p linux`.
16. `grub-mkconfig -o /boot/grub/grub.cfg`.
17. `exit`.
19. `umount /mnt`.
20. `reboot`.

### Essential packages:
Packages: `xorg-server xorg-xinit xterm i3 dmenu gvim git xclip feh xbindkeys scrot gksu dunst alsa-utils vifm xorg-xprop vlc moc rtorrent p7zip unrar viewnior ffmpeg gpick chromium rsync bash-completion wget`.

Before *AUR* run: `sudo pacman -Rns i3lock`.

*AUR*: `xkblayout-state dunstify i3lock-color-git dropbox`.

### Other packages:
1. `recordmydesktop` - (AUR) CLI screen recorder.
2. `conky` - Shows system stats on the desktop.
3. `openbox` - Window DE.

Other packages: `npm python python2 python-pip python2-pip qt5`.

### Restore configurations:
1. Clone this repository.
2. Copy all files and folder and preserve ownerships, excluding Git files: `sudo rsync -a -C --exclude=".gitkeep" * /` (while in the `copy/` directory).
3. Configure this files as needed: `~/.xbindkeys`, `~/.i3status.conf`.

------

### Install Tor Browser:
1. `gpg --keyserver pool.sks-keyservers.net --recv-keys 0x4E2C6E8793298290`.
2. `yaourt -S tor-browser-en`.

### Install YAOURT:
1. `git clone https://aur.archlinux.org/package-query`.
2. `git clone https://aur.archlinux.org/yaourt`.
3. And then cd to package-query and the yaourt directories and execute: `makepkg -sri`.

### Enable Screen Lock Before Sleep:
`sudo systemctl enable i3lock-autorun.service`

### Configure Trackpad:
1. Install: `sudo pacman -S xf86-input-synaptics`.
2. Configs already in this backup in: `/etc/X11/xorg.conf.d/70-synaptics.conf`.

### Laptop Optimization:
1. Install: `sudo pacman -S hdparm`.
2. Execute: `sudo hdparm -B 1 /dev/sda`, `sudo hdparm -S 1 /dev/sda`, `sudo hdparm -M /dev/sda`.
3. Install: `sudo pacman -S cpupower`.
4. Execute: `sudo systemctl start cpupower.service` and `sudo systemctl enable cpupower.service`.

### Fix Time:
Run in Windows from Administrator Command Prompt: `reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f`.

If `/etc/zoneinfo` was removed, refresh it with: `ln -s /usr/share/zoneinfo/Europe/Moscow /etc/zoneinfo`.

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

### Resize `/tmp` Until Next Boot:
`mount -o remount,size=30G,noatime /tmp`.

### Write ISO to USB:
`dd bs=4M if=/path/to/image.iso of=/dev/sdx status=progress && sync`.

### Virtual Box Installation:
1. `sudo pacman -S virtualbox linux-headers`.
2. Enable modules: `sudo modprobe -a vboxdrv`.
3. Enable modules at startup: `sudo vim /etc/modules-load.d/virtualbox.conf`. Write down and save: `vboxdrv`.

If `Error -610` occured, try: `sudo chown root:root /usr` and `sudo chown root:root /usr/lib`.

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

### Convert between MBR and GPT:
1. From MBR to GPT: `sudo sgdisk -g /dev/sda`.
2. From GPT to MBR: `sudo sgdisk -m /dev/sda`.

### Removing Tags and Images from MP3:
1. Install: `sudo packman -S python-eyed3 id3v2`.
2. Execute: `id3v2 -D *.mp3 && eyeD3 --remove-all-images * *.mp3`.

If module `pkg_resources` wasn't found, try to install: `sudo pacman -S python-setuptools`.

### Animated Wallpapers:
1. Install: `sudo pacman -S mpv`.
2. Run: `mpv --no-audio --loop=inf --wid=0 --vo=opengl --hwdec=auto-copy ~/Backgrounds/dynamic.mp4` or `mpv --no-audio --loop-playlist=inf --wid=0 ~/Backgrounds/dynamic.mp4`.
3. Possibly add command above to `~/.config/i3/config` for autostart.


