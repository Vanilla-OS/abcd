#!/bin/bash
echo "Starting udevd daemon..."
/lib/systemd/systemd-udevd --daemon

# following is possibly not needed
udevadm trigger
udevadm settle
while :; do
    udevadm trigger
    udevadm settle
    sleep 1
done &
UDEV_LOOP_PID=$!
