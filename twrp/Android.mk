LOCAL_PATH := $(call my-dir)

## TWRP configuration scripts
# Post Boot Script
include $(CLEAR_VARS)
LOCAL_MODULE            := postrecoveryboot.sh
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := RECOVERY_EXECUTABLES
LOCAL_SRC_FILES         := sbin/postrecoveryboot.sh
LOCAL_MODULE_PATH       := $(TARGET_RECOVERY_ROOT_OUT)/sbin
include $(BUILD_PREBUILT)


## TWRP recovery inits
# All of the inits MUST go into ROOT_OUT
#    Otherwise, the inits will be delated when creating recovery ramdisk

# Use this instead of the previous recovery init
include $(CLEAR_VARS)
LOCAL_MODULE            := init.recovery.g2.rc
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := RECOVERY_EXECUTABLES
LOCAL_SRC_FILES         := init/init.recovery.g2.rc
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

# Touch to Wake
include $(CLEAR_VARS)
LOCAL_MODULE            := init.recovery.touchtowake.rc
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := RECOVERY_EXECUTABLES
LOCAL_SRC_FILES         := init/init.recovery.touchtowake.rc
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

# USB (Use g2 version instead of TWRP)
include $(CLEAR_VARS)
LOCAL_MODULE            := init.recovery.g2.usb.rc
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := RECOVERY_EXECUTABLES
LOCAL_SRC_FILES         := ../init.g2.usb.rc
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)
