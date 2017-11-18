if [ "$1" == "pc-1"  ]; then
  cd "pc-1" && ./partition.sh
fi

cd ..

pacstrap /mnt base base-devel

genfstab /mnt >> /mnt/etc/fstab

arch-chroot /mnt

timedatectl set-timezone Europe/Moscow

echo -e "asdf" | passwd 

useradd -m -G wheel archie
echo -e "asdf" | passwd archie
echo "archie ALL=(ALL) ALL" >> /etc/sudoers

echo archie > /etc/hostname

sed -i '/^#.*en_US/s/^#//' /etc/locale.gen
locale-gen

pacman -S --noconfirm grub wpa_supplicant dialog

disk="$(df . | tail -n1 | awk '{print $1}')"
disk=${disk%?}

grub-install $disk
mkinitcpio -p linux
grub-mkconfig -o /boot/grub/grub.cfg

exit 

umount /mnt

reboot

