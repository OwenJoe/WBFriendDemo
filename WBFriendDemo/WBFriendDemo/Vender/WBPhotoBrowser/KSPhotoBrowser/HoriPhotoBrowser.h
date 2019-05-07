//
//  HoriPhotoBrowser.h
//  HoriPhotoBrowser
//
//  Created by Kyle Sun on 12/25/16.
//  Copyright © 2016 Kyle Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoriPhotoItem.h"
#import "HoriYYImageManager.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HoriPhotoBrowserInteractiveDismissalStyle) {
    HoriPhotoBrowserInteractiveDismissalStyleRotation,
    HoriPhotoBrowserInteractiveDismissalStyleScale,
    HoriPhotoBrowserInteractiveDismissalStyleSlide,
    HoriPhotoBrowserInteractiveDismissalStyleNone
};

typedef NS_ENUM(NSUInteger, HoriPhotoBrowserBackgroundStyle) {
    HoriPhotoBrowserBackgroundStyleBlurPhoto,
    HoriPhotoBrowserBackgroundStyleBlur,
    HoriPhotoBrowserBackgroundStyleBlack
};

typedef NS_ENUM(NSUInteger, HoriPhotoBrowserPageIndicatorStyle) {
    HoriPhotoBrowserPageIndicatorStyleDot,
    HoriPhotoBrowserPageIndicatorStyleText
};

typedef NS_ENUM(NSUInteger, HoriPhotoBrowserImageLoadingStyle) {
    HoriPhotoBrowserImageLoadingStyleIndeterminate,
    HoriPhotoBrowserImageLoadingStyleDeterminate
};

@protocol HoriPhotoBrowserDelegate, HoriImageManager;
@interface HoriPhotoBrowser : UIViewController

@property (nonatomic, assign) HoriPhotoBrowserInteractiveDismissalStyle dismissalStyle;
@property (nonatomic, assign) HoriPhotoBrowserBackgroundStyle backgroundStyle;
@property (nonatomic, assign) HoriPhotoBrowserPageIndicatorStyle pageindicatorStyle;
@property (nonatomic, assign) HoriPhotoBrowserImageLoadingStyle loadingStyle;
@property (nonatomic, assign) BOOL bounces;
@property (nonatomic, weak) id<HoriPhotoBrowserDelegate> delegate;

+ (instancetype)browserWithPhotoItems:(NSArray<HoriPhotoItem *> *)photoItems selectedIndex:(NSUInteger)selectedIndex;
- (instancetype)initWithPhotoItems:(NSArray<HoriPhotoItem *> *)photoItems selectedIndex:(NSUInteger)selectedIndex;
- (void)showFromViewController:(UIViewController *)vc;
+ (void)setImageManagerClass:(Class<HoriImageManager>)cls;

@end

@protocol HoriPhotoBrowserDelegate <NSObject>

- (void)Hori_photoBrowser:(HoriPhotoBrowser *)browser didSelectItem:(HoriPhotoItem *)item atIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
