# Required packages
PRODUCT_PACKAGES += \
    Aperture \
    DocumentsUI \
    DocumentsUIOverlay \
    LatinIME \
    Launcher3QuickStep \
    messaging \
    NetworkStackOverlay \
    Stk \
    ThemePicker \
    ThemesStub

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/eunoia/overlay \
    vendor/eunoia/overlay/no-rro

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/eunoia/overlay/common \
    vendor/eunoia/overlay/no-rro

# Include eunoia LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/eunoia/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/eunoia/overlay/dictionaries

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images \
    product_charger_res_images_vendor

# Extra tools
PRODUCT_PACKAGES += \
    curl \
    getcap \
    setcap

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/curl \
    system/bin/getcap \
    system/bin/setcap

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/procmem
endif

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/prebuilts/common/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml
