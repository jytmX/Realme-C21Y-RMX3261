# MINIMAL MANIFEST BUILDING SUPPORT
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# DEVICE PATH
DEVICE_PATH := device/realme/RMX3261
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Display
TARGET_SCREEN_DENSITY := 320

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# ARCH
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# MKBOOT
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 video=HDMI-A-1:1280x800@60
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Decryption
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
TW_INCLUDE_FBE_METADATA_DECRYPT := false

# TEMP
TW_CUSTOM_CPU_TEMP_PATH = /sys/devices/platform/soc/soc:aon/64200000.spi/spi_master/spi4/spi4.0/sc27xx-fgu/power_supply/sc27xx-fgu/temp

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif

#Platform
TARGET_BOOTLOADER_BOARD_NAME := RMX3261
TARGET_BOARD_PLATFORM := ums512

# SPRD hardware
BOARD_USES_SPRD_HARDWARE := true

# A/B
AB_OTA_UPDATER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := RMX3261

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    vbmeta \
    vbmeta_system \
    vbmeta_product \
    vbmeta_vendor \
    dtbo \
    boot \
    system \
    system_ext \
    vendor \
    product

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 0
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# SUPER PARTITION
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := realme_dynamic_partitions
BOARD_REALME_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product
BOARD_REALME_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT = system_ext

# PARTITION SIZE
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_HAS_LARGE_FILESYSTEM := true

#for cali mode use boot.img
BOARD_CALIMODE_USE_BOOTIMG := true

# FILESYSTEMS
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

# SYSTEM-AS-ROOT
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# METADATA
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
VENDOR_SECURITY_PATCH := 2023-12-28

# RECOVERY
TW_INCLUDE_FASTBOOTD := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TW_HAS_NO_RECOVERY_PARTITION := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TW_BRIGHTNESS_PATH := "/sys/devices/platform/sprd_backlight/backlight/sprd_backlight/brightness"
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := ru
TW_THEME := portrait_hdpi
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 190
RECOVERY_SDCARD_ON_DATA := true
TW_USE_TOOLBOX := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_USB_STORAGE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_HAS_EDL_MODE := true
TW_INCLUDE_LPTOOLS := true
TW_DEVICE_VERSION := RMX3231 by depesh1977

# MTP
TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb

# SDCARD AND OTG
BOARD_ROOT_EXTRA_FOLDERS += usb-otg
BOARD_ROOT_EXTRA_FOLDERS += external_sd

# Display
TARGET_SCREEN_DENSITY := 320
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_BLANK := true
TW_THEME := portrait_hdpi
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1600

# Fix fastboot reboot
TW_NO_FASTBOOT_BOOT := true

# Debug
TWRP_EVENT_LOGGING := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

