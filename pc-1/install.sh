DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

###
# PARTITIONING:
###

cd $DIR

sfdisk /dev/sda < partitions.table

mkfs.ext4 -F /dev/sda2

mkswap /dev/sda1
swapon /dev/sda1

mount /dev/sda2 /mnt

###
# SYSTEM INSTALLATION:
###

pacstrap /mnt base base-devel

genfstab /mnt >> /mnt/etc/fstab

cp $DIR/nomad.sh /mnt/

arch-chroot /mnt ./nomad.sh

umount /mnt

reboot
