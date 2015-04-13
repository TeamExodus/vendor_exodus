#Squisher Choosing
DHO_VENDOR := exodus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=exodus-jflteusc

# Variable for zip installerscript spam about kernel
KERNEL_SPAM := WHY DOESNT THIS JUST WORK AMGGGG #not related to the kernel... but this build step didn't work anyways, so lulpwned.

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/1080x1920.zip:system/media/bootanimation.zip

# Inherit device repo
$(call inherit-product, device/samsung/jflteusc/full_jflteusc.mk)

# Inherit common product files.
NO_DRM_BLOBS := true
$(call inherit-product, vendor/exodus/products/common_phones.mk)

#Tagging
PRODUCT_NAME := exodus_jflteusc
