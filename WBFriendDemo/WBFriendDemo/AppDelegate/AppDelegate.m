//
//  AppDelegate.m
//  BLFuture
//
//  Created by yinju on 2018/11/14.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "AppDelegate.h"
#import "AVOSCloud.h"
#import "MNGP_TrendsViewController.h"
@interface AppDelegate ()
@property (nonatomic, strong) AFNetworkReachabilityManager *manager;

@end

@implementation AppDelegate

/******************************系统其他设置****************************************/

//初始化控制器
- (void)setUpWindowRootViewController {
    
    //统一进入控制器
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    MNGP_TrendsViewController *tabBarController = [[MNGP_TrendsViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:tabBarController];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    
    NSLog(@"进入");
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //导航栏
    [self setUpNavigationBar];
    
    [self setUpWindowRootViewController];

    //leancloud
    [AVOSCloud setApplicationId:ApplicationIdKey clientKey:ClientKey];

    return YES;
}




@end
