# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_NAME := exodus_shamu
PRODUCT_DEVICE := shamu
PRODUCT_BRAND := Android
PRODUCT_MODEL := Nexus 6
PRODUCT_MANUFACTURER := motorola
PRODUCT_RESTRICT_VENDOR_FILES := false

# Kernel inline build
TARGET_KERNEL_SOURCE := kernel/moto/shamu
TARGET_KERNEL_CONFIG := shamu_defconfig
TARGET_VARIANT_CONFIG := shamu_defconfig
TARGET_SELINUX_CONFIG := shamu_defconfig


$(call inherit-product, vendor/exodus/config/common_phone.mk)

$(call inherit-product, device/moto/shamu/device.mk)
$(call inherit-product-if-exists, device/moto/shamu/vendorfiles/device-vendor.mk)

PRODUCT_NAME := exodus_shamu

PRODUCT_PACKAGES += \
    Launcher3

