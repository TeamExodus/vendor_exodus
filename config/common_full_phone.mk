# Inherit common Exodus stuff
$(call inherit-product, vendor/exodus/config/common_full.mk)

# Required Exodus packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Exodus LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/exodus/overlay/dictionaries

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Helium.ogg

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/exodus/prebuilt/common/bootanimation/480.zip:system/media/bootanimation.zip
endif

$(call inherit-product, vendor/exodus/config/telephony.mk)
