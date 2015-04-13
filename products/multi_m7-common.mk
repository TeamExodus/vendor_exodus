# Variable for zip installerscript spam about kernel
KERNEL_SPAM := WHY DOESNT THIS JUST WORK AMGGGG #not related to the kernel... but this build step didn't work anyways, so lulpwned.

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/1080x1920.zip:system/media/bootanimation.zip

# Inherit common phone stuff
$(call inherit-product, vendor/exodus/products/common_phones.mk)

# OPT OUT of moto blobs
QCOM_FORCE_NONMOTO_DALVIK := true

#$(call inherrit-product, vendor/exodus/tweaks/m7/tweaks.mk
