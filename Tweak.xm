/*
 * DECLARATIONS
*/
@protocol SPTFreeTierPlaylistItemsViewModel <NSObject>
    @property(nonatomic, readonly) unsigned long long numberOfItems;
    @property(nonatomic, readonly) unsigned long long numberOfLoadedItems;
@end

@interface SPTFreeTierPlaylistViewModelImplementation : NSObject
    @property(nonatomic) __weak id <SPTFreeTierPlaylistItemsViewModel> itemsViewModel;
    @property(nonatomic, copy, readwrite) NSString* metadataText; 
@end

// ---------------------------------------------------------------------------------------------------------------------------------------


// BASIC VARIABLES
unsigned long long playlistTrackCount = 0;
NSString* playlistDuration = @"";
// UIColor* labelTextColor = [UIColor colorWithRed:0.114 green:0.725 blue:0.329 alpha:1.0];

/*
 * HOOK ONE (1)
*/
%hook VISREFArtworkContentView

- (void)setMetadata:(id)arg1 withAccessibilityLabel:(id)arg2 {
    // make a call to the original implementation code
    %orig;

    // --- CODE INJECTION POINT---

    // 1. hook the metadata accessibility label ivar
    id playlistMetadataLabel = MSHookIvar<id>(self, "_metadataLabel");

    // 2. and then set its text
    [playlistMetadataLabel setText:[NSString stringWithFormat: @"%@ | %lld songs", playlistDuration, playlistTrackCount]];

    /*  
    // 3. TESTING. setting label text color.
    playlistMetadataLabel.textColor = labelTextColor;
    */
}

%end

// ---------------------------------------------------------------------------------------------------------------------------------------

/*
 * HOOK TWO (2)
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
