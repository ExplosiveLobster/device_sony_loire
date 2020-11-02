# Copyright (C) 2014 The Android Open Source Project
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

# Platform path
PLATFORM_COMMON_PATH := device/sony/loire

TARGET_LEGACY_KEYMASTER := true

SOMC_PLATFORM := loire
SOMC_KERNEL_VERSION := 4.9

PRODUCT_PLATFORM_SOD := true

TARGET_BOARD_PLATFORM := msm8952

# Kernel Configuration
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_APPEND_DTB := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_VERSION := 4.9
TARGET_KERNEL_SOURCE := kernel/sony/msm-4.9
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-androidkernel-
KERNEL_TO_BUILD_ROOT_OFFSET := ../../../

# Enable llvm support for kernel
KERNEL_LLVM_SUPPORT := true

SONY_ROOT := $(PLATFORM_COMMON_PATH)/rootdir

# Wi-Fi definitions for Broadcom solution but using brcmfmac instead of bcmdhd kernel driver
BOARD_WLAN_DEVICE           := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_qcwcn

# BT definitions for Broadcom solution
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_COMMON_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := $(PLATFORM_COMMON_PATH)/bluetooth/vnd_generic.txt

# TAD
TARGET_USES_TAD_V2 := true

# RIL
TARGET_PER_MGR_ENABLED := true

# NFC
NXP_CHIP_FW_TYPE := PN547C2

# Audio
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Display
TARGET_USES_GRALLOC1 := true

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_COMMON_PATH)/overlay

# Device Specific Permissions
PRODUCT_COPY_FILES += \
     frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
     frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
     frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
     frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# Audio
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/audio_tuning_mixer_tasha.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tasha.txt \
    $(SONY_ROOT)/vendor/etc/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(SONY_ROOT)/vendor/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(SONY_ROOT)/vendor/etc/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    $(SONY_ROOT)/vendor/etc/common_primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/common_primary_audio_policy_configuration.xml

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(SONY_ROOT)/vendor/etc/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(SONY_ROOT)/vendor/etc/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# WiFi config overlay
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(SONY_ROOT)/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# NFC Configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf

# Touch IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/idc/clearpad.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/clearpad.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# RQBalance-PowerHAL configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/rqbalance_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rqbalance_config.xml

# Sensors
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/sensors/sensors_settings:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensors_settings

# Touch Screen firmware
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/firmware/touch_module_id_0x90.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0x90.img \
    $(SONY_ROOT)/vendor/firmware/touch_module_id_0x91.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0x91.img \
    $(SONY_ROOT)/vendor/firmware/touch_module_id_0x92.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0x92.img \
    $(SONY_ROOT)/vendor/firmware/touch_module_id_0x93.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0x93.img \
    $(SONY_ROOT)/vendor/firmware/touch_module_id_0x94.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0x94.img \
    $(SONY_ROOT)/vendor/firmware/touch_module_id_0xa0.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0xa0.img \
    $(SONY_ROOT)/vendor/firmware/touch_module_id_0xa1.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0xa1.img \
    $(SONY_ROOT)/vendor/firmware/touch_module_id_0xa2.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0xa2.img

# Platform specific init
PRODUCT_PACKAGES += \
    init.loire \
    init.loire.pwr \
    ueventd

# Audio
PRODUCT_PACKAGES += \
    sound_trigger.primary.msm8952 \
    audio.primary.msm8952

# GFX
PRODUCT_PACKAGES += \
    copybit.msm8952 \
    gralloc.msm8952 \
    hwcomposer.msm8952 \
    memtrack.msm8952

# BCM Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service \
    libbt-vendor

# GPS
PRODUCT_PACKAGES += \
    gps.msm8952

# CAMERA
PRODUCT_PACKAGES += \
    camera.msm8952

# Fluence
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=fluence

# aDSP sensors
## max rate
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sensors.max_accel_rate=false \
    ro.qti.sensors.max_gyro_rate=false \
    ro.qti.sensors.max_mag_rate=false \
    ro.qti.sensors.max_geomag_rotv=50

## sensor type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sdk.sensors.gestures=false \
    ro.qti.sensors.pedometer=false \
    ro.qti.sensors.step_detector=true \
    ro.qti.sensors.step_counter=true \
    ro.qti.sensors.pam=false \
    ro.qti.sensors.scrn_ortn=false \
    ro.qti.sensors.smd=true \
    ro.qti.sensors.game_rv=true \
    ro.qti.sensors.georv=true \
    ro.qti.sensors.cmc=false \
    ro.qti.sensors.bte=false \
    ro.qti.sensors.fns=false \
    ro.qti.sensors.qmd=false \
    ro.qti.sensors.amd=false \
    ro.qti.sensors.rmd=false \
    ro.qti.sensors.vmd=false \
    ro.qti.sensors.gtap=false \
    ro.qti.sensors.tap=false \
    ro.qti.sensors.facing=false \
    ro.qti.sensors.tilt=false \
    ro.qti.sensors.tilt_detector=true \
    ro.qti.sensors.dpc=false \
    ro.qti.sensors.als_scale=1 \
    ro.qti.sensors.wu=true

# VIDC configuration
## Downscalar
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.dec.enable.downscalar=1 \
    vidc.dec.downscalar_width=1920 \
    vidc.dec.downscalar_height=1088

## Others
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.enc.disable_bframes=1 \
    vidc.enc.disable_pframes=1 \
    vidc.disable.split.mode=1

## Avoid unsupported UBWC buffers on VENC
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gralloc.gfx_ubwc_disable=1 \
    vendor.gralloc.enable_fb_ubwc=0 \
    vendor.gralloc.disable_ubwc=1

# Use MSM8956 feature set for vidc encoders
PRODUCT_PROPERTY_OVERRIDES += \
    media.msm8956hw=1

# SurfaceFlinger
# Keep in sync with NUM_FRAMEBUFFER_SURFACE_BUFFERS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3

# Skip loading libsdmextension.so and libsdm-color.so in display hal
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.skip_extension_intf=1 \
    vendor.display.skip_color_intf=1

# USB controller setup
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.controller=msm_hsusb \
    sys.usb.rndis.func.name=rndis_bam

# WiFi MAC address path
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wifi.addr_path=/sys/devices/platform/soc/soc:bcmdhd_wlan/macaddr

# setup dm-verity configs.
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/7824900.sdhci/by-name/system
$(call inherit-product, device/sony/common/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, build/target/product/verity.mk)

# HAL3
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.HAL3.enabled=1

# Audio DLKM
PRODUCT_PACKAGES += \
    audio_apr.ko \
    audio_q6_notifier.ko \
    audio_adsp_loader.ko \
    audio_q6.ko \
    audio_usf.ko \
    audio_pinctrl_wcd.ko \
    audio_swr.ko \
    audio_wcd_core.ko \
    audio_swr_ctrl.ko \
    audio_wsa881x.ko \
    audio_wsa881x_analog.ko \
    audio_platform.ko \
    audio_cpe_lsm.ko \
    audio_hdmi.ko \
    audio_stub.ko \
    audio_wcd9xxx.ko \
    audio_mbhc.ko \
    audio_wcd9335.ko \
    audio_wcd_cpe.ko \
    audio_digital_cdc.ko \
    audio_analog_cdc.ko \
    audio_native.ko \
    audio_machine_sdm450.ko \
    audio_machine_ext_sdm450.ko

# Kernel Modules Config
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/init.insmod.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.cfg
