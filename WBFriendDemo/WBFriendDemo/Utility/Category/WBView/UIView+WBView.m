//
//  UIView+WBView.m
//  WL
//
//  Created by yinju on 2018/12/3.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "UIView+WBView.h"

@implementation UIView (WBView)
+(nullable UIView *)initViewWithFrame:(CGRect)frame BackgroundColorValue:(NSString *)backgroundColorValue   AddObject:(id)addObject{
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor colorWithHexString:backgroundColorValue];
    [addObject addSubview:view];
    return view;
}


/**
 是否需要阴影

 @param shadowColorValue 阴影的颜色
 @param shadowOpacity 阴影的透明度
 @param shadowRadius 阴影的圆角
 @param shadowOffset 阴影的偏移量
 */
-(void)addViewShadowColorValue:(NSString *)shadowColorValue ShadowOpacity:(CGFloat)shadowOpacity ShadowRadius:(CGFloat)shadowRadius ShadowOffset:(CGSize)shadowOffset {
    
    //    阴影的颜色
    self.layer.shadowColor = [UIColor colorWithHexString:shadowColorValue].CGColor;
    //    阴影的透明度
    self.layer.shadowOpacity = shadowOpacity;
    //    阴影的圆角
    self.layer.shadowRadius = shadowRadius;
    //    阴影的偏移量
    self.layer.shadowOffset = shadowOffset;
    
}


/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}


-(void)pushNavigationController:(UIViewController *)navigationController  BeforeHide:(BOOL)beforeHide AfterHide:(BOOL)afterHide{
    
    [self topViewController].hidesBottomBarWhenPushed = beforeHide;
    [[self topViewController].navigationController pushViewController:navigationController animated:YES];
    [self topViewController].hidesBottomBarWhenPushed = afterHide;
    
}

@end
