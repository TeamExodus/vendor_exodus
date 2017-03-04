<<<<<<< 69a744204f5ee7137548b6086ef44b3df4f0b2e4
# Copyright (C) 2016 ParanoidAndroid Project
# Copyright (C) 2016 Team Exodus
=======
# Copyright (C) 2013-2017 Paranoid Android
>>>>>>> pa: Slightly clean up the makefile
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export VENDOR := exodus

# Include versioning information
# Format: Major.minor.maintenance(-TAG)
export EXODUS_VERSION := 7.1-BETA

export ROM_VERSION := $(EXODUS_VERSION)-$(shell date -u +%Y%m%d)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(ROM_VERSION) \
    ro.exodus.version=$(EXODUS_VERSION)

WITH_DEXPREOPT ?= false

# Override undesired Google defaults
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.setupwizard.enterprise_mode=1 \
    ro.opa.eligible_device=true

# Override old AOSP default sounds with newer Google stock ones
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.alarm_alert=Osmium.ogg \
    ro.config.notification_sound=Tethys.ogg \
    ro.config.ringtone=Titania.ogg

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG ?= false

# Enable SIP+VoIP
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't Hide APNs
PRODUCT_PROPERTY_OVERRIDES += persist.sys.hideapn=false

# Include vendor overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/exodus/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/exodus/overlay/$(TARGET_PRODUCT)

# Include support for init.d scripts
PRODUCT_COPY_FILES += vendor/exodus/prebuilt/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# Include support for userinit
PRODUCT_COPY_FILES += vendor/exodus/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# init.d support
PRODUCT_COPY_FILES += vendor/exodus/prebuilt/etc/init.exodus.rc:root/init.exodus.rc

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG := false

# Include APN information
PRODUCT_COPY_FILES += vendor/exodus/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Include support for preconfigured permissions
PRODUCT_COPY_FILES += vendor/exodus/prebuilt/etc/default-permissions/exodus-permissions.xml:system/etc/default-permissions/exodus-permissions.xml

# Include support for additional filesystems
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Include support for GApps backup
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/exodus/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/exodus/prebuilt/addon.d/50-backuptool.sh:system/addon.d/50-backuptool.sh

# Build Snapdragon apps
PRODUCT_PACKAGES += \
    SnapdragonGallery \
    SnapdragonMusic \
    SnapdragonCamera \
    DocumentsUI \
    WallpaperPicker \

#Substratum helper app
PRODUCT_PACKAGES += \
    ThemeInterfacer \

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true


# TCP Connection Management
PRODUCT_PACKAGES += tcmiface
PRODUCT_BOOT_JARS += tcmiface

# LatinIME input service keypad packages
PRODUCT_PACKAGES += \
    LatinIME \

# Include Exodus LatinIME dictionaries for swypelib support
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/exodus/overlay/dictionaries

# Build sound recorder
PRODUCT_PACKAGES += SoundRecorder

# Build WallpaperPicker
PRODUCT_PACKAGES += WallpaperPicker

# Include the custom Exodus bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),480)
     PRODUCT_COPY_FILES += vendor/exodus/prebuilt/bootanimation/480.zip:system/media/bootanimation.zip
endif
ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/exodus/prebuilt/bootanimation/720.zip:system/media/bootanimation.zip
endif
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/exodus/prebuilt/bootanimation/1080.zip:system/media/bootanimation.zip
endif
ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/exodus/prebuilt/bootanimation/1440.zip:system/media/bootanimation.zip
endif

# Clear security patch level
PLATFORM_SECURITY_PATCH :=

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

ifeq ($(TARGET_BUILD_VARIANT),user)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
else
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
endif

# RCS Service
PRODUCT_PACKAGES += \
    rcscommon \
    rcscommon.xml \
    rcsservice \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_aidl_static \
    rcs_service_api \
    rcs_service_api.xml

# Bluetooth Audio (A2DP)
PRODUCT_PACKAGES += libbthost_if

# Include vendor SEPolicy changes
#include vendor/exodus/sepolicy/sepolicy.mk

# Include proprietary header flags if vendor/head exists
-include vendor/head/head-capabilities.mk
