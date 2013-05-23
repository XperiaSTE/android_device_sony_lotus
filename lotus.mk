# Inherit from the common montblanc definitions
$(call inherit-product, device/sony/montblanc-common/montblanc.mk)

# Inherit from the device specific vendor definitions
$(call inherit-product-if-exists, vendor/sony/lotus/lotus-vendor.mk)

# Device specific settings overlays
DEVICE_PACKAGE_OVERLAYS += device/sony/lotus/overlay

# Device specific init scripts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/fstab.st-ericsson:root/fstab.st-ericsson \
	$(LOCAL_PATH)/config/init.st-ericsson.device.rc:root/init.st-ericsson.device.rc \
	$(LOCAL_PATH)/config/init.st-ericsson.usb.rc:root/init.st-ericsson.usb.rc

# Device specific hardware configuration scripts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/dash.conf:system/etc/dash.conf \
	$(LOCAL_PATH)/prebuilt/hw_config.sh:system/etc/hw_config.sh \
	$(LOCAL_PATH)/config/cflashlib.cfg:system/etc/cflashlib.cfg \
	$(LOCAL_PATH)/config/flashled_param_config.cfg:system/etc/flashled_param_config.cfg \
	$(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml

# Device specific bootlogo and charging animation
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/logo-320x480.rle:root/logo.rle
$(call inherit-product, device/sony/lotus/prebuilt/resources-320x480.mk)

# TWRP
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/twrp.fstab:recovery/root/etc/twrp.fstab \
	$(LOCAL_PATH)/config/init.recovery.st-ericsson.rc:root/init.recovery.st-ericsson.rc

# Device specific keylayouts and touchscreen configurations files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/AB8500_Hs_Button.kl:system/usr/keylayout/AB8500_Hs_Button.kl \
	$(LOCAL_PATH)/config/simple_remote.kl:system/usr/keylayout/simple_remote.kl \
	$(LOCAL_PATH)/config/simple_remote_appkey.kl:system/usr/keylayout/simple_remote_appkey.kl \
	$(LOCAL_PATH)/config/cyttsp_key.kl:system/usr/keylayout/cyttsp_key.kl \
	$(LOCAL_PATH)/config/ux500-ske-keypad.kl:system/usr/keylayout/ux500-ske-keypad.kl \
	$(LOCAL_PATH)/config/cyttsp-spi.idc:system/usr/idc/cyttsp-spi.idc \

# Device specific display resolutions
# Reference: http://developer.android.com/guide/practices/screens_support.html
# Note: In PRODUCT_AAPT_PREF_CONFIG set the proper one (e.g. hdpi), in PRODUCT_AAPT_CONFIG set the proper one and the previous one (e.g. mdpi)
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_AAPT_PREBUILT_DPI := mdpi

# Barometer permissions
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml

# Android kind of memory
PRODUCT_CHARACTERISTICS := nosdcard

# PC Companion kind of memory
PRODUCT_PROPERTY_OVERRIDES += ro.semc.product.user_storage=emmc_only

# Hardware video codecs configurations
PRODUCT_PROPERTY_OVERRIDES += \
	ste.video.decoder.max.hwmem=0x2600000 \
	ste.video.decoder.max.res=720p \
	ste.video.decoder.h264.max.lev=3.2

# Device density
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=48m \
    dalvik.vm.heapsize=128m \
    dalvik.vm.heaptargetutilization=0.25 \
    dalvik.vm.heapminfree=1m \
    dalvik.vm.heapmaxfree=2m

# Low-RAM optimizations
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.low_ram=true \
	persist.sys.force_highendgfx=true \
	dalvik.vm.jit.codecachesize=0 \
	ro.config.max_starting_bg=8 \
	ro.sys.fw.bg_apps_limit=16 \
	config.disable_atlas=true
