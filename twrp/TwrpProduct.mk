
## TWRP Packages

# Post Recovery Script
PRODUCT_PACKAGES += \
	postrecoveryboot.sh

# Additional recovery inits
PRODUCT_PACKAGES += \
	init.recovery.g2.rc

# Touch-to-Wake
PRODUCT_PACKAGES += \
	init.recovery.touchtowake.rc

# SD Card init remains in board config
