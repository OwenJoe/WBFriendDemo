//
//  WBTableViewController.m
//  BL
//
//  Created by yinju on 2018/11/22.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "WBTableViewController.h"

@interface WBTableViewController ()

@end

@implementation WBTableViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = bgColor;
    
//    [self addWBTableViewStyle:self.tableViewType];

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
//    navigationBarHideYes
}

-(void)pushNavigationController:(UIViewController *)navigationController  BeforeHide:(BOOL)beforeHide AfterHide:(BOOL)afterHide{
    
    self.hidesBottomBarWhenPushed = beforeHide;
    [self.navigationController pushViewController:navigationController animated:YES];
    self.hidesBottomBarWhenPushed = afterHide;
    
}


-(void)addWBTableViewStyle:(WBTableViewStyle)tableViewStyle{

    if (self.tableViewType == WBTableViewStylePlain) {
        
        _wbTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,  WBScreenWidth, WBScreenHeight) style:UITableViewStylePlain];
    }
    else {
        
        _wbTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,  WBScreenWidth, WBScreenHeight) style:UITableViewStyleGrouped];
    }
    
    _wbTableView.delegate = self;
    _wbTableView.dataSource = self;
    _wbTableView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [self.view addSubview:self.wbTableView];
    
    //防止tableView透不过状态栏
    if ([self.wbTableView     respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            self.wbTableView.contentInsetAdjustmentBehavior =     UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
    
    [self headerRefresh];
    [self footerRefresh];
    

}



#pragma mark 头部刷新
-(void)headerRefresh{
    
    
    self.wbTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self.wbTableView.mj_header endRefreshing];
        [self.wbTableView.mj_footer setState:MJRefreshStateIdle];
        
    }];
    
}

#pragma mark 尾部刷新
-(void)footerRefresh{
    
    self.wbTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        //        [self.homeTableView.mj_footer endRefreshing];
        [self.wbTableView.mj_footer setState:MJRefreshStateNoMoreData];
    }];
}



-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *footerView = [[UIView alloc]init];
    return footerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


////去掉UITableView headerView黏性  要将tableview的style设置为UITableViewStyleGrouped
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView == self.wbTableView)
//    {
//        CGFloat sectionHeaderHeight = 44;
//        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//        }
//    }
//}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID= @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
