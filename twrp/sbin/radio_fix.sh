#!/sbin/sh

## LG Radio fix (credit to YoDevil for identifying the problem)

# Put the needed string in a file
printf "BSP Forever" >> /tmp/bsp_forever

# Insert the string/file into the /misc partition, at the appropriate place
busybox dd if=/tmp/bsp_forever of=/dev/block/platform/msm_sdcc.1/by-name/misc bs=1 seek=2048 conv=notrunc
