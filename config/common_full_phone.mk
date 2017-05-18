# Inherit common exodus stuff
$(call inherit-product, vendor/exodus/main.mk)

# Build essential apps to exodus rom
PRODUCT_PACKAGES += \
    OneTimeInitializer \
    messaging \
    MusicFX \

PRODUCT_COPY_FILES += \
        frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf
