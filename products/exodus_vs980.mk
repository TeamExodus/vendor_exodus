#Squisher Choosing
DHO_VENDOR := exodus

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.goo.rom=exodus-vs980

# Inherit device configuration
$(call inherit-product, device/lge/vs980/vs980.mk)

# Inherit common exodus files.
$(call inherit-product, vendor/exodus/products/multi_g2-common.mk)

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/exodus/products/vzw.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := vs980
PRODUCT_NAME := exodus_vs980
PRODUCT_BRAND := lge
PRODUCT_MODEL := VS980 4G
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=lge/g2_vzw/g2:5.0/LRX22G/VS98011A.1378346052:user/release-keys PRIVATE_BUILD_DESC="g2_vzw-user 5.0 LRX22G VS98011A.1378346052 release-keys"
