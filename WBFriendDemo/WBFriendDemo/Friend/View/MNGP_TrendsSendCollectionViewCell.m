//
//  MNGP_TrendsSendCollectionViewCell.m
//  MNGP_GP
//
//  Created by yinju on 2019/4/3.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_TrendsSendCollectionViewCell.h"

@implementation MNGP_TrendsSendCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
//         self.backgroundColor = [UIColor yellowColor];
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.imgView];
        
        
        //删除标记
        self.deleteButton = [UIButton initButtonWithFrame:CGRectMake(self.frame.size.width-28*KWidthRate, 0, 28*KWidthRate, 28*KHeightRate) ImageName:@"add" Title:@"" TitleColor:@"" Font:0 BackgroundColor:@"" Target:self Action:@selector(deletePhotoChildCell:) AddObject:self];
    }
    return self;
    
}


#pragma mark 删除指定的Cell
-(void)deletePhotoChildCell:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(deletePhoto:)]) {
        
        [self.delegate deletePhoto:sender];
    }
}

@end
