#!/bin/bash
echo "Masking the LUKS decryption service in systemd"
ln -sf /dev/null /etc/systemd/system/systemd-cryptsetup@luks-1c8c9305-16ef-41c0-bf60-88f082aa720c.service
