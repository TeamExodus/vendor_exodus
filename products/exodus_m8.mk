#Squisher Choosing
DHO_VENDOR := exodus

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.goo.rom=exodus-m8

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/1080x1920.zip:system/media/bootanimation.zip

# Inherit device configuration
$(call inherit-product, device/htc/m8/full_m8.mk)

# Inherit common exodus files.
$(call inherit-product, vendor/exodus/products/common_phones.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m8
PRODUCT_NAME := exodus_m8
PRODUCT_BRAND := HTC
PRODUCT_MANUFACTURER := HTC
PRODUCT_MODEL := m8
