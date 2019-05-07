//
//  MNGP_TrendsContentViewController.m
//  MNGP_GP
//
//  Created by yinju on 2019/4/2.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_TrendsContentViewController.h"
#import "MNGP_TrendsContentOneCell.h"
#import "WLCommentView.h"
#import "MNGP_TrendsContentThreeCell.h"
#import "MNGP_TrendsContentHeaderView.h"
#import "MNGP_TrendsCell.h"
#import "XHInputView.h"



@interface MNGP_TrendsContentViewController ()<XHInputViewDelagete>
/**/
@property (nonatomic,strong)  WLCommentView *commentView;
/**/
@property (nonatomic,strong) NSString *buttonText;
/**/
@property (nonatomic,strong) NSMutableArray *listArray;

/**/
@property (nonatomic,strong) NSArray *wenGuObjects;
/**/
@property (nonatomic,strong) NSArray *qunLiaoObjects;

@end

@implementation MNGP_TrendsContentViewController

-(NSMutableArray *)listArray{
    
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addWBTableViewStyle:WBTableViewStylePlain];
    self.wbTableView.backgroundColor = WBColor(@"#F2F2F2");
    self.wbTableView.rowHeight = UITableViewAutomaticDimension;
    self.wbTableView.estimatedRowHeight = 100;
    self.wbTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    //r默认
    self.buttonText = @"问股";
    [self getDataForWenGu];
    
    [self addHeaderViewUI];
    
   
    //尾部
    [self addCommentTextView];
    
    //返回
    [UIButton initButtonWithFrame:CGRectMake(15*KWidthRate, 15*KHeightRate, 10*KWidthRate, 16*KHeightRate) ImageName:@"return" Title:@"" TitleColor:@"" Font:0 BackgroundColor:@"" Target:self Action:@selector(back:) AddObject:self.view];
}

-(void)back:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 头部
-(void)addHeaderViewUI{
    
    MNGP_TrendsContentHeaderView *headerView = [[NSBundle mainBundle]loadNibNamed:@"MNGP_TrendsContentHeaderView" owner:nil options:nil].firstObject;
    headerView.objectId = [self.objects valueForKey:@"objectId"];
    headerView.isAttention = [self.objects valueForKey:@"isAttention"];
    
    headerView.contentLabel.text = [self.objects valueForKey:@"sign"];
    headerView.nameLabel.text = [self.objects valueForKey:@"name"];
    headerView.FansLabel.text = [self.objects valueForKey:@"fansNum"];
    headerView.attentionLabel.text = [self.objects valueForKey:@"attentionNum"];
    [headerView.bgImgView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554375381085&di=c15bdefdfe1799082d32042bb225596f&imgtype=0&src=http%3A%2F%2Fi8.hexun.com%2F2018-03-19%2F192649375.jpg"] placeholderImage:[UIImage imageNamed:@"占位图"]];
    [headerView.iconImgView sd_setImageWithURL:[self.objects valueForKey:@"iconUrl"] placeholderImage:[UIImage imageNamed:@"占位图"]];
//    [headerView setHeight:360*KHeightRate];
    self.wbTableView.tableHeaderView  = headerView;
    
    WEAKSELF
    headerView.choseBlock = ^(NSString * _Nonnull buttonText) {
        STRONGSELF
        
        strongSelf.buttonText = buttonText;
        if ([self.buttonText isEqualToString:@"问股"]) {
            
            self.commentView.hidden = NO;
            [strongSelf getDataForWenGu];
        }
        
        else if ([self.buttonText isEqualToString:@"群聊"]) {
            
            self.commentView.hidden = NO;
            [strongSelf getDataQunLiao];
        }
        else{
            
            self.commentView.hidden = YES;
            [strongSelf.wbTableView reloadData];
        }

    };
}


#pragma mark 问股数据
-(void)getDataForWenGu{
    
    AVQuery *query = [AVQuery queryWithClassName:@"MyQuestion"];
    [query whereKey:@"quesetionId" equalTo:[self.objects valueForKey:@"objectId"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        self.wenGuObjects = [NSArray arrayWithArray:objects];
        [self.wbTableView reloadData];
    }];
}


#pragma mark 群聊数据
-(void)getDataQunLiao{
    
    AVQuery *query = [AVQuery queryWithClassName:@"Chatting"];
    [query whereKey:@"quesetionId" equalTo:[self.objects valueForKey:@"objectId"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        self.qunLiaoObjects = [NSArray arrayWithArray:objects];
        [self.wbTableView reloadData];
    }];
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    navigationBarHideNO
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    navigationBarHideYes
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([self.buttonText isEqualToString:@"问股"]) {
        
         return self.wenGuObjects.count;
    }
    else if ([self.buttonText isEqualToString:@"观点"]) {
        
        return 1;
    }
    else if ([self.buttonText isEqualToString:@"群聊"]) {
        
        return self.qunLiaoObjects.count;
    }
    
     return 1;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    if ([self.buttonText isEqualToString:@"问股"]) {
        
        static NSString *ID = @"cell001";
        MNGP_TrendsContentOneCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"MNGP_TrendsContentOneCell" owner:nil options:nil].firstObject;
        }
        cell.objects = self.wenGuObjects[indexPath.row];
        return cell;
    }
    else if ([self.buttonText isEqualToString:@"观点"]) {
        
        
        static NSString *ID = @"cell002";
        MNGP_TrendsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"MNGP_TrendsCell" owner:nil options:nil].firstObject;
        }
        cell.isAppear = YES;
        cell.objcets = self.objects;
        return cell;
    }
     else if ([self.buttonText isEqualToString:@"群聊"]) {
        
         
         static NSString *ID = @"cell003";
         MNGP_TrendsContentThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
         if (cell == nil) {
             cell = [[NSBundle mainBundle]loadNibNamed:@"MNGP_TrendsContentThreeCell" owner:nil options:nil].firstObject;
         }
         cell.backgroundColor = WBColor(@"#1F1F1F");
          cell.objects = self.qunLiaoObjects[indexPath.row];
         return cell;
    }
    
    return nil;
}





/********************调起评论模块******************************/
#pragma mark 新增底部评论UI
-(void)addCommentTextView{
    
    self.commentView = [[WLCommentView alloc]initWithFrame:CGRectMake(0, WBScreenHeight-45*KHeightRate, WBScreenWidth, 45*KHeightRate)];
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
                
                
                NSString *class ;
                if ([self.buttonText isEqualToString:@"问股"]) {
                    
                    class = @"MyQuestion";
                }
                else if ([self.buttonText isEqualToString:@"群聊"]) {
                    
                     class = @"Chatting";
                }
                
                                AVObject *todo = [AVObject objectWithClassName:class];
                                [todo setObject:[self.objects valueForKey:@"objectId"] forKey:@"quesetionId"];
                                [todo setObject:[self getTodayNowTime] forKey:@"time"];
                                [todo setObject:GetNameID forKey:@"name"];
                                [todo setObject:text forKey:@"content"];
                                [todo setObject:GetMyIcon forKey:@"iconUrl"];
                                [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                    if (succeeded) {
                                        // 存储成功
//                                        [self getData];
                                        [XWHUDManager showSuccessTipHUD:@"评论成功"];
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
