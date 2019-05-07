//
//  UIButton+WBButton.m
//  BL
//
//  Created by yinju on 2018/11/23.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "UIButton+WBButton.h"

@implementation UIButton (WBButton)

+(nullable UIButton *)initButtonWithFrame:(CGRect)frame ImageName:(nullable NSString *)imageName Title:(NSString *)title TitleColor:(NSString *)titleColor Font:(NSInteger)font BackgroundColor:(NSString *)buttonBackgroundColor Target:(nullable  id)target Action:(nullable SEL)action AddObject:(id)addObject{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    if (![imageName isEqualToString:@""]) {
        
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:titleColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    if (![buttonBackgroundColor isEqualToString:@""]) {
        
        button.backgroundColor = [UIColor colorWithHexString:buttonBackgroundColor];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [addObject addSubview:button];
    
    return button;
}


- (void)setIconInLeft
{
    [self setIconInLeftWithSpacing:0];
}

- (void)setIconInRight
{
    [self setIconInRightWithSpacing:0];
}

- (void)setIconInTop
{
    [self setIconInTopWithSpacing:0];
}

- (void)setIconInBottom
{
    [self setIconInBottomWithSpacing:0];
}

- (void)setIconInLeftWithSpacing:(CGFloat)Spacing
{
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = Spacing,
        .bottom = 0,
        .right  = -Spacing,
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = -Spacing,
        .bottom = 0,
        .right  = Spacing,
    };
}

- (void)setIconInRightWithSpacing:(CGFloat)Spacing
{
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_W + Spacing / 2),
        .bottom = 0,
        .right  =   (img_W + Spacing / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_W + Spacing / 2),
        .bottom = 0,
        .right  = - (tit_W + Spacing / 2),
    };
}

- (void)setIconInTopWithSpacing:(CGFloat)Spacing
{
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat img_H = self.imageView.frame.size.height;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    CGFloat tit_H = self.titleLabel.frame.size.height;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    =   (tit_H / 2 + Spacing / 2),
        .left   = - (img_W / 2),
        .bottom = - (tit_H / 2 + Spacing / 2),
        .right  =   (img_W / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    = - (img_H / 2 + Spacing / 2),
        .left   =   (tit_W / 2),
        .bottom =   (img_H / 2 + Spacing / 2),
        .right  = - (tit_W / 2),
    };
}

- (void)setIconInBottomWithSpacing:(CGFloat)Spacing
{
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat img_H = self.imageView.frame.size.height;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    CGFloat tit_H = self.titleLabel.frame.size.height;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    = - (tit_H / 2 + Spacing / 2),
        .left   = - (img_W / 2),
        .bottom =   (tit_H / 2 + Spacing / 2),
        .right  =   (img_W / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    =   (img_H / 2 + Spacing / 2),
        .left   =   (tit_W / 2),
        .bottom = - (img_H / 2 + Spacing / 2),
        .right  = - (tit_W / 2),
    };
}








@end
