#Squisher Choosing
DHO_VENDOR := exodus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=exodus-xt907

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/540x960.zip:system/media/bootanimation.zip

$(call inherit-product, device/motorola/xt907/full_xt907.mk)

# Inherit common phone stuff
$(call inherit-product, vendor/exodus/products/common_phones.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=exodus_xt907 \
    TARGET_DEVICE=xt907

PRODUCT_NAME := exodus_xt907
PRODUCT_DEVICE := xt907
