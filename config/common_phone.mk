# Inherit common exodus stuff
$(call inherit-product, vendor/exodus/config/common.mk)

# only for telephony devices
$(call inherit-product, vendor/exodus/config/telephony.mk)
