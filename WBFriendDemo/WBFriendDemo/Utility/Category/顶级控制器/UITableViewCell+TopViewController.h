//
//  UITableViewCell+TopViewController.h
//  BL
//
//  Created by yinju on 2018/11/23.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (TopViewController)
/**
 获取当前View所在的控制器
 
 @return <#return value description#>
 */
@property (nullable, nonatomic, readonly, strong) UIViewController *topViewController;
@end

NS_ASSUME_NONNULL_END
