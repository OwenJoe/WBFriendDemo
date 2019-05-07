//
//  UIImageView+WLImageView.h
//  WL
//
//  Created by yinju on 2018/12/3.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (WBImageView)

/**
 图片基类

 @param frame 大小
 @param imgUrl 图片url
 @param imgLocationName 本地图片名字/占位图
 @param isCircle 是否圆角
 @param circleRadius 圆角值
 @param isTap 是否点击
 @param target self
 @param action 点击方法
 @param addObject 添加到哪个View上
 @return <#return value description#>
 */
+(nullable UIImageView *)initImgViewFrame:(CGRect)frame ImgUrl:(NSString *)imgUrl ImgLocationName:(NSString *)imgLocationName IsCircle:(BOOL)isCircle CircleRadius:(NSInteger)circleRadius IsTap:(BOOL)isTap Target:(nullable  id)target Action:(nullable SEL)action AddObject:(id)addObject;
@end

NS_ASSUME_NONNULL_END
