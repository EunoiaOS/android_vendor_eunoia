# Copyright (C) 2018-23 The EunoiaOS Project
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

#EunoiaOS Versioning :
EUNOIA_MOD_VERSION = Ucup-Alpha

ifndef EUNOIA_BUILD_TYPE
    EUNOIA_BUILD_TYPE := UNOFFICIAL
endif

# Test Build Tag
ifeq ($(EUNOIA_TEST),true)
    EUNOIA_BUILD_TYPE := DEVELOPER
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
EUNOIA_BUILD_DATE_UTC := $(shell date -u '+%Y%m%d-%H%M')
BUILD_DATE_TIME := $(shell date -u '+%Y%m%d%H%M')

ifeq ($(EUNOIA_OFFICIAL), true)
   LIST = $(shell cat vendor/eunoia/build/eunoia.devices)
    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      IS_OFFICIAL=true
      EUNOIA_BUILD_TYPE := OFFICIAL

#include vendor/eunoia-priv/keys.mk
# PRODUCT_PACKAGES += \
#    Updater

    endif
    ifneq ($(IS_OFFICIAL), true)
       EUNOIA_BUILD_TYPE := COMMUNITY
       $(error Device is not official "$(CURRENT_DEVICE)")
    endif
endif

ifeq ($(BUILD_WITH_GAPPS),true)
EUNOIA_EDITION := GAPPS
else
EUNOIA_EDITION := Vanilla
endif

ifeq ($(EUNOIA_EDITION), GAPPS)
EUNOIA_VERSION := EunoiaOS-$(EUNOIA_MOD_VERSION)-$(CURRENT_DEVICE)-$(EUNOIA_EDITION)-$(EUNOIA_BUILD_TYPE)-$(EUNOIA_BUILD_DATE_UTC)
EUNOIA_FINGERPRINT := EunoiaOS/$(EUNOIA_MOD_VERSION)/$(PLATFORM_VERSION)/$(EUNOIA_BUILD_DATE_UTC)
EUNOIA_DISPLAY_VERSION := EunoiaOS-$(EUNOIA_MOD_VERSION)-$(EUNOIA_BUILD_TYPE)
else
EUNOIA_VERSION := EunoiaOS-$(EUNOIA_MOD_VERSION)-$(CURRENT_DEVICE)-$(EUNOIA_BUILD_TYPE)-$(EUNOIA_BUILD_DATE_UTC)
EUNOIA_FINGERPRINT := EunoiaOS/$(EUNOIA_MOD_VERSION)/$(PLATFORM_VERSION)/$(EUNOIA_BUILD_DATE_UTC)
EUNOIA_DISPLAY_VERSION := EunoiaOS-$(EUNOIA_MOD_VERSION)-$(EUNOIA_BUILD_TYPE)
endif

TARGET_PRODUCT_SHORT := $(subst EUNOIA_,,$(EUNOIA_BUILD))

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.eunoia.version=$(EUNOIA_VERSION) \
  ro.eunoia.releasetype=$(EUNOIA_BUILD_TYPE) \
  ro.modversion=$(EUNOIA_MOD_VERSION) \
  ro.eunoia.display.version=$(EUNOIA_DISPLAY_VERSION) \
  ro.eunoia.fingerprint=$(EUNOIA_FINGERPRINT) \
  ro.build.datetime=$(BUILD_DATE_TIME) \
  ro.eunoia.edition=$(EUNOIA_EDITION)