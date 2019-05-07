//
//  UIView+expand.m
//  Hzed_Noum
//
//  Created by CL on 2018/10/30.
//  Copyright © 2018 hzed.com. All rights reserved.
//

#import "UIView+expand.h"

@implementation UIView (expand)

+ (BOOL)isiPhoneXSeries {
    if (@available(iOS 11.0, *)) {
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        if (window.safeAreaInsets.bottom > 0.0) {
            return YES;
        }
    }
    return NO;
}

+ (instancetype)viewFromXib {
	return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

@end
