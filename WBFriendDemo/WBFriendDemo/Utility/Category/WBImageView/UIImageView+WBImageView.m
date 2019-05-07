//
//  UIImageView+WLImageView.m
//  WL
//
//  Created by yinju on 2018/12/3.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "UIImageView+WBImageView.h"

@implementation UIImageView (WBImageView)
+(nullable UIImageView *)initImgViewFrame:(CGRect)frame ImgUrl:(NSString *)imgUrl ImgLocationName:(NSString *)imgLocationName IsCircle:(BOOL)isCircle CircleRadius:(NSInteger)circleRadius IsTap:(BOOL)isTap Target:(nullable  id)target Action:(nullable SEL)action AddObject:(id)addObject{
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:frame];
    if (isCircle == YES) {
        imgView.layer.masksToBounds = YES;
        imgView.layer.cornerRadius = circleRadius;
        imgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    if (isTap == YES) {
        
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *imgTap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
        [imgView addGestureRecognizer:imgTap];
    }
//    if ([imgUrl isEqualToString:@""]) {
    
        [imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:imgLocationName]];
//    }
    [addObject addSubview:imgView];
    
    return imgView;
}
@end
