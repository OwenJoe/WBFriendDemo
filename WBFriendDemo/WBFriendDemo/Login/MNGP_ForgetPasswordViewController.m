//
//  MNGP_ForgetPasswordViewController.m
//  MNGP
//
//  Created by yinju on 2019/4/23.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_ForgetPasswordViewController.h"
#import "MNGP_ForgetPasswordViewController+Function.h"


@interface MNGP_ForgetPasswordViewController ()

@end

@implementation MNGP_ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = bgColor;
    
  
    
   
    self.codeField.leftView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 51)];
    self.codeField.leftViewMode=UITextFieldViewModeAlways;
    
    self.accountView.layer.masksToBounds = YES;
    self.accountView.layer.cornerRadius = 5;
    self.accountView.layer.borderWidth = 1;
    self.accountView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    self.passwordView.layer.masksToBounds = YES;
    self.passwordView.layer.cornerRadius = 5;
    self.passwordView.layer.borderWidth = 1;
    self.passwordView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    self.againPasswordView.layer.masksToBounds = YES;
    self.againPasswordView.layer.cornerRadius = 5;
    self.againPasswordView.layer.borderWidth = 1;
    self.againPasswordView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.codeView.layer.masksToBounds = YES;
    self.codeView.layer.cornerRadius = 5;
    self.codeView.layer.borderWidth = 1;
    self.codeView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    self.getCodeButton.layer.masksToBounds = YES;
    self.getCodeButton.layer.cornerRadius = 5;
    
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.layer.cornerRadius = 5;

    
}








@end
