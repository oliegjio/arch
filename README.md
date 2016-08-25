### Where to place files:
+ `.i3status.conf` - /home/archie/
+ `.xbindkeysrc` - /home/archie/
+ `.xinitrc` - /home/archie/
+ `xorg.conf` - /etc/X11/
+ `microphone-toggle-notify` - /bin/
+ `rootrun` - /bin/
+ `.i3/` - /home/archie/
+ `custom-i3status` - /bin/

### Autostart program/script:
`vim /etc/systemd/system/< service_name >.service`
```txt
[Unit]
Description="< service_description >"

[Service]
ExecStart=< path_to_executable >

[Install]
WantedBy=multi-user.target
```
