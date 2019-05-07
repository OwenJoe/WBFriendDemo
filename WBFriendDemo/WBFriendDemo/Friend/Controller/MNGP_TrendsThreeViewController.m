//
//  MNGP_TrendsOneViewController.m
//  MNGP_GP
//
//  Created by yinju on 2019/3/27.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_TrendsThreeViewController.h"
#import "MNGP_FamousCell.h"
#import "MNGP_TrendsModel.h"
@interface MNGP_TrendsThreeViewController ()

/**/
@property (nonatomic,strong) UIButton *sendButton;
/**/
@property (nonatomic,strong) MNGP_TrendsModel *model;
/**/
@property (nonatomic,strong) NSMutableArray *listArray;
@end

static NSString *ID = @"cell";
@implementation MNGP_TrendsThreeViewController

-(MNGP_TrendsModel *)model{
    
    if (!_model) {
        _model = [[MNGP_TrendsModel alloc]init];
    }
    return _model;
}


-(NSMutableArray *)listArray{
    
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addWBTableViewStyle:WBTableViewStyleGrouped];
    
    [self getData];
    
}


-(void)getData{
    
    //type 默认1 沪深、2 港股 、 3 美股 、4 比特币 、5 期货、6 外汇
    [[WBHttpsRequest shareInstance]GetHttpWithUrl:@"http://data.fk7h.com/yapi/sina_news/netease?" Parameters:@{@"type":@"1"} sucess:^(id responseObject) {
        
        NSArray *array = [NSArray arrayWithArray:responseObject[@"data"]];
        NSArray *brry = [MNGP_TrendsModel mj_objectArrayWithKeyValuesArray:array];
        [self.listArray addObjectsFromArray:brry];
        [self.wbTableView reloadData];
        
    } failure:^(NSError *error) {
        
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  _listArray.count;
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
    
    MNGP_FamousCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[NSBundle mainBundle]loadNibNamed:@"MNGP_FamousCell" owner:self options:nil].firstObject;
    }
    cell.model = self.listArray[indexPath.section];
    
    return cell;
}

@end
