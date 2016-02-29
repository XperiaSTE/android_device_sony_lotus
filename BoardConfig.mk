# Inherit from the proprietary version
-include vendor/sony/lotus/BoardConfigVendor.mk

# Inherit from the common montblanc definitions
-include device/sony/montblanc-common/BoardConfigCommon.mk

# Enable non PIE support
TARGET_ENABLE_NON_PIE_SUPPORT := true

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

# Sensors
SOMC_CFG_SENSORS := true
SOMC_CFG_SENSORS_COMPASS_LSM303DLHC := yes
SOMC_CFG_SENSORS_ACCELEROMETER_LSM303DLHC_LT := yes
SOMC_CFG_SENSORS_LIGHT_AS3677 := yes
SOMC_CFG_SENSORS_LIGHT_AS3677_PATH := "/sys/devices/platform/nmk-i2c.2/i2c-2/2-0040"
SOMC_CFG_SENSORS_LIGHT_AS3677_MAXRANGE := 12276
SOMC_CFG_SENSORS_PROXIMITY_APDS9702 := yes
SOMC_CFG_SENSORS_PRESSURE_BMP180 := yes
