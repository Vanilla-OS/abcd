#!/bin/bash
echo "Loading necessary kernel modules"
modprobe dm-crypt
modprobe dm-mod
modprobe dm_thin_pool
