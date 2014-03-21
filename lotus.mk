# Inherit from AOSP
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)


# Inherit from the common montblanc definitions
$(call inherit-product, device/sony/montblanc-common/montblanc.mk)


# Inherit from the device specific vendor definitions
$(call inherit-product-if-exists, vendor/sony/lotus/lotus-vendor.mk)


# Device specific settings overlays
DEVICE_PACKAGE_OVERLAYS += device/sony/kumquat/overlay


# Device specific configuration scripts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/init.st-ericsson.device.rc:root/init.st-ericsson.device.rc \
	$(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml


# Device specific hardware configuration script    
	$(LOCAL_PATH)/config/dash.conf:system/etc/dash.conf \
	$(LOCAL_PATH)/prebuilt/hw_config.sh:system/etc/hw_config.sh \
	$(LOCAL_PATH)/config/cflashlib.cfg:system/etc/cflashlib.cfg \
	$(LOCAL_PATH)/config/flashled_param_config.cfg:system/etc/flashled_param_config.cfg


# Device specific bootlogo and charging animation
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/logo-320x480.rle:root/logo.rle
$(call inherit-product, device/sony/lotus/prebuilt/resources-320x480.mk)


# Device specific recovery bootstrap scripts
PRODUCT_COPY_FILES += \
 	$(LOCAL_PATH)/config/bootrec-device:root/sbin/bootrec-device


# Device specific USB configuration script 
PRODUCT_COPY_FILES += $(LOCAL_PATH)/config/init.st-ericsson.usb.rc:root/init.st-ericsson.usb.rc


# Device specific keylayouts and touchscreen configurations files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/AB8500_Hs_Button.kl:system/usr/keylayout/AB8500_Hs_Button.kl \
	$(LOCAL_PATH)/config/simple_remote.kl:system/usr/keylayout/simple_remote.kl \
	$(LOCAL_PATH)/config/simple_remote_appkey.kl:system/usr/keylayout/simple_remote_appkey.kl \
	$(LOCAL_PATH)/config/cyttsp_key.kl:system/usr/keylayout/cyttsp_key.kl \
	$(LOCAL_PATH)/config/STMPE-keypad.kl:system/usr/keylayout/STMPE-keypad.kl \
	$(LOCAL_PATH)/config/tc3589x-keypad.kl:system/usr/keylayout/tc3589x-keypad.kl \
	$(LOCAL_PATH)/config/ux500-ske-keypad.kl:system/usr/keylayout/ux500-ske-keypad.kl \
	$(LOCAL_PATH)/config/ux500-ske-keypad-qwertz.kl:system/usr/keylayout/ux500-ske-keypad-qwertz.kl \
	$(LOCAL_PATH)/config/cyttsp-spi.idc:system/usr/idc/cyttsp-spi.idc \
	$(LOCAL_PATH)/config/synaptics_rmi4_i2c.idc:system/usr/idc/synaptics_rmi4_i2c.idc \
	$(LOCAL_PATH)/config/sensor00_f11_sensor0.idc:system/usr/idc/sensor00_f11_sensor0.idc

# Device specific display resolutions
# Reference: http://developer.android.com/guide/practices/screens_support.html
# Note: In PRODUCT_AAPT_PREF_CONFIG set the proper one (e.g. hdpi), in PRODUCT_AAPT_CONFIG set the proper one and the previous one (e.g. mdpi)
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_AAPT_CONFIG := normal mdpi mdpi
