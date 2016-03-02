# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

include device/softwinner/tulip-common/BoardConfigCommon.mk

# image related
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false
INSTALLED_KERNEL_TARGET := kernel
BOARD_KERNEL_CMDLINE := 
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736

#TARGET_PREBUILT_KERNEL := device/softwinner/tulip_t1/kernel
#TARGET_KERNEL_ARCH := arm64
#TARGET_KERNEL_CONFIG := sun50iw1p1smp_android_defconfig
#TARGET_KERNEL_SOURCE := kernel/softwinner/lichee/linux-3.10
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(ANDROID_BUILD_TOP)/prebuilts/external-toolchain/bin/aarch64-linux-gnu-

TARGET_SPECIFIC_HEADER_PATH := device/softwinner/tulip_t1/include

# recovery stuff
#TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
#TARGET_RECOVERY_UI_LIB := librecovery_ui_tulip_t1
#SW_BOARD_TOUCH_RECOVERY := true

# wifi and bt configuration
# 1. Wifi Configuration
# 1.1 realtek wifi support 
# 1.1  realtek wifi configuration
BOARD_WIFI_VENDOR := realtek
ifeq ($(BOARD_WIFI_VENDOR), realtek)
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl

    BOARD_USR_WIFI := rtl8723bs
endif

# 1.2 broadcom wifi support
#BOARD_WIFI_VENDOR := broadcom
ifeq ($(BOARD_WIFI_VENDOR), broadcom)
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    WPA_SUPPLICANT_VERSION      := VER_0_8_X
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
    BOARD_WLAN_DEVICE           := bcmdhd
    WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"

    BOARD_USR_WIFI := ap6330
    include hardware/broadcom/wlan/bcmdhd/firmware/$(BOARD_USR_WIFI)/device-bcm.mk
endif

#1.3 eag wifi config
#BOARD_WIFI_VENDOR := eagle
ifeq ($(BOARD_WIFI_VENDOR), eagle)
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_eagle
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_eagle

    BOARD_USR_WIFI := esp8089
    BOARD_WLAN_DEVICE := esp8089

endif

# 2. Bluetooth Configuration
# make sure BOARD_HAVE_BLUETOOTH is true for every bt vendor
BOARD_HAVE_BLUETOOTH := true
AUDIO_FEATURE_ENABLED_SPLIT_A2DP := true
#BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_BLUETOOTH_NAME := rtl8723bs
BOARD_HAVE_BLUETOOTH_RTK_COEX := true
BOARD_HAVE_BLUETOOTH_RTK := true
BLUETOOTH_HCI_USE_RTK_H5 := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/softwinner/tulip_t1/bluetooth
TARGET_USE_BOOSTUP_OPZ := true
