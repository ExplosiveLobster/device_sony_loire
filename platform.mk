# Copyright 2021, Pavel Dubrova <pashadubrova@gmail.com>
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

LOCAL_PATH := device/sony/loire

TARGET_BOARD_PLATFORM := msm8952

# Platform overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# The first api level, device has been commercially launced on
PRODUCT_SHIPPING_API_LEVEL := 23

PRODUCT_USE_VNDK_OVERRIDE := true

# Build boot.img
PRODUCT_BUILD_BOOT_IMAGE := true

# Build recovery.img
PRODUCT_BUILD_RECOVERY_IMAGE := true

# Used only by Sony fingerprint HAL
SOMC_PLATFORM := loire

PRODUCT_PLATFORM_SOD := true

# Kernel Configuration
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_APPEND_DTB := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_VERSION := 4.9
TARGET_KERNEL_SOURCE := kernel/sony/msm-$(TARGET_KERNEL_VERSION)
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-androidkernel-
KERNEL_TO_BUILD_ROOT_OFFSET := ../../../
KERNEL_LLVM_SUPPORT := true

# setup dm-verity configs.
#PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/by-name/system
#PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/by-name/oem
#$(call inherit-product, build/target/product/verity.mk)

# Display
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_QCOM_DISPLAY_BSP := true
TARGET_USES_COLOR_METADATA := true
TARGET_USES_DRM_PP := true
TARGET_HAS_WIDE_COLOR_DISPLAY := true

# Wi-Fi
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd

# Define brcmfmac as the wifi driver
WIFI_DRIVER_BUILT := brcmfmac

# Audio Configuration
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(LOCAL_PATH)/rootdir/vendor/etc/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/rootdir/vendor/etc/audio_tuning_mixer_tasha.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tasha.txt \
    $(LOCAL_PATH)/rootdir/vendor/etc/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/rootdir/vendor/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

# Codecs Configuration
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# IRQBalance Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/etc/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/adsprpcd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/adsprpcd.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/charger.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/charger.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/ims_rtp_daemon.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/ims_rtp_daemon.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/imsdatadaemon.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/imsdatadaemon.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/imsqmidaemon.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/imsqmidaemon.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/ipacm.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/ipacm.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/irsc_util.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/irsc_util.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/mlog_qmi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/mlog_qmi.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/msm_irqbalance.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/msm_irqbalance.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/netmgrd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/netmgrd.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/pm-proxy.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/pm-proxy.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/pm-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/pm-service.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/qmuxd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/qmuxd.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/qseecomd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/qseecomd.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/rmt_storage.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rmt_storage.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/sct_service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/sct_service.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/sensors.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/sensors.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/ta_qmi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/ta_qmi.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/tad2.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/tad2.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/tftp_server.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/tftp_server.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/wpa_supplicant.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/wpa_supplicant.rc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# Media Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/etc/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/rootdir/vendor/etc/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/rootdir/vendor/etc/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# NFC Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/etc/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# QMI Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/etc/data/dsi_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/dsi_config.xml \
    $(LOCAL_PATH)/rootdir/vendor/etc/data/netmgr_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/rootdir/vendor/etc/data/qmi_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/qmi_config.xml

# Sec Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/etc/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/etc/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# Sensors Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/etc/sensors/sensors_settings:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensors_settings

# Touchscreen IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/usr/idc/clearpad.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/clearpad.idc

# Touchscreen firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/firmware/touch_module_id_0x90.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0x90.img \
    $(LOCAL_PATH)/rootdir/vendor/firmware/touch_module_id_0x91.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0x91.img \
    $(LOCAL_PATH)/rootdir/vendor/firmware/touch_module_id_0x92.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0x92.img \
    $(LOCAL_PATH)/rootdir/vendor/firmware/touch_module_id_0x93.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0x93.img \
    $(LOCAL_PATH)/rootdir/vendor/firmware/touch_module_id_0x94.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0x94.img \
    $(LOCAL_PATH)/rootdir/vendor/firmware/touch_module_id_0xa0.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0xa0.img \
    $(LOCAL_PATH)/rootdir/vendor/firmware/touch_module_id_0xa1.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0xa1.img \
    $(LOCAL_PATH)/rootdir/vendor/firmware/touch_module_id_0xa2.img:$(TARGET_COPY_OUT_VENDOR)/firmware/touch_module_id_0xa2.img

# Ueventd
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc

# Wi-Fi Configuration
PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    hardware/broadcom/wlan/bcmdhd/config/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.audio@6.0 \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.common@6.0 \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio.effect@6.0 \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.soundtrigger@2.2-impl \
    audio.primary.msm8952 \
    sound_trigger.primary.msm8952 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service \
    libbt-vendor

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl:32 \
    android.hardware.camera.provider@2.4-service \
    libmmcamera_interface \
    libmmjpeg_interface \
    libmmlib2d_interface \
    libqomx_core \
    camera.msm8952

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.1-service

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-impl \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.graphics.mapper@2.0-impl-qti-display \
    vendor.qti.hardware.display.allocator@1.0-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    gralloc.msm8952 \
    lights.msm8952 \
    hwcomposer.msm8952 \
    memtrack.msm8952 \
    libqdutils \
    libqdMetaData.vendor \
    libdisplayconfig.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service-lazy \
    android.hardware.drm@1.3-service-lazy.clearkey

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.sony

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti \
    gps.conf \
    flp.conf \
    gnss_antenna_info.conf \
    libloc_pla_headers \
    liblocation_api_headers \
    libgps.utils_headers \
    liblocation_api \
    libgps.utils \
    libbatching \
    libgeofencing \
    libloc_core \
    libgnss

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service \
    libhealthd.msm

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Location
PRODUCT_PACKAGES += \
    libloc_api_v02 \
    libgnsspps \
    libsynergy_loc_api \
    izat_remote_api_headers \
    loc_sll_if_headers

# Media
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libc2dcolorconvert \
    libOmxSwVdec \
    libOmxSwVencMpeg4 \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    NfcNci \
    Tag

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.0-service \
    power.msm8952

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# Usb HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    wpa_supplicant \
    wpa_supplicant.conf \
    libwpa_client \
    hostapd

# Blobs dependency
PRODUCT_PACKAGES += \
    libhwbinder.vendor \
    libhidltransport.vendor

# Include vndk/vndk-sp/ll-ndk modules
PRODUCT_PACKAGES += \
    vndk_package

# IPA
PRODUCT_PACKAGES += \
    IPACM_cfg.xml \
    ipacm

# NFC firmware
PRODUCT_PACKAGES += \
    libpn547_fw

# OSS WIFI and BT MAC tool
PRODUCT_PACKAGES += \
    macaddrsetup

# OSS Time service
PRODUCT_PACKAGES += \
    TimeKeep \
    timekeep

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat

# Telephony
PRODUCT_PACKAGES += \
    QcRilAm \
    Stk

# QCOM Data
PRODUCT_PACKAGES += \
    librmnetctl

# aDSP Sensors
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
    ro.qti.sensors.qheart=false \
    ro.qti.sensors.wu=true \
    ro.qti.sensors.proximity=true \
    ro.qti.sensors.gravity=true \
    ro.qti.sensors.laccel=true \
    ro.qti.sensors.orientation=true \
    ro.qti.sensors.rotvec=true \
    ro.qti.sensors.fast_amd=false \
    ro.qti.sensors.wrist_tilt=false \
    ro.qti.sensors.pug=false \
    ro.qti.sensors.iod=false \
    ro.qfusion_use_report_period=false \
    ro.qti.sensors.dev_ori=false \
    ro.qti.sensors.pmd=false \
    ro.qti.sensors.sta_detect=false \
    ro.qti.sensors.mot_detect=false \
    ro.qti.sensors.als_scale=1

# Audio Configs
# Reduce client buffer size for fast audio output tracks
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1

# Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio_hal.period_size=192

# fluencetype can be "fluence" or "fluencepro" or "none"
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.audio.sdk.fluencetype=none \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    persist.vendor.audio.fluence.speaker=true

# Disable tunnel encoding
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.tunnel.encode=false

# Buffer size in kbytes for compress offload playback
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.offload.buffer.size.kb=64

# Minimum duration for offload playback in secs
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.min.duration.secs=30

# Enable offload audio video playback by default
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.video=true

# Enable audio track offload by default
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.offload.track.enable=true

# Enable music through deep buffer
PRODUCT_PROPERTY_OVERRIDES += \
    audio.deep_buffer.media=true

# Enable voice path for PCM VoIP by default
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.voice.path.for.pcm.voip=true

# Enable multi channel aac through offload
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.offload.multiaac.enable=true

# Enable DS2, Hardbypass feature for Dolby
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false

# Disable Multiple offload sesison
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.offload.multiple.enabled=false

# Disable Compress passthrough playback
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.offload.passthrough=false

# Disable surround sound recording
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.audio.sdk.ssr=false

# Enable dsp gapless mode by default
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.offload.gapless.enabled=true

#enable pbe effects
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.safx.pbe.enabled=true

# Parser input buffer size(256kb) in byte stream mode
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.parser.ip.buffer.size=262144

# Enable downsampling for multi-channel content > 48Khz
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.playback.mch.downsample=true

# Enable software decoders for ALAC and APE.
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true

# Property for AudioSphere Post processing
PRODUCT_PROPERTY_OVERRIDES += \
 vendor.audio.pp.asphere.enabled=false

# Audio voice concurrency related flags
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.voice.playback.conc.disabled=true \
    vendor.voice.record.conc.disabled=false \
    vendor.voice.voip.conc.disabled=true

# Decides the audio fallback path during voice call,
# deep-buffer and fast are the two allowed fallback paths now.
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.voice.conc.fallbackpath=deep-buffer

# Disable speaker protection by default
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.speaker.prot.enable=false

# Enable HW AAC Encoder by default
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.hw.aac.encoder=true

# Flac sw decoder 24 bit decode capability
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.flac.sw.decoder.24bit=true

# Timeout crash duration set to 20sec before system is ready.
# Timeout duration updates to default timeout of 5sec once the system is ready.
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.hal.boot.timeout.ms=20000

# Read wsatz name from thermal zone type
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.read.wsatz.type=true

# Set AudioFlinger client heap size
PRODUCT_PROPERTY_OVERRIDES += \
    ro.af.client_heap_size_kbyte=7168

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.hw.binder.size_kbyte=1024

# Set speaker protection cal tx path sampling rate to 48k
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.spkr_prot.tx.sampling_rate=48000

# Audio dynamic feature flags
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.feature.snd_mon.enable=true \
    vendor.audio.feature.compr_cap.enable=false \
    vendor.audio.feature.hifi_audio.enable=true \
    vendor.audio.feature.hdmi_edid.enable=true  \
    vendor.audio.feature.spkr_prot.enable=true  \
    vendor.audio.feature.dsm_feedback.enable=false \
    vendor.audio.feature.ssrec.enable=true  \
    vendor.audio.feature.compr_voip.enable=true \
    vendor.audio.feature.kpi_optimize.enable=true \
    vendor.audio.feature.usb_offload.enable=false  \
    vendor.audio.feature.usb_offload_burst_mode.enable=false \
    vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
    vendor.audio.feature.src_trkn.enable=true \
    vendor.audio.feature.ras.enable=false \
    vendor.audio.feature.a2dp_offload.enable=false \
    vendor.audio.feature.wsa.enable=false \
    vendor.audio.feature.compress_meta_data.enable=true \
    vendor.audio.feature.vbat.enable=true \
    vendor.audio.feature.display_port.enable=false \
    vendor.audio.feature.fluence.enable=true \
    vendor.audio.feature.custom_stereo.enable=true \
    vendor.audio.feature.anc_headset.enable=true \
    vendor.audio.feature.spkr_prot.enable=false \
    vendor.audio.feature.fm.enable=true \
    vendor.audio.feature.external_dsp.enable=false \
    vendor.audio.feature.external_speaker.enable=false \
    vendor.audio.feature.external_speaker_tfa.enable=false \
    vendor.audio.feature.hwdep_cal.enable=false \
    vendor.audio.feature.hfp.enable=true \
    vendor.audio.feature.ext_hw_plugin.enable=false \
    vendor.audio.feature.record_play_concurency.enable=false \
    vendor.audio.feature.hdmi_passthrough.enable=false \
    vendor.audio.feature.concurrent_capture.enable=false \
    vendor.audio.feature.compress_in.enable=false \
    vendor.audio.feature.battery_listener.enable=false \
    vendor.audio.feature.maxx_audio.enable=false \
    vendor.audio.feature.audiozoom.enable=false \
    vendor.audio.feature.auto_hal.enable=false \
    vendor.audio.read.wsatz.type=true \
    vendor.audio.feature.multi_voice_session.enable=true \
    vendor.audio.feature.incall_music.enable=true

# Allows healthd to boot directly from charger mode rather than initiating a reboot
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.enable_boot_charger_mode=1

# BT address path
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/data/vendor/bluetooth/bluetooth_bdaddr

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.demo.hdmirotationlock=false \
    persist.sys.sf.color_saturation=1.0 \
    ro.vendor.display.cabl=2 \
    debug.sf.hw=0 \
    debug.egl.hw=0 \
    debug.sf.latch_unsignaled=1 \
    vendor.display.enable_default_color_mode=1

# Display HAL quirks
# Skip loading libsdmextension.so and libsdm-color.so in display hal
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.skip_extension_intf=1 \
    vendor.display.skip_color_intf=1

# DRM service
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# OpenGLES version
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610

# Use MSM8956 feature set for vidc encoders
PRODUCT_PROPERTY_OVERRIDES += \
    media.msm8956hw=1

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gralloc.gfx_ubwc_disable=1 \
    vendor.gralloc.enable_fb_ubwc=0 \
    vendor.gralloc.disable_ubwc=1

# RILD
PRODUCT_PROPERTY_OVERRIDES += \
    ril.subscription.types=NV,RUIM

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.rild.libpath=/vendor/lib64/libril-qc-qmi-1.so

ifeq ($(PRODUCT_DEVICE_DS),true)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.multisim.config=dsds \
    ro.telephony.default_network=9,1
else
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.multisim.config=ss \
    ro.telephony.default_network=9
endif

# Wi-Fi interface name
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# WiFi MAC address path
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wifi.addr_path=/sys/devices/platform/soc/soc:bcmdhd_wlan/macaddr

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

# Set Vendor SPL to match platform
VENDOR_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)

# SELinux
include device/sony/sepolicy/sepolicy.mk

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit Loire platform vendor blobs
$(call inherit-product-if-exists, vendor/sony/loire/loire-vendor.mk)

# BCOM wlan firmware
$(call inherit-product-if-exists, vendor/broadcom/wlan/bcmdhd/firmware/bcm43455/device-bcm-vendor.mk)
