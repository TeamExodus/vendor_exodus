# when this builds, it will probably mess your phone up.
# you might want to wait to try this unless you have a giant pair of low-hanging huevos

ENABLE_FORCED_ENCRYPTION := true
$(call inherit-product, vendor/exodus/products/exodus_shamu.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := exodus_shamu_encrypted
