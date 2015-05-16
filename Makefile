TARGET = iphone:latest:8.0
ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk
TWEAK_NAME = cfprefsd_fix
cfprefsd_fix_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk
