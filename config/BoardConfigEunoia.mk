include vendor/eunoia/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/eunoia/config/BoardConfigQcom.mk
endif

include vendor/eunoia/config/BoardConfigSoong.mk
