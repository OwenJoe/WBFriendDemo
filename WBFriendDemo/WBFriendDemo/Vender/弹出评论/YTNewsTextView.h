//
//  YTNewsTextView.h
//  YTFuture
//
//  Created by yinju on 2018/11/15.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class YTNewsTextView;
@protocol YTNewsTextViewDelegate <NSObject>
-(void)popReview;
@end
@interface YTNewsTextView : UIView
@property (nonatomic,weak) id <YTNewsTextViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
