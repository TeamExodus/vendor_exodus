#Squisher Choosing
DHO_VENDOR := exodus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=exodus-jfltevzw

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/1080x1920.zip:system/media/bootanimation.zip

# Inherit device repo
$(call inherit-product, device/samsung/jfltevzw/full_jfltevzw.mk)

# Inherit common product files.
NO_DRM_BLOBS := true
$(call inherit-product, vendor/exodus/products/common_phones.mk)

# Unified device flag for Verizon permissions
VZW_UNIFIED := true

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/exodus/products/vzw.mk)

#Tagging
PRODUCT_NAME := exodus_jfltevzw
