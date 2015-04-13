#Squisher Choosing
DHO_VENDOR := exodus

# Tablet Overlays no radios
    PRODUCT_PACKAGE_OVERLAYS += vendor/exodus/overlay/tab_no_radio

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/exodus/proprietary/boot_animations/1080x1920.zip:system/media/bootanimation.zip

# Inherit AOSP device configuration for wx_na_wf
$(call inherit-product, device/nvidia/wx_na_wf/full_wx_na_wf.mk)

# Inherit common product files.
$(call inherit-product, vendor/exodus/products/common_tabs.mk)

# Setup device specific product configuration.
PRODUCT_NAME := exodus_wx_na_wf
PRODUCT_DEVICE := wx_na_wf
PRODUCT_MODEL := Shieldtablet
PRODUCT_MANUFACTURER := nvidia
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=wx_na_wf \
    TARGET_DEVICE=shieldtablet \
    BUILD_FINGERPRINT="nvidia/wx_na_wf/shieldtablet:5.0.1/LRX22C/29082_493.9700:user/release-keys" \
    PRIVATE_BUILD_DESC="wx_na_wf-user 5.0.1 LRX22C 29082_493.9700 release-keys"
