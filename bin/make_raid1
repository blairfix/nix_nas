#!/usr/bin/bash


# list drives
sudo fdisk -l

# enter disk
echo "--------------------------------"
read -p 'Enter RAID drive 1: ' drive1
read -p 'Enter RAID drive 2: ' drive2


sudo mdadm \
  --verbose \
  --create /dev/md0 \
  --level=1 \
  --raid-devices=2 \
  "$drive1" "$drive2"

