THEOS_DEVICE_IP = 192.168.0.4
TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = Spotify


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpotifyNumSongsinPlaylist

SpotifyNumSongsinPlaylist_FILES = Tweak.xm
SpotifyNumSongsinPlaylist_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += spotifynumsongsinplaylistprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
