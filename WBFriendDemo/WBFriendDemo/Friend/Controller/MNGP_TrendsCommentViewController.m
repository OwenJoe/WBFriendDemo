//
//  MNGP_TrendsCommentViewController.m
//  MNGP_GP
//
//  Created by yinju on 2019/4/8.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_TrendsCommentViewController.h"
#import "MNGP_TrendsContentOneCell.h"
#import "WLCommentView.h"
#import "XHInputView.h"
@interface MNGP_TrendsCommentViewController ()<XHInputViewDelagete>
/**/
@property (nonatomic,strong) NSMutableArray *listArray;
/**/
@property (nonatomic,strong) WLCommentView *commentView;
@end

@implementation MNGP_TrendsCommentViewController

-(NSMutableArray *)listArray{
    
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"评论";
    [self addWBTableViewStyle:WBTableViewStylePlain];
    self.wbTableView.backgroundColor = WBColor(@"#ffffff");
    self.wbTableView.rowHeight = UITableViewAutomaticDimension;
    self.wbTableView.estimatedRowHeight = 100;
    self.wbTableView.separatorStyle = UITableViewCellSelectionStyleNone;

    //尾部
    [self addCommentTextView];

    [self getDataForComment];
    
    [self.wbTableView.mj_header beginRefreshing];

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    navigationBarHideNO
}


#pragma mark 头部刷新
-(void)headerRefresh{
    
    
    self.wbTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.listArray removeAllObjects];
        [self getDataForComment];
        [self.wbTableView.mj_header endRefreshing];
    }];
    
}

//#pragma mark 尾部刷新
//-(void)footerRefresh{
//
//    self.wbTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//
//        //        [self.homeTableView.mj_footer endRefreshing];
//        [self getDataForCNSTXWithPage:self.dataPage++];
//
//    }];
//}




#pragma mark 评论数据
-(void)getDataForComment{
    
    AVQuery *query = [AVQuery queryWithClassName:@"BlogComment"];
    [query whereKey:@"blogId" equalTo:self.objectId];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        self.listArray = [NSMutableArray arrayWithArray:objects];
        [self.wbTableView reloadData];
    }];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
     return self.listArray.count;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

        
        static NSString *ID = @"cell001";
        MNGP_TrendsContentOneCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"MNGP_TrendsContentOneCell" owner:nil options:nil].firstObject;
        }
        cell.objects = self.listArray[indexPath.row];
        return cell;
   

    
    return nil;
}



/********************调起评论模块******************************/
#pragma mark 新增底部评论UI
-(void)addCommentTextView{
    
    self.commentView = [[WLCommentView alloc]initWithFrame:CGRectMake(0, WBScreenHeight-45*KHeightRate-64*KHeightRate, WBScreenWidth, 45*KHeightRate)];
    self.commentView.backgroundColor = WBColor(@"#2B2A29");
    WEAKSELF
    self.commentView.commentBlock = ^{
        STRONGSELF
        
        [strongSelf showXHInputViewWithStyle:InputViewStyleDefault];//显示样式一
    };
    [self.view addSubview:self.commentView];
}


#pragma mark 弹出评论输入框
-(void)showXHInputViewWithStyle:(InputViewStyle)style{
    
    [XHInputView showWithStyle:style configurationBlock:^(XHInputView *inputView) {
        /** 请在此block中设置inputView属性 */
        
        /** 代理 */
        inputView.delegate = self;
        
        /** 占位符文字 */
        inputView.placeholder = @"请输入评论文字...";
        /** 设置最大输入字数 */
        inputView.maxCount = 50;
        /** 输入框颜色 */
        inputView.textViewBackgroundColor = [UIColor groupTableViewBackgroundColor];
        
        /** 更多属性设置,详见XHInputView.h文件 */
        
    } sendBlock:^BOOL(NSString *text) {
        if(text.length){
            NSLog(@"输入的信息为:%@",text);
            
            if (isLogin ==1) {

                
                AVObject *todo = [AVObject objectWithClassName:@"BlogComment"];
                [todo setObject:self.objectId forKey:@"blogId"];
                [todo setObject:[self getTodayNowTime] forKey:@"time"];
                [todo setObject:GetNameID forKey:@"name"];
                [todo setObject:text forKey:@"content"];
                [todo setObject:GetMyIcon forKey:@"iconUrl"];
                [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        // 存储成功
                        //                                        [self getData];
                        [XWHUDManager showSuccessTipHUD:@"评论成功"];
                        [self.wbTableView.mj_header beginRefreshing];
                    } else {
                        // 失败的话，请检查网络环境以及 SDK 配置是否正确
                    }
                }];
            }
            else{
                
                [XWHUDManager showWarningTipHUDInView:@"请先登录"];
                //                WLLoginViewController *loginVc = [[WLLoginViewController alloc]init];
                //                UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginVc];
                //                [self presentViewController:loginNav animated:YES completion:^{
                //
                //                }];
            }
            
            //            _textLab.text = text;
            return YES;//return YES,收起键盘
        }else{
            NSLog(@"显示提示框-请输入要评论的的内容");
            return NO;//return NO,不收键盘
        }
    }];
    
}


#pragma mark 获取现在时间
-(NSString *)getTodayNowTime{
    
    //获取当前时间日期
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateStr;
    dateStr=[format1 stringFromDate:date];
    NSLog(@"%@",dateStr);
    return dateStr;
}


@end
