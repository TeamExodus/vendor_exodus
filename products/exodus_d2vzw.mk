#Squisher Choosing
DHO_VENDOR := exodus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=exodus-d2vzw

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/720x1280.zip:system/media/bootanimation.zip

# Inherit common exodus stuff
$(call inherit-product, vendor/exodus/products/common_phones.mk)

$(call inherit-product, device/samsung/d2vzw/full_d2vzw.mk)

# Unified device flag for Verizon permissions
VZW_UNIFIED := true

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/exodus/products/vzw.mk)

PRODUCT_NAME := exodus_d2vzw
