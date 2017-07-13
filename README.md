### Restore configurations:
1. Clone this repository.
2. Make all binaries executable by the command: ```sudo chmod uog+rwx *``` (while you are in the ```copy/usr/bin/``` directory).
3. Copy all files and folder and preserve ownerships: ```sudo cp -a * /``` (while in the ```copy/``` directory).

### Write ISO to USB:
```dd bs=4M if=/path/to/image.iso of=/dev/sdx status=progress && sync```.

### Virtual Box Installation:
1. ```sudo pacman -S virtualbox```.
2. Enable modules: ```sudo modprobe -a vboxdrv```.
3. Enable modules at startup: ```sudo vim /etc/modules-load.d/virtualbox.conf```. Write down and save: ```vboxdrv```.

### Removing Tags and Images from MP3:
1. Install: ```sudo packman -S python-eyed3``` and ```sudo pacman -S id3v2```.
2. Execute: ```id3v2 -D *.mp3``` and ```eyeD3 --remove-all-images * *.mp3```.
