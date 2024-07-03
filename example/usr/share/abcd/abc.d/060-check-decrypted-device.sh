#!/bin/bash
if [ ! -e /dev/mapper/luks-1c8c9305-16ef-41c0-bf60-88f082aa720c ]; then
    echo "Decrypted device not found, trying to activate LVM again"
    vgscan --mknodes
    vgchange -ay
fi
