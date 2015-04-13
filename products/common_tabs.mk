# exodus common
$(call inherit-product, vendor/exodus/products/common.mk)

# AOSP audio packages from KK44-AOSP
# include frameworks/base/data/sounds/AudioPackage7alt.mk

# Lollipop sounds pulled from N9 system image
$(call inherit-product-if-exists, frameworks/base/data/sounds/lollipop-tablet/AllExodusAudioTablet.mk)
