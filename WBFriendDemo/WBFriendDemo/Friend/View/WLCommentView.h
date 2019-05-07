//
//  WLCommentView.h
//  WL
//
//  Created by yinju on 2018/12/5.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PopCommentBlock)();
@interface WLCommentView : UIView
@property (nonatomic,copy) PopCommentBlock commentBlock;
@end

NS_ASSUME_NONNULL_END
