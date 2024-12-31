#!/bin/bash

# Ensure the scripts aborts if a command fails
sudo set -e

# Unmount the /dev/sdb1 if it's already mounted
sudo umount /dev/sdb1 || true

# Wipe the filesystem of /dev/sdb1
sudo wipefs -a /dev/sdb1

# Check and create a physical volume
sudo pvcreate /dev/sdb1

# Assuming your existing volume group is called vg0, add the new PV
sudo vgextend vg0 /dev/sdb1

# Extend the logical volume that your root filesystem is on
sudo lvextend -l +100%FREE /dev/mapper/vg0-root

# Resize the filesystem to use the new space
sudo resize2fs /dev/mapper/vg0-root

echo "Successfully extended the root filesystem"
