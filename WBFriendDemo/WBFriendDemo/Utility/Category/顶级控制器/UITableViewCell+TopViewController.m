//
//  UITableViewCell+TopViewController.m
//  BL
//
//  Created by yinju on 2018/11/23.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "UITableViewCell+TopViewController.h"

@implementation UITableViewCell (TopViewController)
#pragma mark 获取顶级控制器
- (UIViewController *)topViewController {
    UIView *next = self;
    while ((next = [next superview])) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end
