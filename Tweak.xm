// --- IMPORTS---
#import "Tweak.h"

// ---------------------------------------------------------------------------------------------------------------------------------------

// BASIC VARIABLES
unsigned long long playlistTrackCount = 0;
NSString* playlistDuration = @"";
UIColor* playlistColor = nil;

/*
 * Used for hooking access to a playlist's metadata fields.
*/
%hook VISREFArtworkContentView

- (void)setMetadata:(id)arg1 withAccessibilityLabel:(id)arg2 {
    // make a call to the original implementation code
    %orig;

    // --- CODE INJECTION POINT---

    // 1. hook into the metadata label ivar
    id playlistMetadataLabel = MSHookIvar<id>(self, "_metadataLabel");
    // SPTEncoreLabel* playlistTitleLabel = MSHookIvar<SPTEncoreLabel*>(self, "_titleLabel");

    // 2. and then set its text
    [playlistMetadataLabel setText:[NSString stringWithFormat: @"%@ / %lld songs", playlistDuration, playlistTrackCount]];
    // playlistTitleLabel.textColor = playlistColor;
}

%end

// ---------------------------------------------------------------------------------------------------------------------------------------

/*
 * Used for obtaining metadata regarding the playlist, including (so far):
    1. number of songs in the playlist, and
    2. the duration of the entire playlist.
*/
%hook SPTFreeTierPlaylistViewModelImplementation

- (void)updateHeaderProperties {
    // make a call to the original implementation code
    %orig;

    // --- CODE INJECTION POINT---

    // 1. update the basic variables playlistTrackCount and playlistDuration
    playlistTrackCount = self.itemsViewModel.numberOfItems;
    playlistDuration = self.metadataText;
}

%end

// ---------------------------------------------------------------------------------------------------------------------------------------

/*
 * Used to extract the "toColor" property of Spotify's playlist gradient view.
 */
%hook VISREFGradientView

- (void)updateGradient {
    // make a call to the original implementation code
    %orig;

    // --- CODE INJECTION POINT---

    // 1. update the basic variable playlistColor
    playlistColor = self.toColor;
 }

%end

