//
//  AppDelegate+Navigation.m
//  BL
//
//  Created by yinju on 2018/11/26.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "AppDelegate+Navigation.h"


@implementation AppDelegate (Navigation)
// 全局定义导航栏
- (void)setUpNavigationBar {


    // 定义全局的导航栏
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 改变背景颜色
    navBar.barTintColor = [UIColor whiteColor];
    
    //给导航栏添加图片
//    [navBar setBackgroundImage:[UIImage imageNamed:@"Background"] forBarMetrics:UIBarMetricsDefault];
//    [navBar setShadowImage:nil];

    
    //取消蒙层
    navBar.translucent = NO;
    
    // 修改导航栏标题颜色,文字大小,文字种类
    [navBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:20], NSForegroundColorAttributeName : [UIColor blackColor]}];
    
    // 修改文字
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    [barItem setTitleTextAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:18*KWidthRate],
                                       NSForegroundColorAttributeName : [UIColor blackColor] }
                           forState:UIControlStateNormal];
    
    // 自定义返回按钮  (全局设置)
    NSString *version = [UIDevice currentDevice].systemVersion;
    if (version.doubleValue < 11) {
        UIImage *backButtonImage = [[UIImage imageNamed:@"icon_reture"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        // 将返回按钮的文字position设置不在屏幕上显示
        UIOffset offset = UIOffsetMake(-500, -500);
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
    } else{
        UIImage *backButtonImage = [[UIImage imageNamed:@"icon_reture"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navBar.backIndicatorImage = backButtonImage;
        navBar.backIndicatorTransitionMaskImage = backButtonImage;
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, 1) forBarMetrics:UIBarMetricsDefault];
    }
}




@end
