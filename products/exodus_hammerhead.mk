#Squisher Choosing
DHO_VENDOR := exodus

# Run these first or they will not stick
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=exodus-hammerhead

# Inherit device configuration
$(call inherit-product, device/lge/hammerhead/full_hammerhead.mk)

# Inherit exodus files.
$(call inherit-product, vendor/exodus/products/common_phones.mk)

# Copy exodus files
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/1080x1920.zip:system/media/bootanimation.zip

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := hammerhead
PRODUCT_NAME := exodus_hammerhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE

# Torch
PRODUCT_PACKAGES += Torch

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=hammerhead BUILD_FINGERPRINT=google/hammerhead/hammerhead:5.0/LRX22G/937116:user/release-keys PRIVATE_BUILD_DESC="hammerhead-user 5.0 LRX22G 937116 release-keys"
