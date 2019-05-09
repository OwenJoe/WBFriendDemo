//
//  OtherSetting.h
//  XBQH
//
//  Created by yinju on 2019/4/16.
//  Copyright © 2019 yinju. All rights reserved.
//


//APP版本号
#define APP_VERSION                         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define LocalAPP_VERSION @"LocalAPP_VERSION"  //本地保存的APP版本号,是否要进入新特性页面

//获取AppDelegate
#define JSAppDelegate ((AppDelegate*)[UIApplication sharedApplication].delegate)
//用户路径
#define FilePathName [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"userD.plis"]


//相应的屏幕换算
#define WBScreenWidth [UIScreen mainScreen].bounds.size.width
#define WBScreenHeight [UIScreen mainScreen].bounds.size.height

//根据ip6的屏幕来拉伸
#define KWidthRate  WBScreenWidth/375.0
#define KHeightRate WBScreenHeight/667.0

//根控制器
#define APP_WINDOW [[[UIApplication sharedApplication]delegate]window]

//是否登录成功 0:退出  1:已经登录
#define isLogin [[NSUserDefaults standardUserDefaults]integerForKey:@"isLoginKey"]

//保存登录的值
#define LoginKey @"isLoginKey"

//保存token
#define  WLTokenKey   @"WLTokenKey"

//取token的值
#define  GetToken  [[NSUserDefaults standardUserDefaults]objectForKey:WLTokenKey]

//BmobID
#define BmobID  @"070a9b0a208796d9bf1bb4c8cfcd6c47"

//友盟分享
#define UmengKey  @"5cac052c61f5648f7c000797"

//极光推送
#define JPushKey  @"ed6168cdc86900802e9c5ff2"

//leanCloud 数据服务
#define  ApplicationIdKey @"GmTQLucRsyuwAjbbNWXe41S5-gzGzoHsz"
#define  ClientKey @"mDkJERuHB3pIHHIVm6MTPxrJ"



//未选中色调
#define UnSelectColor   @"#FCDD8D"

//选中色调
#define SelectColor  @"#1D1D1D"

//全局底色背景
#define bgColor  [UIColor colorWithHexString:@"ffffff"]

//保存头像
#define MyIcon @"MyIconKey"

//获取头像链接url
#define GetMyIcon [[NSUserDefaults standardUserDefaults]objectForKey:MyIcon]

//保存手机号
#define KeepPhoneNum @"KeepPhoneNum"

//拿到手机号
#define GetPhoneNum  [[NSUserDefaults standardUserDefaults]objectForKey:KeepPhoneNum]

//保存名字
#define KeepNameID  @"KeepNameID"


//保存签名
#define KeepSignID  @"KeepSignID"

//拿到名字
#define  GetNameID [[NSUserDefaults standardUserDefaults]objectForKey:KeepNameID]

//保存密码
#define KeepPassword @"KeepPassword"

//拿到密码
#define GetPassword  [[NSUserDefaults standardUserDefaults]objectForKey:KeepPassword]

//是否首次使用app
#define FirstUseAppKey @"FirstUseAppKey"

//自选数组
#define ChoseCodeArrayKey   @"keepChoseCodeKey"

//刘海屏幕返回88，反之返回64，当然这个高度可以更改，看APP需要
#define SafeAreaTopHeight ([WBSystemJudge iphoneIsProfiledScreen] ?  88 : 64)

//原来距离底部距离为0 的按钮或者其他控件，如果是刘海屏都要向上移动34，为了刘海屏手机底部滑动条的区域留出 ，但是还是看APP需要
#define SafeAreaBottomHeight ([WBSystemJudge iphoneIsProfiledScreen] ? 34 : 0)

//这个是状态栏的高度，这个用的和上面两个用的就很少了
#define SafeAreaStatusHeight ([WBSystemJudge iphoneIsProfiledScreen] ? 44 : 20)

//弱引用
#define  WEAKSELF     __weak typeof(self)weakSelf = self;

//强引用
#define  STRONGSELF    __strong typeof(weakSelf)strongSelf = weakSelf;

#define  StrongSelf   strongSelf

//渐变颜色1
#define ColorOne [UIColor colorWithHexString:@"B1DFB0"]

//渐变颜色2
#define ColorTwo [UIColor colorWithHexString:@"0B83B2"]

//取色
#define WBColor(c)  [UIColor colorWithHexString: [c stringByReplacingOccurrencesOfString:@"#" withString:@""]]


//设置开关页使用的
#define IS_IPHONE_X         [UIView isiPhoneXSeries]
#define SAVE_ARE_TOP        (IS_IPHONE_X ? 24.0f : 0.0f)
#define SAVE_ARE_BOTTOM     (IS_IPHONE_X ? 34.0f : 0.0f)
#define NavHeight (IS_IPHONE_X?64+24:64)
#define TabHeight (IS_IPHONE_X?49+34:49)
#define NavStatusBar_X (IS_IPHONE_X?44:20)

#define  navigationBarHideNO     self.navigationController.navigationBar.hidden = NO;
#define  navigationBarHideYes     self.navigationController.navigationBar.hidden = YES;


//判断是否有刘海屏
#define isIphoneX ({\
int tmp = 0;\
if (@available(iOS 11.0, *)) {\
if (!UIEdgeInsetsEqualToEdgeInsets([UIApplication sharedApplication].delegate.window.safeAreaInsets, UIEdgeInsetsZero)) {\
tmp = 1;\
}else{\
tmp = 0;\
}\
}else{\
tmp = 0;\
}\
tmp;\
})


//未登录弹出
#define PresentLoginViewController ({\
if (isLogin ==0) {\
JKLoginViewController *loginVc = [[JKLoginViewController alloc]init];\
UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginVc];\
[self presentViewController:loginNav animated:YES completion:^{\
}];\
return;\
}\
})
