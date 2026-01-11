#!/bin/bash

# Set disk and associated partitions
DISK_SSD="/dev/nvme0n1"
DISK_BOOT="/dev/nvme0n1p1"
DISK_NIXOS="/dev/nvme0n1p2"
DISK_SWAP="/dev/nvme0n1p3"
# Set hostname
HOST=""

# Create GPT partition table
parted ${DISK_SSD} -- mklabel gpt
# Create boot partition
parted ${DISK_SSD} -- mkpart ESP fat32 1MB 512MB
# Create root partition
parted ${DISK_SSD} -- mkpart root ext4 512MB -8GB
# Create swap partition
parted ${DISK_SSD} -- mkpart swap linux-swap -8GB 100%
# Set partition 1 as bootable
parted ${DISK_SSD} -- set 1 esp on

# Create boot filesystem
mkfs.fat -F 32 -n boot ${DISK_BOOT}
# Create root filesystem
mkfs.ext4 -L nixos ${DISK_NIXOS}
# Create swap
mkswap -L swap ${DISK_SWAP}

# Mount root partition to /mnt
mount /dev/disk/by-label/nixos /mnt
# Create boot folder in /mnt
mkdir -p /mnt/boot
# Mount boot partition to /mnt/boot
mount -o umask=077 /dev/disk/by-label/boot /mnt/boot

# Run nixos-install
nixos-install --flake github:jdzeller/nixos-config#${HOST}
