# Release name
PRODUCT_RELEASE_NAME := falcon

PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/720x1280.zip:system/media/bootanimation.zip 
#Squisher Choosing
DHO_VENDOR := exodus

# Inherit device configuration
$(call inherit-product, device/motorola/falcon/full_falcon.mk)

# Inherit common phone stuff
$(call inherit-product, vendor/exodus/products/common_phones.mk)

# device name
PRODUCT_RELEASE_NAME := MOTO G
PRODUCT_NAME := exodus_falcon
PRODUCT_DEVICE := falcon
PRODUCT_BRAND := motorola
PRODUCT_MODEL := MOTO G
PRODUCT_MANUFACTURER := MOTOROLA
