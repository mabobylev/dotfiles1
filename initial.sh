#!/bin/sh

#записать образ на USB Flash drive
dd bs=4M if=archlinux-2013.02.01-dual.iso of=/dev/sdx status=progress && sync

loadkeys ruwin_cplk-UTF-8
setfont UniCyr_8x16
systemctl start dhcpcd.service

mkfs -t ext2 -L Boot /dev/sda1
mkfs -t ext4 -L Root /dev/sda2
mkfs -t ext4 -L Home /dev/sda3

mount /dev/sda2 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
mount /dev/sda3 /mnt/home
#dd if=/dev/zero of=/mnt/swapfile bs=1G count=4
fallocate -l 4G /mnt/swapfile
mkswap /mnt/swapfile

genfstab -U /mnt >> /mnt/etc/fstab
echo "/swapfile    none    swap    sw    0    0" >> /mnt/etc/fstab
echo "tmpfs	/tmp	tmpfs	defaults,noatime,mode=1777 0 0" >> /mnt/etc/fstab

pacstrap /mnt base base-devel vim grub zsh sudo
arch-chroot /mnt
vim /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/Europe/Ulyanovsk /etc/localtime
echo "LANG=ru_RU.UTF-8" > /etc/locale.conf
echo "FONT=UniCyr_8x16" > /etc/vconsole.conf
useradd -m -g users -G audio,video,lp,games,power,storage,wheel -s /bin/zsh bma
mkinitcpio -p linux
passwd
passwd bma
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -R /mnt
reboot

#После перезагрузки в систему

pacman -Syu

localectl set-keymap ruwin_cplk-UTF-8
setfont UniCyr_8x16
localectl set-locale LANG="ru_RU.UTF-8"
export LANG=ru_RU.UTF-8
timedatectl set-timezone Europe/Ulyanovsk
hwclock --systohc --utc
echo doom > /etc/hostname
hostnamectl set-hostname doom
echo "net.ipv6.conf.all.disable_ipv6 = 1" > /etc/sysctl.d/10-ipv6.conf
mkinitcpio -p linux
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable dhcpcd
systemctl start dhcpcd.service

cp /etc/zsh/zprofile ~/.zprofile && echo "[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx" >> .zprofile
sudo systemctl edit getty@tty1
# и вставить этот код без # для автологина
# [Service]
# ExecStart=
# ExecStart=-/usr/bin/agetty --autologin malody --noclear %I $TERM

#Уменьшение размера журнала логов Systemd
sudo nano /etc/systemd/journald.conf
# Раскомментировать
# SystemMaxUse=5M

visudo #раскомментировать NOPASSWD для weel

sudo pacman -S xorg-server xorg-xinit xorg-server-utils xorg-xfontsel xorg-xrdb mesa
sudo pacman -S nvidia nvidia-utils nvidia-settings slim spacefm i3-gapps
sudo pacman -S xorg-font-misc ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-ukai ttf-arphic-uming ttf-hanazono ttf-croscore ttf-freefont ttf-ubuntu-font-family
sudo pacman -S firefox firefox-i18n-ru feh gpicview gimp p7zip unrar atool

# 

# установить моноширинный шрифт терминала
gsettings set org.gnome.desktop.interface 'monospace-font-name' 'DroidSansMono Nerd Font Mono 12'
# gsettings set org.gnome.desktop.interface 'monospace-font-name' 'Iosevka 15'
