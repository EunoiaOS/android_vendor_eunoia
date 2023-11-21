# Inherit common mobile Eunoia stuff
$(call inherit-product, vendor/eunoia/config/common.mk)

# Include AOSP audio files
include vendor/eunoia/config/aosp_audio.mk

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true
