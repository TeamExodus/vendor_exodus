# Inherit common Exodus stuff
$(call inherit-product, vendor/exodus/config/common.mk)

# Include Exodus audio files
include vendor/exodus/config/exodus_audio.mk

# Optional Exodus packages
PRODUCT_PACKAGES += \
    SoundRecorder \
    Screencast \
    ExodusWallpapers

# Extra tools in Exodus
PRODUCT_PACKAGES += \
    7z \
    lib7z \
    bash \
    bzip2 \
    curl \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip
