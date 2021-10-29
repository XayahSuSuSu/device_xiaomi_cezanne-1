#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/xiaomi/cezanne/device.mk)

# Inherit from the DotOS configuration.
$(call inherit-product, vendor/dot/config/common.mk)

PRODUCT_NAME := dot_cezanne
PRODUCT_DEVICE := cezanne
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := M2006J10C
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Redmi/cezanne/cezanne:11/RP1A.200720.011/V12.5.5.0.RJNCNXM:user/release-keys
