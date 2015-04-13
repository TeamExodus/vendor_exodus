#Squisher Choosing
DHO_VENDOR := exodus

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.goo.rom=exodus-find7s

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/1080x1920.zip:system/media/bootanimation.zip

# Inherit device configuration
$(call inherit-product, device/oppo/find7s/full_find7s.mk)

# Inherit common exodus files.
$(call inherit-product, vendor/exodus/products/common_phones.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := exodus_find7s
PRODUCT_DEVICE := find7s
PRODUCT_BRAND := OPPO
PRODUCT_MANUFACTURER := OPPO
PRODUCT_MODEL := Find 7
PRODUCT_GMS_CLIENTID_BASE := android-oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=5.0/LRX22G/1390465867:user/release-keys \
    PRIVATE_BUILD_DESC="msm8974-user 5.0 KVT49L eng.root.20141017.144947 release-keys"