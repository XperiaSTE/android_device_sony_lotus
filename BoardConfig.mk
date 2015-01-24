# Inherit from the proprietary version
-include vendor/sony/lotus/BoardConfigVendor.mk


# Inherit from the common montblanc definitions
-include device/sony/montblanc-common/BoardConfigCommon.mk


# Platform specific headers
TARGET_SPECIFIC_HEADER_PATH += device/sony/lotus/include


# Kernel specific configuration
TARGET_KERNEL_CONFIG := xperiago_defconfig


# Specific flag for LED bar notification
COMMON_GLOBAL_CFLAGS += -DNEW_NOTIFICATION


# Device identifiers for updates
TARGET_OTA_ASSERT_DEVICE := ST27i,ST27a,lotus

# TWRP
DEVICE_RESOLUTION := 320x480
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_RECOVERY_FSTAB := device/sony/lotus/config/fstab.st-ericsson
