$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/pantech/ef32k/ef32k-vendor.mk)

#DEVICE_PACKAGE_OVERLAYS += device/pantech/ef32k/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/pantech/ef32k/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_ef32k
PRODUCT_DEVICE := ef32k
PRODUCT_LOCALES += mdpi


# Add file


# BOOT
PRODUCT_COPY_FILES += \
    device/pantech/ef32k/add/boot.img:boot.img

# Init
PRODUCT_COPY_FILES += \
    device/pantech/ef32k/add/init.rc:root/init.rc \
    device/pantech/ef32k/add/logo.rle:root/logo.rle \
    device/pantech/ef32k/add/logo.rle:root/initlogo.rle \
    device/pantech/ef32k/add/init.goldfish.rc:root/init.goldfish.rc \
    device/pantech/ef32k/add/init.qcom.rc:root/init.qcom.rc \
    device/pantech/ef32k/add/init.qcom.sh:root/init.qcom.sh \
    device/pantech/ef32k/add/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    device/pantech/ef32k/add/ueventd.rc:root/ueventd.rc

# bin
PRODUCT_COPY_FILES += \
    device/pantech/ef32k/add/bin/dhcpcd:system/bin/dhcpcd \
    device/pantech/ef32k/add/bin/aprserver:system/bin/aprserver \
    device/pantech/ef32k/add/bin/cpmgrif:system/bin/cpmgrif \
    device/pantech/ef32k/add/bin/akmd8975:system/bin/akmd8975 \
    device/pantech/ef32k/add/bin/installd:system/bin/installd \
    device/pantech/ef32k/add/bin/pam_server:system/bin/pam_server \
    device/pantech/ef32k/add/bin/pantech_server:system/bin/pantech_server \
    device/pantech/ef32k/add/bin/sky_localdb:system/bin/sky_localdb \
    device/pantech/ef32k/add/bin/wpa_supplicant:system/bin/wpa_supplicant

# GPS
PRODUCT_COPY_FILES += \
    device/pantech/ef32k/add/gps.conf:system/etc/gps.conf

# APN
PRODUCT_COPY_FILES += \
    device/pantech/ef32k/add/apns-conf.xml:system/etc/apns-conf.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    device/pantech/ef32k/add/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# KoreanIME
PRODUCT_COPY_FILES += \
    device/pantech/ef32k/add/libjni_koreanime.so:system/lib/libjni_koreanime.so \
    device/pantech/ef32k/add/KoreanIME.apk:system/app/LatinIME.apk

# lib
PRODUCT_COPY_FILES += \
    device/pantech/ef32k/add/libril-qc-1.so:system/lib/libril-qc-1.so

# lib
PRODUCT_COPY_FILES += \
    device/pantech/ef32k/add/egl.cfg:system/lib/egl/egl.cfg

# Device Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

