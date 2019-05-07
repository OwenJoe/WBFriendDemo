//
//  BLLoginViewController+Function.m
//  BL
//
//  Created by yinju on 2018/11/26.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "MNGP_LoginViewController+Function.h"
#import "MNGP_TrendsViewController.h"
@implementation MNGP_LoginViewController (Function)



/*返回上一层*/
-(void)backClick:(UIButton *)sender{

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark 按钮
- (IBAction)loginClick:(UIButton *)sender {
    
    if (self.isLoginOrRegister == LoginStatus) {
        
        [self loginButtonClick:sender];
    }
    else if (self.isLoginOrRegister == RegisterStatus){
        
        [self registerButtonClick:sender];
    }
    
}



- (IBAction)accountField:(UITextField *)sender {
    
    
    NSLog(@"手机号码:%@",sender.text);
    if ([CheckDataTool checkForMobilePhoneNo:[sender text]]) {
        
        self.accountField.text = sender.text;
        NSLog(@"正确的手机号码");
    }
    else{
        
        NSLog(@"输入有误");
    }
}

- (IBAction)passwordField:(UITextField *)sender {
    
    self.passwordField.text = sender.text;
    NSLog(@"密码:%@",sender.text);
}


- (IBAction)codeField:(UITextField *)sender {
    
    self.codeField.text = sender.text;
    NSLog(@"验证码:%@",sender.text);
}


- (IBAction)getCodeButtonClick:(UIButton *)sender {
    
    if ([CheckDataTool checkForMobilePhoneNo:self.accountField.text] == YES) {
        
        //获取注册手机的验证码
        [self getCode];
        
        __block NSInteger second = 60;
        //全局队列    默认优先级
        dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        //定时器模式  事件源
        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
        
        self.timer = timer;
        
        //NSEC_PER_SEC是秒，＊1是每秒
        dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
        //设置响应dispatch源事件的block，在dispatch源指定的队列上运行
        dispatch_source_set_event_handler(timer, ^{
            //回调主线程，在主线程中操作UI
            dispatch_async(dispatch_get_main_queue(), ^{
                if (second >= 0) {
                    [sender setTitle:[NSString stringWithFormat:@"(%ld)重发验证码",(long)second] forState:UIControlStateNormal];
                    second--;
                }
                else
                {
                    //这句话必须写否则会出问题
                    dispatch_source_cancel(timer);
                    [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
                    
                }
            });
        });
        //启动源
        dispatch_resume(timer);
    }
    else{
        
        [XWHUDManager showInfoTipHUD:@"手机号输入有误"];
    }
    
}


#pragma mark 获取验证码
-(void)getCode{
    
    
    [[WBHttpsRequest shareInstance]GetHttpWithUrl:[NSString stringWithFormat:@"http://data.fk7h.com/api/user/verification_code/send_code?username=%@",self.accountField.text] Parameters:@"" sucess:^(id responseObject) {
        
        
        if ([responseObject[@"code"] isEqualToString:@"1"]) {
            
            NSLog(@"获取短信验证码成功:%@",responseObject);
        }
        else{
            
            [XWHUDManager showInfoTipHUD:responseObject[@"msg"]];
        }
        
    } failure:^(NSError *error) {
        
        NSLog(@"获取短信验证码失败:%@",error);
    }];
    
}




/*登录*/
-(void)loginButtonClick:(UIButton *)sender{
    
    [XWHUDManager showHUDMessage:@"正在登录"];
    NSDictionary *dict = @{@"username":self.accountField.text,
                           @"password":self.passwordField.text,
                           @"device_type":@"iphone"
                           };
    [[WBHttpsRequest shareInstance]PostHttpWithUrl:@"http://data.fk7h.com/api/user/public/login" Parameters:dict sucess:^(id responseObject) {
        
        
        NSLog(@"登录:%@",responseObject);
        if ([[responseObject[@"code"]stringValue] isEqualToString:@"1"]) {
            
            
            //保存登录状态
            [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:LoginKey];
            
            //保存登录手机号
            [[NSUserDefaults standardUserDefaults]setObject:self.accountField.text forKey:KeepPhoneNum];
            
            //保存密码
            [[NSUserDefaults standardUserDefaults]setObject:self.passwordField.text forKey:KeepPassword];
            
            NSDictionary *params = responseObject[@"data"];
            //保存token
            [[NSUserDefaults standardUserDefaults]setObject:params[@"token"] forKey:WLTokenKey];
            
            //保存用户ID
            [[NSUserDefaults standardUserDefaults]setObject:@"笑笑の你" forKey:KeepNameID];
            
            NSLog(@"token==>%@",params[@"token"]);
            
            
            
            [XWHUDManager hide];
            [self jumpHomeRootViewController];
            
            NSLog(@"当前的根控制器为：%@",self.view.window.rootViewController);
            
        }
        else{
            
            [XWHUDManager hide];
            [XWHUDManager showWarningTipHUD:responseObject[@"msg"]];
        }
        
        
    } failure:^(NSError *error) {
        
        NSLog(@"失败:%@",error);
        [XWHUDManager showErrorTipHUDInView:@"登录失败"];
    }];
}



/*注册*/
-(void)registerButtonClick:(UIButton *)sender{
    
    NSDictionary *dict = @{@"username":self.accountField.text,
                           @"password":self.passwordField.text,
                           @"verification_code":self.codeField.text //短信验证码
                           };
    NSString *url = @"http://data.fk7h.com/api/user/public/register";
    
    
    [[WBHttpsRequest shareInstance]PostHttpWithUrl:url Parameters:dict sucess:^(id responseObject) {
        
        if ([[responseObject[@"code"]stringValue] isEqualToString:@"1"]) {
            
            NSLog(@"成功:%@",responseObject);
            
            //通知刷新个人中心控制器
            [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:LoginKey];
            //登录成功后直接切换控制器到首页即可
            [self jumpHomeRootViewController];
            
        }
        else{
            
            [XWHUDManager showTipHUD:responseObject[@"msg"]];
        }
        
        
    } failure:^(NSError *error) {
        
        NSLog(@"失败:%@",error);
    }];
}




#pragma mark 切换home为根控制器
-(void)jumpHomeRootViewController{
    
    MNGP_TrendsViewController* Vc = [[MNGP_TrendsViewController alloc]init];
    
    for (UIView *v in APP_WINDOW.subviews) {
        
        [v removeFromSuperview];
        
    }
    APP_WINDOW.rootViewController = Vc;
}










/*所有键盘失去焦点*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [[[UIApplication sharedApplication]keyWindow ]endEditing:YES];
}






@end
