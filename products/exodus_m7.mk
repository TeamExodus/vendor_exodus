#Squisher Choosing
DHO_VENDOR := exodus

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.goo.rom=exodus-m7

# Inherit common product files.

# Inherit AOSP device configuration for HTC One Unlocked edition.
$(call inherit-product, vendor/exodus/devices/full_m7.mk)

$(call inherit-product, vendor/exodus/products/multi_m7-common.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := exodus_m7
PRODUCT_DEVICE := m7
PRODUCT_BRAND := htc
PRODUCT_MANUFACTURER := htc
PRODUCT_MODEL := One

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m7 BUILD_ID=LRX22G.H10 BUILD_FINGERPRINT="htc/m7_google/m7:5.0/LRX22G.H10/230993:user/release-keys" PRIVATE_BUILD_DESC="3.06.1700.10 CL230993 release-keys"
