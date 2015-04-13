#Squisher Choosing
DHO_VENDOR := exodus

KERNEL_SPAM := CM-AOSP 3.4.0-g8e41961

# Run these first or they will not stick
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=exodus-FLO

# Tablet Overlays no radios
    PRODUCT_PACKAGE_OVERLAYS += vendor/exodus/overlay/tab_no_radio

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/1280x1920.zip:system/media/bootanimation.zip

# Inherit AOSP device configuration for grouper
$(call inherit-product, device/asus/flo/full_flo.mk)

# Inherit common product files.
$(call inherit-product, vendor/exodus/products/common_tabs.mk)

# Setup device specific product configuration.
PRODUCT_NAME := exodus_flo
PRODUCT_BRAND := google
PRODUCT_DEVICE := flo
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := asus

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=razor TARGET_DEVICE=flo BUILD_FINGERPRINT=google/razor/flo:5.0/LRX22G/937116:user/release-keys PRIVATE_BUILD_DESC="razor-user 5.0 LRX22G 937116 release-keys"
