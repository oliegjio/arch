DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

###
# PARTITIONING:
###

cd $DIR

sfdisk /dev/sda < partitions.table

mkfs.msdos -F 32 /dev/sda1
mkfs.ext4 -F /dev/sda3

mkswap /dev/sda2
swapon /dev/sda2

mount /dev/sda3 /mnt

###
# SYSTEM INSTALLATION:
###

pacstrap /mnt base base-devel

mount /dev/sda1 /mnt/boot

genfstab /mnt >> /mnt/etc/fstab

cp $DIR/nomad.sh /mnt/

arch-chroot /mnt ./nomad.sh

umount /mnt

reboot
