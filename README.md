### Virtual Box Installation:
1. ```sudo pacman -S virtualbox```.
2. Enable modules: ```sudo modprobe -a vboxdrv```.
3. Enable modules at startup: ```sudo vim /etc/modules-load.d/virtualbox.conf```. Write down and save: ```vboxdrv```.
