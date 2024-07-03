#!/bin/bash
echo "Decrypting LUKS device"
/.system/usr/bin/plymouth ask-for-password --prompt="Please enter passphrase to unlock your data." --command="/usr/sbin/cryptsetup luksOpen --debug /dev/mapper/vos--var-var luks-1c8c9305-16ef-41c0-bf60-88f082aa720c"
if [[ $? -ne 0 ]]; then
    echo "Failed to decrypt LUKS device"
    /.system/usr/bin/plymouth --quit
    exec /bin/bash -i
fi
echo "LUKS device decrypted"
