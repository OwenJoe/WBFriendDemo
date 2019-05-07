//
//  HoriPhotoView.h
//  HoriPhotoBrowser
//
//  Created by Kyle Sun on 12/25/16.
//  Copyright © 2016 Kyle Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoriProgressLayer.h"

NS_ASSUME_NONNULL_BEGIN

extern const CGFloat kHoriPhotoViewPadding;

@protocol HoriImageManager;
@class HoriPhotoItem;

@interface HoriPhotoView : UIScrollView

@property (nonatomic, strong, readonly) UIImageView *imageView;
@property (nonatomic, strong, readonly) HoriProgressLayer *progressLayer;
@property (nonatomic, strong, readonly) HoriPhotoItem *item;

- (instancetype)initWithFrame:(CGRect)frame imageManager:(id<HoriImageManager>)imageManager;
- (void)setItem:(HoriPhotoItem *)item determinate:(BOOL)determinate;
- (void)resizeImageView;
- (void)cancelCurrentImageLoad;

@end

NS_ASSUME_NONNULL_END
