//
//  AppDelegate.h
//  YTFuture
//
//  Created by yinju on 2018/11/14.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/****************/
//@property (nonatomic,strong) TabConfig *tabConfig;
@property (nonatomic,assign) BOOL isLogin;

//配置
@property (nonatomic,strong) NSString *contentUrl;
@property (nonatomic,strong) NSString *stusColor;
@property (nonatomic,assign) BOOL isWhite;
@property (nonatomic,strong) NSString *isStatu;


@end

