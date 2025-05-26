#!/usr/bin/env bash

# get raid health
sudo mdadm --detail /dev/md0 > /home/blair/raid_health.txt


# send to blair server
scp -p 1497 -i /home/blair/.ssh/blair_server  /home/blair/raid_health.txt blair@100.82.137.69:/home/blair/Projects/raid_status/
