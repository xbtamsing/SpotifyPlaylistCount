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

@interface SPTEncoreLabel : NSObject
    @property(nonatomic, readwrite) UIColor* textColor;
@end

@interface VISREFGradientView : NSObject
    @property(nonatomic) UIColor* toColor;
@end