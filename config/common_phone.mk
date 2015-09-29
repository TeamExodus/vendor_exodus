# Inherit common exodus stuff
$(call inherit-product, vendor/exodus/config/common.mk)

# only for telephony devices
$(call inherit-product, vendor/exodus/config/telephony.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)