//
//  UIView+expand.h
//  Hzed_Noum
//
//  Created by CL on 2018/10/30.
//  Copyright © 2018 hzed.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (expand)

/**
 判断是否是iPhone X系列设备
 */
+ (BOOL)isiPhoneXSeries;

+ (instancetype)viewFromXib;

@end

NS_ASSUME_NONNULL_END
