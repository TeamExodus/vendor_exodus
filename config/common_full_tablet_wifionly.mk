# Inherit common CM stuff
$(call inherit-product, vendor/exodus/config/common_full.mk)

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME

# Include CM LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/exodus/overlay/dictionaries

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/exodus/prebuilt/common/bootanimation/800.zip:system/media/bootanimation.zip
endif
