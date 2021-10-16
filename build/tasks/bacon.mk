# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The EunoiaOS Project
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

# -----------------------------------------------------------------
# Eunoia OTA update package

EUNOIA_TARGET_PACKAGE := $(PRODUCT_OUT)/$(EUNOIA_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

CL_PRP="\033[35m"
CL_RED="\033[31m"
CL_GRN="\033[32m"

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(EUNOIA_TARGET_PACKAGE)
	$(hide) $(SHA256) $(EUNOIA_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(EUNOIA_TARGET_PACKAGE).sha256sum
	echo -e ${CL_BLD}${CL_GRN}"===============================-Package complete-==============================="${CL_GRN}
	echo -e ${CL_BLD}${CL_RED}"Zip: "${CL_GRN} $(EUNOIA_TARGET_PACKAGE)${CL_RST}
	echo -e ${CL_BLD}${CL_RED}"SHA256: "${CL_GRN}" `cat $(EUNOIA_TARGET_PACKAGE).sha256sum | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_RED}"Size:"${CL_GRN}" `du -sh $(EUNOIA_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_RED}"TimeStamp:"${CL_GRN}" `cat $(PRODUCT_OUT)/system/build.prop | grep ro.build.date.utc | cut -d'=' -f2 | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_RED}"Integer Value:"${CL_GRN}" `wc -c $(EUNOIA_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_GRN}"================================================================================"${CL_RED}
