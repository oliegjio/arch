DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

$DIR/partitions.sh

pacstrap /mnt base base-devel

genfstab /mnt >> /mnt/etc/fstab

cp $DIR/nomad.sh /mnt/

arch-chroot /mnt ./nomad.sh

umount /mnt

reboot
