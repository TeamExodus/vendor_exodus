#Squisher Choosing
DHO_VENDOR := exodus

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.goo.rom=exodus-bacon

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/1080x1920.zip:system/media/bootanimation.zip

# Inherit device configuration
$(call inherit-product, device/oneplus/bacon/full_bacon.mk)

# Inherit common bacon files.
$(call inherit-product, vendor/exodus/products/common_phones.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := bacon
PRODUCT_NAME := exodus_bacon
PRODUCT_BRAND := oneplus
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := A0001
PRODUCT_GMS_CLIENTID_BASE := android-oneplus
TARGET_CONTINUOUS_SPLASH_ENABLED := true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=oneplus/bacon/A0001:5.0/LRX22G/XNPH25R:user/release-keys PRIVATE_BUILD_DESC="bacon-user 5.0 LRX22G XNPH25R release-keys"
