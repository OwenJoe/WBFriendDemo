//
//  BLLoginViewController.h
//  BL
//
//  Created by yinju on 2018/11/22.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
/*状态枚举*/
typedef NS_ENUM (NSInteger , Status){
    
    LoginStatus = 0,//登录状态
    RegisterStatus //注册状态
    
};

@interface MNGP_LoginViewController : WBViewController

/*判断是登录状态 还是注册状态*/
@property (nonatomic,assign) BOOL isLoginOrRegister;
/**/
@property (nonatomic,strong) id timer;
@property (weak, nonatomic) IBOutlet UIView *inCludeView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginTypeButton;
@property (weak, nonatomic) IBOutlet UIButton *registerTypeButton;
@property (weak, nonatomic) IBOutlet UIView *accountView;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (weak, nonatomic) IBOutlet UIButton *getCodeButton;
@property (weak, nonatomic) IBOutlet UIView *codeView;
@property (weak, nonatomic) IBOutlet UIImageView *lineImgView;

@end

NS_ASSUME_NONNULL_END
