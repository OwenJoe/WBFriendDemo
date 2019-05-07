//
//  MNGP_TrendsOneViewController.m
//  MNGP_GP
//
//  Created by yinju on 2019/3/27.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_TrendsTwoViewController.h"
#import "MNGP_TrendsCell.h"
#import "MNGP_TrendsSendViewController.h"
#import "MNGP_TrendsContentViewController.h"
#import "MNGP_TrendsViewController.h"
#import "MNGP_LoginViewController.h"
@interface MNGP_TrendsTwoViewController ()<MNGP_TrendsCellDelegate>

/**/
@property (nonatomic,strong) NSMutableArray *objects;

/**/
@property (nonatomic,strong) UIButton *sendButton;
@end

static NSString *ID = @"cell";
@implementation MNGP_TrendsTwoViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addWBTableViewStyle:WBTableViewStyleGrouped];
    
    [self.wbTableView.mj_header beginRefreshing];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    if (!_sendButton) {
        
        
        [UIButton initButtonWithFrame:CGRectMake(WBScreenWidth -80*KWidthRate, WBScreenHeight/1.5, 58*KWidthRate, 58*KHeightRate) ImageName:@"circle_button_tiwen_1" Title:@"" TitleColor:@"" Font:0 BackgroundColor:@"" Target:self Action:@selector(sendClick:) AddObject:self.view];
    }
    
}



#pragma mark
-(void)sendClick:(UIButton *)sender{
    
    if (isLogin == 0) {
        
        MNGP_LoginViewController *loginVc = [[MNGP_LoginViewController alloc]init];
        UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginVc];
        [self presentViewController:loginNav animated:YES completion:^{
        }];
    }
    else{

        MNGP_TrendsSendViewController *sendVc =   [[MNGP_TrendsSendViewController alloc]init];
        [self.fatherViewController.navigationController pushViewController:sendVc animated:YES];

    }
}


#pragma mark 网络请求
-(void)getData{
    
    [self.objects removeAllObjects];;
    AVQuery *query = [AVQuery queryWithClassName:@"Blog"];
    [query whereKey:@"isBlackList" equalTo:@(NO)];
    [query whereKey:@"type" equalTo:@"推荐"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        //其实objects 就是MJ的模型
        self.objects = [NSMutableArray arrayWithArray:objects];
        [self.wbTableView reloadData];
    }];
}

-(void)addWBTableViewStyle:(WBTableViewStyle)tableViewStyle{
    
    
    self.wbTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,  WBScreenWidth, WBScreenHeight-64*KHeightRate) style:UITableViewStyleGrouped];
    //自动计算
    self.wbTableView.rowHeight = UITableViewAutomaticDimension;
    //预估行高
    self.wbTableView.estimatedRowHeight = 300;
    
    self.wbTableView.delegate = self;
    self.wbTableView.dataSource = self;
    self.wbTableView.backgroundColor = WBColor(@"#E5E5E5");
    self.wbTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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


-(void)headerRefresh{
    
    self.wbTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self getData];
        [self.wbTableView.mj_header endRefreshing];
        [self.wbTableView.mj_footer setState:MJRefreshStateIdle];
        
    }];
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  _objects.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc]init];
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10*KHeightRate;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MNGP_TrendsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[NSBundle mainBundle]loadNibNamed:@"MNGP_TrendsCell" owner:self options:nil].firstObject;
    }
    cell.delegate = self;
    cell.isAppear = YES;
    cell.parentViewController = self.fatherViewController;
    cell.objcets = self.objects[indexPath.section];
    
    cell.sucessBlock = ^{
        
        [self reloadSingleCell:indexPath];
    };
    
    cell.blackBlock = ^(NSArray * _Nonnull objects) {
        
        [self moveToblackListWithObjects:objects];
    };
    
    return cell;
}



#pragma mark 拉黑作者 (属于删除操作)
-(void)moveToblackListWithObjects:(NSArray *)objects{
    
    
    //2.网络修改
    //    NSArray *objects = self.listArray[indexPath.section];
    AVObject *todo = [AVObject objectWithClassName:@"Blog" objectId:[objects valueForKey:@"objectId"]];
    [todo setObject:[NSNumber numberWithBool:YES] forKey:@"isBlackList"];
    [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
        if (succeeded) {
            
            //判断下标用这个方法才是正确的,否则取出来的下标值可能越界,如果是使用系统侧滑,则不需要考虑这个问题
            NSInteger section = [self.objects indexOfObject:objects];
            
            //             NSLog(@"==========>:%ld--%ld",section,indexPath.section);
            
            //1.对本地数据源操作
            [self->_objects removeObjectAtIndex:section];
            
            
            [self.wbTableView deleteSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
            
            
        }
        
    }];
    
    
}




#pragma mark 单独刷新
-(void)reloadSingleCell:(NSIndexPath *)indexPath{
    
    
    [self.objects removeAllObjects];;
    AVQuery *query = [AVQuery queryWithClassName:@"Blog"];
    [query whereKey:@"type" equalTo:@"推荐"];
    [query whereKey:@"isBlackList" equalTo:@(NO)];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        //其实objects 就是MJ的模型
        self.objects = [NSMutableArray arrayWithArray:objects];
        [self.wbTableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
    }];
}


#pragma mark 跳转到个人中心
-(void)jumpBlogPersonalCenter:(NSArray *)objects{
    
    MNGP_TrendsContentViewController *contentVc = [[MNGP_TrendsContentViewController alloc]init];
    contentVc.objects = objects;
    [self.fatherViewController.navigationController pushViewController:contentVc animated:YES];

}
@end
