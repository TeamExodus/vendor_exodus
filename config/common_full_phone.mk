# Inherit common exodus stuff
$(call inherit-product, vendor/exodus/main.mk)

# Gello "shell" builds only if we have GELLO_SRC == true ,
# because we just wait it to build from here
GELLO_SRC=true

# Build essential apps to exodus rom
PRODUCT_PACKAGES += \
    Browser \
    OneTimeInitializer \
    messaging
