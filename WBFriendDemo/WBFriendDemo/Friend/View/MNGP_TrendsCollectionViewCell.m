//
//  MNGP_TrendsCollectionViewCell.m
//  MNGP_GP
//
//  Created by zhuwb on 2019/3/27.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_TrendsCollectionViewCell.h"

@implementation MNGP_TrendsCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
   self =  [super initWithFrame:frame];
    if (self) {
        
        self.iconImgView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:self.iconImgView];
        self.iconImgView.backgroundColor = [UIColor redColor];
    }
    return self;
}
@end
