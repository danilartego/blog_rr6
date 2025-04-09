#!/bin/bash

# Функция для вывода сообщения об ошибке и завершения скрипта
error_exit() {
    echo "Ошибка: $1"
    exit 1
}

# Проверка, запущен ли скрипт от root
if [ "$EUID" -ne 0 ]; then
    error_exit "Пожалуйста, запустите скрипт от имени root."
fi

# Запрос информации о дисках
echo "Введите устройство для установки (например, /dev/sda):"
read DEVICE

if [ ! -e "$DEVICE" ]; then
    error_exit "Устройство $DEVICE не существует."
fi

echo "Вы хотите отформатировать весь диск $DEVICE? (y/n)"
read FORMAT_DISK

if [ "$FORMAT_DISK" = "y" ]; then
    echo "Форматирование диска $DEVICE..."
    parted -s "$DEVICE" mklabel gpt
    parted -s "$DEVICE" mkpart primary ext4 1MiB 100%
    mkfs.ext4 "${DEVICE}1"
    mount "${DEVICE}1" /mnt
else
    echo "Пожалуйста, создайте разделы вручную и смонтируйте корневой раздел в /mnt."
    echo "После этого нажмите Enter для продолжения."
    read
fi

# Установка базовой системы
echo "Установка базовой системы..."
pacstrap /mnt base linux linux-firmware

# Настройка системы
echo "Настройка системы..."
genfstab -U /mnt >> /mnt/etc/fstab

# Запрос информации о пользователе
echo "Введите имя пользователя:"
read USERNAME

echo "Введите пароль для пользователя $USERNAME:"
read -s PASSWORD

echo "Введите пароль для root:"
read -s ROOT_PASSWORD

# Создание пользователя и настройка паролей
arch-chroot /mnt useradd -m -G wheel -s /bin/bash "$USERNAME"
echo "$USERNAME:$PASSWORD" | arch-chroot /mnt chpasswd
echo "root:$ROOT_PASSWORD" | arch-chroot /mnt chpasswd

# Настройка локали
echo "Настройка локали..."
echo "en_US.UTF-8 UTF-8" > /mnt/etc/locale.gen
arch-chroot /mnt locale-gen
echo "LANG=en_US.UTF-8" > /mnt/etc/locale.conf

# Настройка часового пояса
echo "Введите часовой пояс (например, Europe/Moscow):"
read TIMEZONE
arch-chroot /mnt ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
arch-chroot /mnt hwclock --systohc

# Настройка сети
echo "Введите имя хоста:"
read HOSTNAME
echo "$HOSTNAME" > /mnt/etc/hostname
echo "127.0.1.1 $HOSTNAME.localdomain $HOSTNAME" >> /mnt/etc/hosts

# Установка загрузчика
echo "Установка загрузчика..."
arch-chroot /mnt pacman -S grub --noconfirm
arch-chroot /mnt grub-install "$DEVICE"
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

# Установка дополнительных программ
echo "Хотите установить дополнительные программы? (y/n)"
read INSTALL_EXTRA

if [ "$INSTALL_EXTRA" = "y" ]; then
    echo "Введите названия пакетов для установки (через пробел):"
    read EXTRA_PACKAGES
    arch-chroot /mnt pacman -S $EXTRA_PACKAGES --noconfirm
fi

# Завершение установки
echo "Установка завершена. Перезагрузите систему."
umount -R /mnt