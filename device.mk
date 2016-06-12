#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lenovo/lifetab_e10310/lifetab_e10310-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lenovo/lifetab_e10310/overlay

LOCAL_PATH := device/lenovo/lifetab_e10310
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel \
	$(LOCAL_PATH)/modules/rk30xxnand_ko.ko.3.0.8+:/root/rk30xxnand_ko.ko.3.0.8+ \
	$(LOCAL_PATH)/modules/rk30xxnand_ko.ko.3.0.36+:/root/rk30xxnand_ko.ko.3.0.36+ \
	$(LOCAL_PATH)/modules/rk29-ipp.ko.3.0.8+:/root/rk29-ipp.ko.3.0.8+ \
	$(LOCAL_PATH)/modules/rk29-ipp.ko.3.0.36+:/root/rk29-ipp.ko.3.0.36+ \
	$(LOCAL_PATH)/modules/rk30xxnand_ko.ko.3.0.36+:/ubuntu-root/lib/modules/rk30xxnand_ko.ko.3.0.36+ \
	$(LOCAL_PATH)/modules.conf:/ubuntu-root/conf/modules

# for bootimage
# 
PRODUCT_COPY_FILES += $(LOCAL_PATH)/fstab.rk30board:/root/fstab.lifetab_e10310 \
	$(LOCAL_PATH)/root/init.rc:/root/init.rc \
	$(LOCAL_PATH)/root/init.rk30board.rc:/root/init.rk30board.rc \
	$(LOCAL_PATH)/root/init.rk30board.usb.rc:/root/init.rk30board.usb.rc \
	$(LOCAL_PATH)/root/init.trace.rc:/root/init.trace.rc \
	$(LOCAL_PATH)/root/init.usb.rc:/root/init.usb.rc \
	$(LOCAL_PATH)/root/ueventd.rc:/root/ueventd.rc \
	$(LOCAL_PATH)/root/ueventd.rk30board.rc:/root/ueventd.rk30board.rc
	
#PRODUCT_COPY_FILES_OVERRIDES += root/init.rc \
	root/init.usb.rc \
	root/ueventd.rc \
	root/init.trace.rc	
	
PROPRIETARY_DIR := $(LOCAL_PATH)/proprietary
	
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(PROPRIETARY_DIR)/system/lib,system/lib)

# for recovery
#
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/root/init.recovery.rk30board.rc:/recovery/root/init.recovery.rk30board.rc \
	$(LOCAL_PATH)/recovery/root/charger:/recovery/root/charger

PRODUCT_COPY_FILES_OVERRIDES += \
	recovery/root/ueventd.rk30board.rc \
	recovery/root/init.rc \
	recovery/root/ueventd.rc \
	recovery/root/ueventd.rk30board.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0