# TARGET #

TARGET := 3DS
LIBRARY := 0

ifeq ($(TARGET),$(filter $(TARGET),3DS WIIU))
    ifeq ($(strip $(DEVKITPRO)),)
        $(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>devkitPro")
    endif
endif


ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

# COMMON CONFIGURATION #

NAME := Snakes

BUILD_DIR := build
DATA := data
OUTPUT_DIR := output
INCLUDE_DIRS := include
SOURCE_DIRS := source
TOP_DIR := $(CURDIR)

EXTRA_OUTPUT_FILES :=

LIBRARY_DIRS :=
LIBRARIES :=

BUILD_FLAGS := 
RUN_FLAGS :=


# 3DS/Wii U CONFIGURATION #

ifeq ($(TARGET),$(filter $(TARGET),3DS WIIU))
    TITLE := $(NAME)
    DESCRIPTION := Ver 0.2
    AUTHOR := Desynched
endif

# 3DS CONFIGURATION #

ifeq ($(TARGET),3DS)
    LIBRARY_DIRS += $(DEVKITPRO)/libctru $(DEVKITPRO)/portlibs/armv6k
    LIBRARIES += sf2d sftd freetype ctru m z citro3d 

    PRODUCT_CODE := CTR-SNEK-1
    UNIQUE_ID := 0x90342

    SYSTEM_MODE := 64MB
    SYSTEM_MODE_EXT := Legacy

    ICON_FLAGS :=

    ROMFS_DIR := 
    BANNER_AUDIO := assets/banner.wav
    BANNER_IMAGE := assets/banner.png
    ICON := assets/icon.png
endif

# INTERNAL #


include buildtools/make_base