# Inherit from the proprietary version
-include vendor/sony/lotus/BoardConfigVendor.mk

# Inherit from the common montblanc definitions
-include device/sony/montblanc-common/BoardConfigCommon.mk

# Platform specific headers
TARGET_SPECIFIC_HEADER_PATH += device/sony/lotus/include

# Kernel specific configuration
TARGET_KERNEL_CONFIG := xperiago_defconfig
BOARD_CUSTOM_BOOTIMG := true
TARGET_NO_SEPARATE_RECOVERY := true

# Specific flag for LED bar notification
COMMON_GLOBAL_CFLAGS += -DNEW_NOTIFICATION

# Device identifiers for updates
TARGET_OTA_ASSERT_DEVICE := ST27i,ST27a,lotus

# TWRP
BOARD_HAS_NO_REAL_SDCARD := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_RECOVERY_FSTAB := device/sony/lotus/config/fstab.st-ericsson
