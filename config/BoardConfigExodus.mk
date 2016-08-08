# Charger
ifneq ($(WITH_EXODUS_CHARGER),false)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.exodus
endif
