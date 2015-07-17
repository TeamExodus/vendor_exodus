# Inherit common CM stuff
$(call inherit-product, vendor/exodus/config/common.mk)

# Include CM audio files
include vendor/exodus/config/exodus_audio.mk

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/exodus/prebuilt/common/bootanimation/800.zip:system/media/bootanimation.zip
endif
