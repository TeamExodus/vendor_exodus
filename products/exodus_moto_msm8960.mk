#Squisher Choosing
DHO_VENDOR := exodus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=exodus-moto_msm8960

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/540x960.zip:system/media/bootanimation.zip

$(call inherit-product, device/motorola/moto_msm8960/full_moto_msm8960.mk)

# Inherit common phone stuff
$(call inherit-product, vendor/exodus/products/common_phones.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=moto_msm8960 \
    TARGET_DEVICE=moto_msm8960

PRODUCT_NAME := exodus_moto_msm8960
PRODUCT_DEVICE := moto_msm8960
