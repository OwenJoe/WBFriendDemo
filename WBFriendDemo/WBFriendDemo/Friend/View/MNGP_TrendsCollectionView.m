//
//  MNGP_TrendsCollectionView.m
//  MNGP_GP
//
//  Created by zhuwb on 2019/3/27.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_TrendsCollectionView.h"
#import "MNGP_TrendsCollectionViewCell.h"
#import "HRPhotoBroserView.h"
//设置标识
static NSString *indentify = @"indentify";

@implementation MNGP_TrendsCollectionView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self initCollectionViewMethod];
}

#pragma mark -- 初始化九宫格
-(void)initCollectionViewMethod{
    
    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设定垂直滚动
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

//    self.backgroundColor = [UIColor lightGrayColor];
    self.scrollEnabled = NO;

//    //代理
    self.delegate = self;
    self.dataSource =self;
    
    //注册头部和尾部和cell单元格
    [self registerClass:[MNGP_TrendsCollectionViewCell class] forCellWithReuseIdentifier:indentify];
   
    
}


#pragma mark -- 组数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

#pragma mark -- 个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _pictChildArray.count;
}

#pragma mark -- 内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MNGP_TrendsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentify forIndexPath:indexPath ];
    if (cell == nil) {
        
        
        NSLog(@"无法创建九宫格");
    }
    
    [cell.iconImgView sd_setImageWithURL:[NSURL URLWithString:_pictChildArray[indexPath.row]] placeholderImage:[UIImage imageNamed:@"占位图"]];
    return cell;
}

#pragma mark -- 设置头尾部内容
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        
      
    }
    if (kind == UICollectionElementKindSectionFooter) {
     
    }
    
    return reusableView;
    
}


/**********************collectionView布局***************************************/
#pragma mark -- 每个collectionView大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(93*KWidthRate, 95*KHeightRate);
}

#pragma mark -- collectionView距离上左下右位置设置
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10*KHeightRate, 5*KWidthRate, 0, 0);
}


#pragma mark --  collectionView之间最小列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
}

#pragma mark -- collectionView之间最小行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10*KHeightRate;
}

#pragma mark -- 选中事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"选中了:%ld",indexPath.row);
    
    [HRPhotoBroserView initWithImgUrlArrys:_pictChildArray PhotosTag:indexPath.row MainViewController:[self topViewController] PageindicatorStyle:1 BackgroundStyle:1];
}


@end
