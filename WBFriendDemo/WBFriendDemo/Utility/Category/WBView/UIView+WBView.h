//
//  UIView+WBView.h
//  WL
//
//  Created by yinju on 2018/12/3.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,rectCornerValue){
    
     rectTopLeftValue = 0,//左上角
     rectTopRightValue = 1,//右上角
     rectBottomLeftValue = 2,//左下角
     rectBottomRightValue = 3//右下角
};

@interface UIView (WBView)


/**
 初始化

 @param frame <#frame description#>
 @param backgroundColorValue <#backgroundColorValue description#>
 @param addObject <#addObject description#>
 @return <#return value description#>
 */
+(nullable UIView *)initViewWithFrame:(CGRect)frame BackgroundColorValue:(NSString *)backgroundColorValue   AddObject:(id)addObject;

/**
 是否需要阴影

 @param shadowColorValue 阴影的颜色
 @param shadowOpacity 阴影的透明度
 @param shadowRadius 阴影的圆角
 @param shadowOffset 阴影的偏移量
 */
-(void)addViewShadowColorValue:(NSString *)shadowColorValue ShadowOpacity:(CGFloat)shadowOpacity ShadowRadius:(CGFloat)shadowRadius ShadowOffset:(CGSize)shadowOffset;


/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;

/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;


/**
 push跳转控制器
 
 @param navigationController 将要跳转的控制器
 @param beforeHide 隐藏tabbar(前)
 @param afterHide 隐藏tabbar(后)
 */
-(void)pushNavigationController:(UIViewController *)navigationController  BeforeHide:(BOOL)beforeHide AfterHide:(BOOL)afterHide;
@end

NS_ASSUME_NONNULL_END
