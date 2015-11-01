# Inherit common stuff
$(call inherit-product, vendor/exodus/config/common.mk)

# Optional packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    SoundRecorder \
    PhotoPhase

# Extra tools
PRODUCT_PACKAGES += \
    vim \
    zip \
    unrar \
    curl
