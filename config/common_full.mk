# Inherit common CM stuff
$(call inherit-product, vendor/exodus/config/common.mk)

# Include CM audio files
include vendor/exodus/config/exodus_audio.mk

# Optional CM packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    SoundRecorder \
    PhotoPhase

# Extra tools in CM
PRODUCT_PACKAGES += \
    vim \
    zip \
    unrar \
    curl
