//
//  MNGP_ForgetPasswordViewController+Function.m
//  MNGP
//
//  Created by yinju on 2019/4/23.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_ForgetPasswordViewController+Function.h"
#import "MNGP_TrendsViewController.h"
@implementation MNGP_ForgetPasswordViewController (Function)

- (IBAction)returnButtonClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}




/*立即登录*/
-(void)lastLabelClick:(UITapGestureRecognizer *)tap{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma mark 登录
- (IBAction)sureButtonClick:(id)sender {
    
    
    if (![self.passwordField.text isEqualToString:self.againPasswordField.text ]) {
        
        [XWHUDManager showTipHUD:@"两次输入的密码不一致"];
        return;
    }
   
    NSDictionary *dict = @{@"username":self.accountField.text,
                           @"password":self.passwordField.text,
                           @"verification_code":self.codeField.text //短信验证码
                           };
    
    
    [[WBHttpsRequest shareInstance]PostHttpWithUrl:@"http://data.yingju8.com/api/user/public/passwordReset" Parameters:dict sucess:^(id responseObject) {
        
        if ([[responseObject[@"code"]stringValue] isEqualToString:@"1"]) {
            
            NSLog(@"成功:%@",responseObject);
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            [XWHUDManager showHUDMessage:@"重置密码成功,请重新登录"];
            [XWHUDManager hideDelay:1.2];
            
            
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
    
    MNGP_TrendsViewController  *Vc = [[MNGP_TrendsViewController alloc]init];
    
    //    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    for (UIView *v in APP_WINDOW.subviews) {
        
        [v removeFromSuperview];
        
    }
    APP_WINDOW.rootViewController = Vc;
}

#pragma mark 手机
- (IBAction)accountFieldClick:(UITextField *)sender {
    
    self.accountField.text = [sender text];
}

#pragma mark 短信验证码
- (IBAction)codeFieldClick:(UITextField *)sender {
    
    self.codeField.text = [sender text];
}

#pragma mark 密码
- (IBAction)passwordFieldClick:(UITextField *)sender {
    
    self.passwordField.text = [sender text];
}

#pragma mark 第二次密码
- (IBAction)againPasswordFieldClick:(UITextField *)sender {
    
    self.againPasswordField.text = [sender text];
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


@end
