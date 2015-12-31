# Inherit common Exodus stuff
$(call inherit-product, vendor/exodus/config/common_full.mk)

# Required Exodus packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Exodus LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/exodus/overlay/dictionaries


# Enable dexpreopt to reduce no. of app optimization & time.
ART_BUILD_TARGET_DEBUG := true
ART_BUILD_HOST_DEBUG := true
WITH_DEXPREOPT ?= true

# dex2oat which result in all user apps running in the interpreted mode
PRODUCT_PROPERTY_OVERRIDES += \
     dalvik.vm.dex2oat-filter=interpret-only \
     dalvik.vm.image-dex2oat-filter=speed

# Default notification/alarm/ringtone sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Helium.ogg \
    ro.config.ringtone=Themos.ogg

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/exodus/prebuilt/common/bootanimation/480.zip:system/media/bootanimation.zip
endif

$(call inherit-product, vendor/exodus/config/telephony.mk)
