//
//  UIView+BorderLine.h
//  KHLC
//
//  Created by yinju on 2018/12/12.
//  Copyright © 2018年 yinju. All rights reserved.
//  /// https://www.jianshu.com/p/cd4908143477

#import <UIKit/UIKit.h>


typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BorderLine)
- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;
@end

NS_ASSUME_NONNULL_END



/// .m内容
