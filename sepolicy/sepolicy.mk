BOARD_SEPOLICY_DIRS += \
    vendor/exodus/sepolicy

BOARD_SEPOLICY_UNION += \
    genfs_contexts \
    installd.te \
    system.te \
    system_app.te \
    ueventd.te \
    vold.te
