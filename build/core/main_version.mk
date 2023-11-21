# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# EunoiaOS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.eunoia.version=$(EUNOIA_VERSION) \
    ro.eunoia.releasetype=$(EUNOIA_BUILDTYPE) \
    ro.eunoia.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(EUNOIA_VERSION) \

# EunoiaOS Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.eunoia.display.version=$(EUNOIA_DISPLAY_VERSION)

# EunoiaOS Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.eunoia.build.version.plat.sdk=$(EUNOIA_PLATFORM_SDK_VERSION)

# EunoiaOS Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.eunoia.build.version.plat.rev=$(EUNOIA_PLATFORM_REV)
