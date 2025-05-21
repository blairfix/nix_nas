#!/usr/bin/bash

# list drives
sudo fdisk -l

# enter disk
echo "--------------------------------"
read -p 'Enter drive to partition ' drive

# partition standard
sudo parted "$drive" mklabel gpt

# make partition
sudo parted -a optimal "$drive" mkpart primary 0% 100%


# set raid on
sudo parted -s "$drive" set 1 raid on

# list partitions
lsblk 

