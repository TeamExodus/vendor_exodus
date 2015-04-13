#Squisher Choosing
DHO_VENDOR := exodus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=exodus-xt926

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/540x960.zip:system/media/bootanimation.zip

$(call inherit-product, device/motorola/xt926/full_xt926.mk)

# Inherit common phone stuff
$(call inherit-product, vendor/exodus/products/common_phones.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=exodus_xt926 \
    TARGET_DEVICE=xt926

PRODUCT_NAME := exodus_xt926
PRODUCT_DEVICE := xt926
