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

ifeq ($(filter-out kugo suzu,$(TARGET_DEVICE)),)

include $(SRC_AUDIO_HAL_DIR)/Android.mk
include $(SRC_DISPLAY_HAL_DIR)/Android.mk
include $(SRC_GPS_HAL_DIR)/Android.mk
include $(SRC_MEDIA_HAL_DIR)/Android.mk

$(LOCAL_BUILT_MODULE):
	@mkdir -p $(TARGET_OUT_VENDOR)/firmware_mnt
	@mkdir -p $(TARGET_OUT_VENDOR)/dsp
	@ln -sf /vendor/bin $(TARGET_OUT_ODM)/bin
	@ln -sf /vendor/firmware $(TARGET_OUT_ODM)/firmware
	@ln -sf /vendor/lib $(TARGET_OUT_ODM)/lib
	@ln -sf /vendor/lib64 $(TARGET_OUT_ODM)/lib64
	@ln -sf /vendor/radio $(TARGET_OUT_ODM)/radio

endif # TARGET_DEVICE
