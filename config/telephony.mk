# World APN list
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/exodus/prebuilt/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dun.override=0
