//
//  MNGP_ForgetPasswordViewController.h
//  MNGP
//
//  Created by yinju on 2019/4/23.
//  Copyright © 2019 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNGP_ForgetPasswordViewController : UIViewController
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

@property (weak, nonatomic) IBOutlet UITextField *againPasswordField;
@property (weak, nonatomic) IBOutlet UIView *againPasswordView;

@end

NS_ASSUME_NONNULL_END
