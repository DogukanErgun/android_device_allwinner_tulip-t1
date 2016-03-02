
# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/softwinner/tulip_t1/tulip_t1.mk)


PRODUCT_BRAND := Allwinner
PRODUCT_NAME := cm_tulip_t1
PRODUCT_DEVICE := tulip_t1
PRODUCT_MODEL := Pine A64
PRODUCT_MANUFACTURER := Allwinner

# Release name
PRODUCT_RELEASE_NAME := pine
