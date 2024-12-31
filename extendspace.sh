#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Unmount /dev/sdb1 if mounted
sudo umount /dev/sdb1 || true

# Install LVM2 if not installed
sudo apt-get update
sudo apt-get install -y lvm2

# Create physical volumes
sudo pvcreate /dev/sda1 /dev/sdb1

# Create a volume group named 'vg0'
sudo vgcreate vg0 /dev/sda1 /dev/sdb1

# Create a logical volume named 'rootfs' with all available space
sudo lvcreate -l 100%FREE -n rootfs vg0

# Format the new logical volume with ext4 filesystem
sudo mkfs.ext4 /dev/vg0/rootfs

# Mount the new logical volume temporarily
sudo mount /dev/vg0/rootfs /mnt

# Backup existing data from the current root to the new logical volume
sudo rsync -aAXv / /mnt --exclude=/mnt --exclude=/proc --exclude=/sys --exclude=/dev --exclude=/run --exclude=/tmp

# Prepare for the switch
for dir in /dev /dev/pts /proc /sys /run; do
  sudo mount --bind $dir /mnt/$dir
done

# Ensure the new root volume is mounted for boot
echo '/dev/vg0/rootfs / ext4 defaults 0 1' | sudo tee -a /mnt/etc/fstab

# Install bootloader on the new setup
sudo chroot /mnt grub-install /dev/sda
sudo chroot /mnt update-grub

# Unmount filesystems
for dir in /run /dev/pts /dev /proc /sys; do
  sudo umount /mnt/$dir
done
