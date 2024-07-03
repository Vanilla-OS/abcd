#!/bin/bash
echo "Mounting /dev/mapper/vos--var-var to /var"
mount /dev/mapper/luks-1c8c9305-16ef-41c0-bf60-88f082aa720c /var
if [[ $? -ne 0 ]]; then
    echo "Failed to mount /var"
    exec /bin/bash -i
fi
echo "/var mounted"

echo "Mounting /var/home to /home"
mount --bind /var/home /home
if [[ $? -ne 0 ]]; then
    echo "Failed to mount /home"
    exec /bin/bash -i
fi
echo "/home mounted"

echo "Mounting /var/opt to /opt"
mount --bind /var/opt /opt
if [[ $? -ne 0 ]]; then
    echo "Failed to mount /opt"
    exec /bin/bash -i
fi
echo "/opt mounted"

echo "Mounting overlay from /var/lib/abroot/etc/vos-a/ to /etc"
mount -t overlay overlay -o lowerdir=/.system/etc,upperdir=/var/lib/abroot/etc/vos-a,workdir=/var/lib/abroot/etc/vos-a-work /etc
if [[ $? -ne 0 ]]; then
    echo "Failed to mount overlay"
    exec /bin/bash -i
fi
echo "Overlay mounted"
