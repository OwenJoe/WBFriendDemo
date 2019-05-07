//
//  WBViewController.h
//  BL
//
//  Created by yinju on 2018/11/26.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WBViewController : UIViewController
/**
 push跳转控制器
 
 @param navigationController 将要跳转的控制器
 @param beforeHide 隐藏tabbar(前)
 @param afterHide 隐藏tabbar(后)
 */
-(void)pushNavigationController:(UIViewController *)navigationController  BeforeHide:(BOOL)beforeHide AfterHide:(BOOL)afterHide;
@end

NS_ASSUME_NONNULL_END
