TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SpotifyNumSongsinPlaylistPrefs

SpotifyNumSongsinPlaylistPrefs_FILES = SNSPPRootListController.m
SpotifyNumSongsinPlaylistPrefs_FRAMEWORKS = UIKit
SpotifyNumSongsinPlaylistPrefs_PRIVATE_FRAMEWORKS = Preferences
SpotifyNumSongsinPlaylistPrefs_INSTALL_PATH = /Library/PreferenceBundles
SpotifyNumSongsinPlaylistPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
