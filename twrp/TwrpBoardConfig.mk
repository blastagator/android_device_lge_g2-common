###                                     ###
### Specific Options for TWRP Building  ###
###                                     ###

# Common Options
RECOVERY_VARIANT := twrp
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_EXCLUDE_SUPERSU := true
TW_BRIGHTNESS_PATH := "/sys/devices/mdp.0/qcom\x2cmdss_fb_primary.175/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 175
TW_NO_USB_STORAGE := true
TW_INCLUDE_L_CRYPTO := true
TARGET_HW_DISK_ENCRYPTION := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXCLUDE_DEFAULT_USB_INIT := true

# My custom flags
TW_SKIP_RO_PARTITION_CHECK := true

# Enable f2fs filesystem tools
# Should be on by default, but turn on just in case
TARGET_USERIMAGES_USE_F2FS := true

# Enable ntfs filesystem tools
TW_INCLUDE_NTFS_3G := true

##  Functions to properly set config and files based on existence of an External SD Card
# Board has an External SD Card (i.e. f320 or lgl22)
ifneq ($(filter f320 lgl22,$(TARGET_DEVICE)),)
    BOARD_HAS_NO_REAL_SDCARD := false
    TW_EXTERNAL_STORAGE_PATH := "/external_sd"
    TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
	PRODUCT_COPY_FILES += device/lge/g2-common/twrp/fstab/twrp.g2.has_sd.fstab:recovery/root/etc/twrp.fstab
	# Must go to ROOT (not recovery root) because inits are deleted and overwritten in the recovery root
	PRODUCT_COPY_FILES += device/lge/g2-common/twrp/init/init.recovery.sd_card.rc:root/init.recovery.sd_card.rc

# OR
# Board does not have an External SD Card
else
    BOARD_HAS_NO_REAL_SDCARD := true
	PRODUCT_COPY_FILES += device/lge/g2-common/twrp/fstab/twrp.g2.no_sd.fstab:recovery/root/etc/twrp.fstab    
    
endif
