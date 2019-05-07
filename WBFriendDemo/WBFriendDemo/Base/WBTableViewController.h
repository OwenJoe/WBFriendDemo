//
//  WBTableViewController.h
//  BL
//
//  Created by yinju on 2018/11/22.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//tableView类型
typedef NS_ENUM(NSInteger,WBTableViewStyle){
    
    WBTableViewStylePlain = 0,
    WBTableViewStyleGrouped
};

@interface WBTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
/**/
@property (nonatomic,strong) UITableView *wbTableView;
#pragma mark 尾部刷新
-(void)footerRefresh;
#pragma mark 头部刷新
-(void)headerRefresh;

/*tableView类型*/
@property (nonatomic,assign) NSInteger tableViewType;

-(void)addWBTableViewStyle:(WBTableViewStyle)tableViewStyle;


/**
 push跳转控制器

 @param navigationController 将要跳转的控制器
 @param beforeHide 隐藏tabbar(前)
 @param afterHide 隐藏tabbar(后)
 */
-(void)pushNavigationController:(UIViewController *)navigationController  BeforeHide:(BOOL)beforeHide AfterHide:(BOOL)afterHide;


@property (nonatomic,assign) float WBTableViewX;
@property (nonatomic,assign) float WBTableViewY;
@property (nonatomic,assign) float WBTableViewWidth;
@property (nonatomic,assign) float WBTableViewHeight;
@end

NS_ASSUME_NONNULL_END
