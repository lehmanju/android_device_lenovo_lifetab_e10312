# Release name
PRODUCT_RELEASE_NAME := lifetab_e10310

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit device configuration
$(call inherit-product, device/lenovo/lifetab_e10310/device.mk)

TARGET_SCREEN_WIDTH := 800
TARGET_SCREEN_HEIGHT := 1280

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := lifetab_e10310
PRODUCT_NAME := aosp_lifetab_e10310
PRODUCT_BRAND := Medion
PRODUCT_MODEL := lifetab_e10310
PRODUCT_MANUFACTURER := lenovo
