$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, build/target/product/full_base.mk)
$(call inherit-product, device/softwinner/tulip-common/tulip-common.mk)
$(call inherit-product-if-exists, device/softwinner/tulip_t1/modules/modules.mk)

DEVICE_PACKAGE_OVERLAYS := device/softwinner/tulip_t1/overlay \
                           $(DEVICE_PACKAGE_OVERLAYS)

#PRODUCT_PACKAGES += Launcher3

PRODUCT_PACKAGES += \
    ESFileExplorer \
    VideoPlayer \
    ChromeBrowser \
    Bluetooth

PRODUCT_COPY_FILES += \
    device/softwinner/tulip_t1/fstab.sun50iw1p1:root/fstab.sun50iw1p1 \
    device/softwinner/tulip_t1/init.sun50iw1p1.rc:root/init.sun50iw1p1.rc \
    device/softwinner/tulip_t1/init.recovery.sun50iw1p1.rc:root/init.recovery.sun50iw1p1.rc \
    device/softwinner/tulip_t1/ueventd.sun50iw1p1.rc:root/ueventd.sun50iw1p1.rc \
    device/softwinner/tulip_t1/recovery.fstab:recovery.fstab \
    device/softwinner/tulip_t1/modules/modules/nand.ko:root/nand.ko \
    device/softwinner/tulip_t1/modules/modules/sunxi_tr.ko:root/sunxi_tr.ko \
    device/softwinner/tulip_t1/modules/modules/disp.ko:root/disp.ko \
    device/softwinner/tulip_t1/modules/modules/sunxi-keyboard.ko:obj/sunxi-keyboard.ko \
    device/softwinner/tulip_t1/modules/modules/sw-device.ko:obj/sw-device.ko \
    device/softwinner/tulip_t1/modules/modules/gslX680new.ko:obj/gslX680new.ko \
    device/softwinner/tulip_t1/kernel:kernel \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

PRODUCT_COPY_FILES += \
    device/softwinner/tulip_t1/configs/camera.cfg:system/etc/camera.cfg \
    device/softwinner/tulip_t1/configs/gsensor.cfg:system/usr/gsensor.cfg \
    device/softwinner/tulip_t1/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/softwinner/tulip_t1/configs/sunxi-keyboard.kl:system/usr/keylayout/sunxi-keyboard.kl \
    device/softwinner/tulip_t1/configs/sunxi_ir_recv.kl:system/usr/keylayout/sunxi_ir_recv.kl \
    device/softwinner/tulip_t1/configs/tp.idc:system/usr/idc/tp.idc

PRODUCT_COPY_FILES += \
    device/softwinner/tulip_t1/hawkview/sensor_list_cfg.ini:system/etc/hawkview/sensor_list_cfg.ini

# bootanimation
PRODUCT_COPY_FILES += \
    device/softwinner/tulip_t1/media/bootanimation.zip:system/media/bootanimation.zip

# Radio Packages and Configuration Flie
$(call inherit-product, device/softwinner/common/rild/radio_common.mk)
#$(call inherit-product, device/softwinner/common/ril_modem/huawei/mu509/huawei_mu509.mk)
#$(call inherit-product, device/softwinner/common/ril_modem/Oviphone/em55/oviphone_em55.mk)

#rtl8723bs bt fw and config
$(call inherit-product, hardware/realtek/bluetooth/rtl8723bs/firmware/rtlbtfw_cfg.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.8723b_bt.used=true

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0 \
    rw.logger=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=288 \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.spk_dul.used=false \

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=America/Los_Angeles \
    persist.sys.country=US \
    persist.sys.language=en

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.dexopt-flags=m=y \

PRODUCT_PROPERTY_OVERRIDES += \
    service.adb.tcp.port=5555

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := mdpi large xlarge
PRODUCT_AAPT_PREF_CONFIG := mdpi

$(call inherit-product-if-exists, vendor/google/products/gms_base.mk)
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

