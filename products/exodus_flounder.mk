# CyanogenMod Specific Changes

# Boot animation
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536

# Inherit some common stuff.
$(call inherit-product, vendor/exodus/config/common_full_tablet_wifionly.mk)

# Enhanced NFC
$(call inherit-product, vendor/exodus/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/htc/flounder/aosp_flounder.mk)

$(call inherit-product-if-exists, vendor/htc/flounder/device-vendor.mk)

# Inline kernel building
#TARGET_PREBUILT_KERNEL := device/htc/flounder-kernel/kernel
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/htc/flounder
TARGET_KERNEL_CONFIG := flounder_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE := androidboot.selinux=enforcing
TARGET_PREBUILT_KERNEL := false

ifneq ($(TARGET_PREBUILT_KERNEL),)
  ifneq ("$(wildcard $(TARGET_PREBUILT_KERNEL))","")
    PRODUCT_COPY_FILES += \
      $(TARGET_PREBUILT_KERNEL):$(ANDROID_BUILD_TOP)/out/target/product/$(TARGET_DEVICE)/kernel
  else
    ifneq ($(TARGET_PREBUILT_KERNEL),false)
      $(error no prebuilt kernel exists on path $(TARGET_PREBUILT_KERNEL)!!)
    endif
  endif
endif

# Enable USB OTG (CAF commit to Settings)
ADDITIONAL_BUILD_PROPERTIES += \
    persist.sys.isUsbOtgEnabled=true

# Extra Packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras

# CM Overlays
#DEVICE_PACKAGE_OVERLAYS += device/htc/flounder/overlay-cm

# Enable USB OTG (CAF commit to Settings)
ADDITIONAL_BUILD_PROPERTIES += \
    persist.sys.isUsbOtgEnabled=true

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=flounder \
    BUILD_FINGERPRINT=google/volantis/flounder:5.1.1/LMY48I/2074855:user/release-keys \
    PRIVATE_BUILD_DESC="volantis-user 5.1.1 LMY48I 2074855 release-keys"

## Device identifier. This must come after all inclusions
PRODUCT_NAME := exodus_flounder
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 9
