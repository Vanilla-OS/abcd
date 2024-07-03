#!/bin/bash
echo "Activating initial LVM volumes"
vgscan --mknodes
vgchange -ay
