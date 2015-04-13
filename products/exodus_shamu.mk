# when this builds, it will probably mess your phone up.
# you might want to wait to try this unless you have a giant pair of low-hanging huevos
ifneq ($(ENABLE_FORCED_ENCRYPTION),true)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=exodus-shamu
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=exodus-shamu
endif

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/1440x2560.zip:system/media/bootanimation.zip

# Inherit common phone stuff
$(call inherit-product, vendor/exodus/products/common_phones.mk)

# Enhanced NFC
$(call inherit-product, vendor/exodus/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/moto/shamu/aosp_shamu.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := exodus_shamu
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 6

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=shamu BUILD_FINGERPRINT=google/shamu/shamu:5.0.1/LRX22C/1602158:user/release-keys \
    PRIVATE_BUILD_DESC="shamu-user 5.0.1 LRX22C 1602158 release-keys"
