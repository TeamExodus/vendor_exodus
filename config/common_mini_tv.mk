# Inherit common CM stuff
$(call inherit-product, vendor/cm/config/common.mk)

# Include CM audio files
include vendor/cm/config/exodus_audio.mk

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/cm/prebuilt/common/bootanimation/800.zip:system/media/bootanimation.zip
endif
