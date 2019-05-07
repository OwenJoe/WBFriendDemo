//
//  WBViewController.m
//  BL
//
//  Created by yinju on 2018/11/26.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "WBViewController.h"

@interface WBViewController ()

@end

@implementation WBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    

}

-(void)pushNavigationController:(UIViewController *)navigationController  BeforeHide:(BOOL)beforeHide AfterHide:(BOOL)afterHide{
    
    self.hidesBottomBarWhenPushed = beforeHide;
    [self.navigationController pushViewController:navigationController animated:YES];
    self.hidesBottomBarWhenPushed = afterHide;
    
}

@end
