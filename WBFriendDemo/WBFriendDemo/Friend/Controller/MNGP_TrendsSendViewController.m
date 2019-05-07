//
//  MNGP_TrendsSendViewController.m
//  MNGP_GP
//
//  Created by yinju on 2019/4/3.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_TrendsSendViewController.h"
#import "MNGP_TrendsSendCollectionViewCell.h"
#import "AVFile.h"
#import "TZImagePickerController.h"
#import "HRPhotoBroserView.h"
@interface MNGP_TrendsSendViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MNGP_TrendsSendCollectionViewCellDelegate,UITextViewDelegate,TZImagePickerControllerDelegate>

@property (nonatomic,strong) UICollectionView *photoCollectionView;
/**/
@property (nonatomic,strong) NSMutableArray *listArray;
/**/
@property (nonatomic,strong) UIButton *addButton;
/**/
@property (nonatomic,strong) UIButton *deleteButton;
/**/
@property (nonatomic,strong) UILabel *textLabel;
/*存放图片的Url地址*/
@property (nonatomic,strong) NSMutableArray *photoUrlArray;
/**/
@property (nonatomic,strong) UITextView *textView;
@end

//设置标识
static NSString *indentify = @"indentify";
@implementation MNGP_TrendsSendViewController

-(NSMutableArray *)photoUrlArray{
    
    if (!_photoUrlArray) {
        _photoUrlArray =  [NSMutableArray array];
    }
    return _photoUrlArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _listArray = [NSMutableArray arrayWithObjects:@"", nil];
    self.title = @"发表";
    self.view.backgroundColor = WBColor(@"#f2f2f2");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishClick:)];
    
    [self initCollectionViewMethod];
    
    [self addTextViewUI];
}

#pragma mark 添加TextView
-(void)addTextViewUI{
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, WBScreenWidth, 220*KHeightRate)];
    self.textView.delegate = self;
    self.textView.font = [UIFont systemFontOfSize:16*KWidthRate];
    [self.view addSubview:self.textView];
    
    self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(15*KWidthRate, 10*KHeightRate, WBScreenWidth-30*KWidthRate, 20)];
    self.textLabel.text = @"此刻,写下你的想法......";
    self.textLabel.textColor = [UIColor lightGrayColor];
    self.textLabel.font = [UIFont systemFontOfSize:16*KWidthRate];
    [self.textLabel sizeToFit];
    self.textLabel.hidden = NO;
    [self.textView addSubview:self.textLabel];
}

-(void)textViewDidChange:(UITextView *)textView{
    
    if (textView.text.length>0) {
        
        self.textLabel.hidden = YES;
    }
    else{
        
        self.textLabel.hidden = NO;
    }
    
}




#pragma mark 完成
-(void)finishClick:(id)sender{
    
    
    if (self.textView.text.length<=0) {
        
        [XWHUDManager showTipHUD:@"发布内容不能为空哦!"];
        return;
    }
    else{
            
            AVObject *todo = [AVObject objectWithClassName:@"Blog"];
//        [todo setObject:@"这个用户很懒,没有留下任何签名..." forKey:@"sign"];
        [todo setObject:[NSNumber numberWithBool:NO] forKey:@"isBlackList"];
        [todo setObject:[NSNumber numberWithBool:YES] forKey:@"isAttention"];
            [todo setObject:GetNameID forKey:@"name"];
            [todo setObject:GetMyIcon forKey:@"iconUrl"];
//        [todo setObject:@"关注" forKey:@"type"];
            [todo setObject:self.textView.text forKey:@"Content"];

     
        if (self.photoUrlArray.count != 0) {//等于0 没必要执行这个存储图片操作 y
            
            [todo setObject:[self.photoUrlArray componentsJoinedByString:@","] forKey:@"images"];
        }
        
        
        
        
            [todo setObject:[self getTodayNowTime] forKey:@"time"];
            [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    
                    [XWHUDManager showSuccessTipHUD:@"发布成功"];
                    [self.navigationController popViewControllerAnimated:YES];
                } else {
                    // 失败的话，请检查网络环境以及 SDK 配置是否正确
                    [XWHUDManager showSuccessTipHUD:@"发布失败"];
                }
            }];
    }
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




#pragma mark -- 初始化九宫格
-(void)initCollectionViewMethod{
    
    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设定垂直滚动
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    
    //设置uicollectionView
    self.photoCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 230*KHeightRate, self.view.frame.size.width, WBScreenHeight - 230*KHeightRate) collectionViewLayout:flowLayout];
    self.photoCollectionView.backgroundColor = WBColor(@"#f2f2f2");
    self.photoCollectionView.scrollEnabled = NO;
    

    
    //代理
    self.photoCollectionView.delegate = self;
    self.photoCollectionView.dataSource =self;
    [self.view addSubview:self.photoCollectionView];
    
    //注册头部和尾部和cell单元格
    [self.photoCollectionView registerClass:[MNGP_TrendsSendCollectionViewCell class] forCellWithReuseIdentifier:indentify];

    
}


#pragma mark -- 组数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

#pragma mark -- 个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return _listArray.count;
}

#pragma mark -- 内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MNGP_TrendsSendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentify forIndexPath:indexPath];
    if (!cell) {
        
        NSLog(@"无法创建九宫格");
    }
    cell.delegate = self;
    cell.deleteButton.tag = indexPath.row;
    
    
    //新增标记
    if (indexPath.row == _listArray.count-1) {
        
         cell.deleteButton.hidden = YES;
         cell.imgView.image = [UIImage imageNamed:@"choose01"];
        
        
    }
    else{

        cell.deleteButton.hidden = NO;
        cell.imgView.image = _listArray[indexPath.row+1];

    }

   
    
    
    
    return cell;
}

#pragma mark 删除指定的Cell
-(void)deletePhoto:(UIButton *)sender{
    
    [_listArray removeObjectAtIndex:sender.tag+1];
    [_photoUrlArray removeObjectAtIndex:sender.tag+1];
    [self.photoCollectionView reloadData];
}



#pragma mark -- 设置头尾部内容
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;
    return reusableView;
    
}


/**********************collectionView布局***************************************/
#pragma mark -- 每个collectionView大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(111*KWidthRate, 111*KHeightRate);
}

#pragma mark -- collectionView距离上左下右位置设置
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


#pragma mark --  collectionView之间最小列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10;
}

#pragma mark -- collectionView之间最小行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10;
}

#pragma mark -- 选中事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

    if (indexPath.row == _listArray.count-1) {
        
        
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
        

        // 你可以通过block或者代理，来得到用户选择的照片.
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {

            [self.listArray addObjectsFromArray:photos];
            [self.photoCollectionView reloadData];
            //                NSLog(@"我选择的图片:%@",self.listArray);
            
            
            //遍历调用方法取
            [photos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                 [self endPhotoArray:photos[idx]];
            }];
            
        }];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
        [self.photoCollectionView reloadData];

    }
    else{
        
        NSLog(@"选中了:%ld",indexPath.row);
        
        
        [HRPhotoBroserView initWithImgUrlArrys:_photoUrlArray  PhotosTag:indexPath.row MainViewController:self PageindicatorStyle:1 BackgroundStyle:1];
    }
}


#pragma mark 先获取图片URL的最终数组
-(void)endPhotoArray:(UIImage *)image{
    
    [XWHUDManager showHUD];
    WEAKSELF
    [[WBHttpsRequest shareInstance]UploadImage:image sucess:^(id responseObject) {
    STRONGSELF
        NSLog(@"%@",responseObject);
        [strongSelf.photoUrlArray addObject:responseObject];
        [XWHUDManager hide];
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
   
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    navigationBarHideNO
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    navigationBarHideNO
}


@end
