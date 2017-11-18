### Shortcuts:

#### rTorrent:
1. `Ctrl-D` - Stop an active download or remove a stopped download.
2. `Ctrl-S` - Start download. Runs hash first unless already done.

#### MOC:
1. `X` - Toggle AutoNext option.
2. `R` - Toggle repeat.
3. `n` - play next track.
4. `b` - play previous track.

#### TMux:
1. `Ctrl + b` + `c` - Create a new window.
2. `Ctrl + b` + `p` / `n` - Previous/next window.
3. `Ctrl + b` + `%` / `"` - Split vertically/horizontally.
4. `Ctrl + b` + <arrow_key> - Move between panes.
5. `Ctrl + b` + `x` - Close current pane.
6. `Ctrl + b` + `&` - Close current window.
7. `Ctrl + b` + `[` - Scroll mode (Arrow keys to scroll and `q` to exit scroll mode).

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
9. Set locales:
    1. `nano /etc/locale.gen` and uncomment two lines with "en_US" in the beginning.
    2. `locale-gen`.
11. `echo arch > /etc/hostname`.
12. `pacman -S grub dialog wpa_supplicant`.
12. If you use dual boot, run: `pacman -S os-prober && os-prober`.
13. `grub-install /dev/sda`.
15. `mkinitcpio -p linux`.
16. `grub-mkconfig -o /boot/grub/grub.cfg`.
17. `exit`.
19. `umount /mnt`.
20. `reboot`.

### Essential packages:
Official: `xorg-server xorg-xinit xterm i3 dmenu gvim git xclip feh xbindkeys scrot gksu dunst alsa-utils vifm xorg-xprop vlc moc rtorrent p7zip unrar viewnior ffmpeg gpick chromium rsync bash-completion wget xorg-xrandr zathura zathura-pdf-mupdf zathura-djvu`.

*AUR*: `xkblayout-state dunstify dropbox i3lock-color-git`.

### Semiuseful packages:
1. `recordmydesktop` - (AUR) CLI screen recorder.
2. `conky` - Shows system stats on the desktop.
3. `openbox` - Window DE.

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

### Add to PATH:
`export PATH=$PATH:<new_path>`.

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

### Change Default Shell:
1. List all installed shells: `chsh -l`.
2. Change shell: `chsh -s <path>`.
3. Reboot.

### Restart ALSA:
`alsactl kill rescan`.

### Resize `/tmp` Until Next Boot:
`mount -o remount,size=30G,noatime /tmp`.

### Haskell Installation:
Install packages: `ghc ghc-static cabal-install stack haskell-haddock-library alex happy`.

### Write ISO to USB:
`dd bs=4M if=/path/to/image.iso of=/dev/sdx status=progress && sync`.

### Virtual Box Installation:
1. `sudo pacman -S virtualbox linux-headers`.
2. Enable modules: `sudo modprobe -a vboxdrv`.
3. Enable modules at startup: `sudo vim /etc/modules-load.d/virtualbox.conf`. Write down and save: `vboxdrv`.

If `Error -610` occured, try: `sudo chown root:root /usr` and `sudo chown root:root /usr/lib`.

**Enable USB Support:**
1. Install extensions: `yaourt -S virtualbox-ext-oracle`.
2. Add yourself to VirtualBox group: `sudo gpasswd -a archie vboxusers`. Restart may be required.
3. Open VirtualBox and shutdown all machines. Got to: Machine > Settings > USB and enable USB 3.0 or 2.0 support. Add new filter for your USB flash.

**Install Guest Additions:** Click on: Devices > Insert Guest Additions... Install guest additions on virtual OS.

### Edit CMake Config:
1. `ccmake <project_folder>`.
2. Press `c` to start configuring.
3. As you finish press `g` to generate makefile.

### Compile C Program:
Using 4 cores: `make -j4`.

### Setup Static IP:
1. Copy example from `/etc/netctl/examples` to `/etc/netctl` (for example `ethernet-static`).
2. Rename this copied file to interface name, founded by executing: `ip link` (for example `enp0s31f6`).
3. Configure this file as you needed.

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
1. Install: `sudo packman -S python-setuptools python-eyed3 id3v2`.
2. Execute: `id3v2 -D *.mp3 && eyeD3 --remove-all-images * *.mp3`.

### Animated Wallpapers:
1. Install: `sudo pacman -S mpv`.
2. Run: `mpv --no-audio --loop=inf --wid=0 --vo=opengl --hwdec=auto-copy ~/Backgrounds/dynamic.mp4` or `mpv --no-audio --loop-playlist=inf --wid=0 ~/Backgrounds/dynamic.mp4`.
3. Possibly add command above to `~/.config/i3/config` for autostart.


