#
# SPDX-FileCopyrightText: 2022-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6225-common
include device/motorola/sm6225-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/hawao

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hawao

# Display
TARGET_SCREEN_DENSITY := 420

# HIDL
ODM_MANIFEST_SKUS += b bc d dc dn dnc n nc
ODM_MANIFEST_B_FILES := $(DEVICE_PATH)/sku/manifest_b.xml
ODM_MANIFEST_BC_FILES := $(DEVICE_PATH)/sku/manifest_bc.xml
ODM_MANIFEST_D_FILES := $(DEVICE_PATH)/sku/manifest_d.xml
ODM_MANIFEST_DC_FILES := $(DEVICE_PATH)/sku/manifest_dc.xml
ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/sku/manifest_dn.xml
ODM_MANIFEST_DNC_FILES := $(DEVICE_PATH)/sku/manifest_dnc.xml
ODM_MANIFEST_N_FILES := $(DEVICE_PATH)/sku/manifest_n.xml
ODM_MANIFEST_NC_FILES := $(DEVICE_PATH)/sku/manifest_nc.xml

# Kernel
TARGET_KERNEL_CONFIG += vendor/ext_config/hawao-default.config

# Kernel Modules - Vendor Boot
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/vendor_boot.modules.load))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)

# Partitions
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 100

# Security patch level
BOOT_SECURITY_PATCH := 2024-06-01
VENDOR_SECURITY_PATCH := 2024-06-01

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 17
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 17
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Inherit from the proprietary version
include vendor/motorola/hawao/BoardConfigVendor.mk
