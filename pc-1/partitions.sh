sfdisk /dev/sda < table.txt

mkfs.ext4 -F /dev/sda2

mkswap /dev/sda1
swapon /dev/sda1

mount /dev/sda2 /mnt
