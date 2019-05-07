//
//  BLLoginViewController.m
//  BL
//
//  Created by yinju on 2018/11/22.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "MNGP_LoginViewController.h"
#import "MNGP_TrendsViewController.h"
#import "MNGP_ForgetPasswordViewController.h"

@interface MNGP_LoginViewController ()


/*整体View的高度*/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayoutConstraint;

/**/
@property (nonatomic,strong) UIButton *backButton;
@end

@implementation MNGP_LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = bgColor;
    
    self.codeView.hidden = YES;
    self.heightLayoutConstraint.constant = 210*KHeightRate;
    [self.inCludeView layoutIfNeeded];
    
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
    
    self.codeView.layer.masksToBounds = YES;
    self.codeView.layer.cornerRadius = 5;
    self.codeView.layer.borderWidth = 1;
    self.codeView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    
    self.getCodeButton.layer.masksToBounds = YES;
    self.getCodeButton.layer.cornerRadius = 5;

    
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.layer.cornerRadius = 5;

    
    
    self.lineImgView.image = [UIImage imageNamed:@"xian_1"];
    

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
     self.backButton =  [UIButton initButtonWithFrame:CGRectMake(0*KWidthRate, 10, 50*KWidthRate, 22*KHeightRate) ImageName:@"icon_reture" Title:@"" TitleColor:@"" Font:0 BackgroundColor:@"" Target:self Action:@selector(returnButtonClick:) AddObject:self.navigationController.navigationBar];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self.backButton removeFromSuperview];
}


- (void)returnButtonClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}



#pragma mark 登录状态
- (IBAction)loginTypeButton:(id)sender {
    
    _isLoginOrRegister = LoginStatus;
    [self.loginTypeButton setTitleColor:WBColor(@"#D80C0C") forState:UIControlStateNormal];
    [self.registerTypeButton setTitleColor:WBColor(@"#B7B7B7") forState:UIControlStateNormal];
    self.codeView.hidden = YES;

    self.heightLayoutConstraint.constant = 210*KHeightRate;
    [self.inCludeView layoutIfNeeded];
    self.lineImgView.image = [UIImage imageNamed:@"xian_1"];
    
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
}


#pragma mark 注册状态
- (IBAction)registerTypeButton:(id)sender {
    
    _isLoginOrRegister = RegisterStatus;
    [self.loginTypeButton setTitleColor:WBColor(@"#B7B7B7") forState:UIControlStateNormal];
    [self.registerTypeButton setTitleColor:WBColor(@"#D80C0C") forState:UIControlStateNormal];
    self.codeView.hidden = NO;

    self.heightLayoutConstraint.constant = 294*KHeightRate;
    [self.inCludeView layoutIfNeeded];
    self.lineImgView.image = [UIImage imageNamed:@"xian_2"];
    [self.loginButton setTitle:@"完成注册" forState:UIControlStateNormal];
}

#pragma mark 忘记密码
- (IBAction)forgetPasswordButtonClick:(id)sender {
    
    MNGP_ForgetPasswordViewController *forgetVc = [[MNGP_ForgetPasswordViewController alloc]init];
    [self.navigationController pushViewController:forgetVc animated:YES];
}


@end
