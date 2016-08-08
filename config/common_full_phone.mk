# Inherit common exodus stuff
$(call inherit-product, vendor/exodus/main.mk)

# Build essential apps to exodus rom
PRODUCT_PACKAGES += \
    Browser \
    OneTimeInitializer \
    messaging

