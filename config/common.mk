PRODUCT_BRAND ?= exodus

ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/exodus/prebuilt/common/bootanimation))
bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(TARGET_BOOTANIMATION_NAME)" ]; then
    if [ $(1) -le $(TARGET_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

PRODUCT_BOOTANIMATION := vendor/exodus/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip
endif


PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=exodus


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Recovery: Make a non secure erase (by default) for faster wipe and less chance to damage the device
BOARD_SUPPRESS_SECURE_ERASE := true
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# SuperSU
PRODUCT_COPY_FILES += \
   vendor/exodus/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
   vendor/exodus/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon


# Backup Tool
ifneq ($(WITH_GMS),true)
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/exodus/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/exodus/prebuilt/common/bin/50-exodus.sh:system/addon.d/50-exodus.sh \
    vendor/exodus/prebuilt/common/bin/blacklist:system/addon.d/blacklist
endif

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/exodus/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# Exodus-specific init file
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/common/etc/init.local.rc:root/init.exodus.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is Exodus!
PRODUCT_COPY_FILES += \
    vendor/exodus/config/permissions/com.exodus.android.xml:system/etc/permissions/com.exodus.android.xml

# Live lockscreen
PRODUCT_COPY_FILES += \
    vendor/exodus/config/permissions/org.cyanogenmod.livelockscreen.xml:system/etc/permissions/org.cyanogenmod.livelockscreen.xml

# Required Exodus packages
PRODUCT_PACKAGES += \
    Development \
    BluetoothExt \
    Profiles \
    ExodusUpdater \
    OpenDelta

# Optional Exodus packages
PRODUCT_PACKAGES += \
    libemoji \
    Terminal

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni

# Custom Exodus packages
PRODUCT_PACKAGES += \
    Snap \
    Launcher3 \
    AudioFX \
    toybox \
    DeskClock \
    LiveWallpapersPicker \
    masquerade

# Layers Backup
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/common/addon.d/71-layers.sh:system/addon.d/71-layers.sh

# CM Platform Library
#PRODUCT_PACKAGES += \
#    org.cyanogenmod.platform-res \
#    org.cyanogenmod.platform \
#    org.cyanogenmod.platform.xml

# Exodus Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in Exodus
PRODUCT_PACKAGES += \
    libsepol \
    mke2fs \
    tune2fs \
    nano \
    htop \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    pigz

WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank
endif


PRODUCT_PACKAGE_OVERLAYS += vendor/exodus/overlay/common

PRODUCT_VERSION_MAJOR = 6
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0-RC0

# Set EXODUS_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef EXODUS_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "EXODUS_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^EXODUS_||g')
        EXODUS_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to PRIVATE
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(EXODUS_BUILDTYPE)),)
    EXODUS_BUILDTYPE :=
endif

ifdef EXODUS_BUILDTYPE
    ifneq ($(EXODUS_BUILDTYPE), SNAPSHOT)
        ifdef EXODUS_EXTRAVERSION
            # Force build type to EXPERIMENTAL
            EXODUS_BUILDTYPE := EXPERIMENTAL
            # Remove leading dash from EXODUS_EXTRAVERSION
            EXODUS_EXTRAVERSION := $(shell echo $(EXODUS_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to EXODUS_EXTRAVERSION
            EXODUS_EXTRAVERSION := -$(EXODUS_EXTRAVERSION)
        endif
    else
        ifndef EXODUS_EXTRAVERSION
            # Force build type to EXPERIMENTAL, SNAPSHOT mandates a tag
            EXODUS_BUILDTYPE := EXPERIMENTAL
        else
            # Remove leading dash from EXODUS_EXTRAVERSION
            EXODUS_EXTRAVERSION := $(shell echo $(EXODUS_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to EXODUS_EXTRAVERSION
            EXODUS_EXTRAVERSION := -$(EXODUS_EXTRAVERSION)
        endif
    endif
else
    # If EXODUS_BUILDTYPE is not defined, set to PRIVATE
    EXODUS_BUILDTYPE := PRIVATE
    EXODUS_EXTRAVERSION :=
endif

ifeq ($(EXODUS_BUILDTYPE), PRIVATE)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        EXODUS_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

ifeq ($(EXODUS_BUILDTYPE), RELEASE)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
        EXODUS_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(EXODUS_BUILD)
    else
        ifeq ($(TARGET_BUILD_VARIANT),user)
            EXODUS_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TARGET_VENDOR_RELEASE_BUILD_ID)-$(EXODUS_BUILD)
        else
            EXODUS_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(EXODUS_BUILD)
        endif
    endif
else
    EXODUS_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date -u +%Y%m%d)-$(EXODUS_BUILDTYPE)$(EXODUS_EXTRAVERSION)-$(EXODUS_BUILD)
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.exodus.version=$(EXODUS_VERSION) \
  ro.exodus.releasetype=$(EXODUS_BUILDTYPE) \
  ro.modversion=$(EXODUS_VERSION) \

EXODUS_DISPLAY_VERSION := $(EXODUS_VERSION)

ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),)
ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),build/target/product/security/testkey)
  ifneq ($(EXODUS_BUILDTYPE), PRIVATE)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
      ifneq ($(EXODUS_EXTRAVERSION),)
        # Remove leading dash from EXODUS_EXTRAVERSION
        EXODUS_EXTRAVERSION := $(shell echo $(EXODUS_EXTRAVERSION) | sed 's/-//')
        TARGET_VENDOR_RELEASE_BUILD_ID := $(EXODUS_EXTRAVERSION)
      else
        TARGET_VENDOR_RELEASE_BUILD_ID := $(shell date -u +%Y%m%d)
      endif
    else
      TARGET_VENDOR_RELEASE_BUILD_ID := $(TARGET_VENDOR_RELEASE_BUILD_ID)
    endif
    EXODUS_DISPLAY_VERSION=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TARGET_VENDOR_RELEASE_BUILD_ID)
  endif
endif
endif

# Enable dexpreopt to reduce no. of app optimization & time.
OS_TYPE := $(shell uname -s)
#ifneq ($(OS_TYPE),Darwin)
#    WITH_DEXPREOPT ?= true
#else
    WITH_DEXPREOPT := false
#endif

# Overlays & Include LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += \
	vendor/exodus/overlay/common \
	vendor/exodus/overlay/dictionaries

# Proprietary latinime libs needed for Keyboard swyping
ifneq ($(filter arm64,$(TARGET_ARCH)),)
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.exodus.display.version=$(EXODUS_DISPLAY_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.android.display.version=$(PLATFORM_DISPLAY_VERSION)

ifeq ($(TARGET_USES_EXODUS_BSP),true)
-include vendor/exodus/proprietary/common/config/device-vendor.mk
endif

-include $(WORKSPACE)/build_env/image-auto-bits.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
