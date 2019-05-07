//
//  HoriWebImageProtocol.h
//  HoriPhotoBrowserDemo
//
//  Created by Kyle Sun on 22/05/2017.
//  Copyright © 2017 Kyle Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HoriImageManagerProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);

typedef void (^HoriImageManagerCompletionBlock)(UIImage * _Nullable image, NSURL * _Nullable url, BOOL success, NSError * _Nullable error);

@protocol HoriImageManager <NSObject>

- (void)setImageForImageView:(nullable UIImageView *)imageView
                     withURL:(nullable NSURL *)imageURL
                 placeholder:(nullable UIImage *)placeholder
                    progress:(nullable HoriImageManagerProgressBlock)progress
                  completion:(nullable HoriImageManagerCompletionBlock)completion;

- (void)cancelImageRequestForImageView:(nullable UIImageView *)imageView;

- (UIImage *_Nullable)imageFromMemoryForURL:(nullable NSURL *)url;

@end
