#!/bin/bash

echo "/path/to/large/ext4/partition:> " path
RECOVERY=$path
extundelete /dev/sda2 --restore-all -o $RECOVERY
