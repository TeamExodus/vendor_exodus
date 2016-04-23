# Inherit common Exodus stuff
$(call inherit-product, vendor/exodus/config/common.mk)

# Include Exodus audio files
include vendor/exodus/config/exodus_audio.mk

# Optional Exodus packages
PRODUCT_PACKAGES += \
    SoundRecorder \
    Screencast \

# packages for Wallpaper and livewallpaper on desktop options
PRODUCT_PACKAGES += \
    ExodusWallpapers \
    LiveWallpapers \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \


# Required Exodus packages
PRODUCT_PACKAGES += \
    LatinIME \
    Camera2

# Extra tools in Exodus
PRODUCT_PACKAGES += \
    7z \
    lib7z \
    bash \
    busybox \
    bzip2 \
    curl \
    powertop \
    unrar \
    vim \
    wget \
    zip
