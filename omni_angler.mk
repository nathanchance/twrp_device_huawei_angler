# Inherit AOSP base telephony config
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inline kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/huawei/angler
TARGET_KERNEL_CONFIG := flash_defconfig
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linaro-linux-gnu-7.x/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linaro-linux-gnu-

# Skip keymaster compilation
TARGET_PROVIDES_KEYMASTER := true

# TWRP
PRODUCT_COPY_FILES += \
    device/huawei/angler/twrp.fstab:recovery/root/etc/twrp.fstab
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_CRYPTO := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TARGET_RECOVERY_QCOM_RTC_FIX := true

# nathanchance TWRP additions
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_DEVICE_DIRS := device/huawei/angler
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 149
TW_EXCLUDE_SUPERSU := true
TWRP_INCLUDE_LOGCAT := true

# Override product naming for Omni
PRODUCT_NAME := omni_angler
PRODUCT_BRAND := google
PRODUCT_DEVICE := angler
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_COPY_FILES += \
    device/huawei/angler/ueventd.angler.rc:root/ueventd.angler.rc

# for off charging mode
PRODUCT_PACKAGES += \
    charger_res_images

# Add my personal keys
PRODUCT_EXTRA_RECOVERY_KEYS := device/huawei/angler/recovery/keys/nathan
