//
//  UIView+LXShadowPath.h
//  LXViewShadowPath
//
//  Created by chenergou on 2017/11/23.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum :NSInteger{
    
    WBShadowPathLeft,
    
    WBShadowPathRight,
    
    WBShadowPathTop,

    WBShadowPathBottom,

    WBShadowPathNoTop,
    
    WBShadowPathAllSide

} WBShadowPathSide;
@interface UIView (WBShadowPath)

/*
 * shadowColor 阴影颜色
 *
 * shadowOpacity 阴影透明度，默认0
 *
 * shadowRadius  阴影半径，默认3
 *
 * shadowPathSide 设置哪一侧的阴影，
 
 * shadowPathWidth 阴影的宽度，

 */

-(void)WB_SetShadowPathWith:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowSide:(WBShadowPathSide)shadowPathSide shadowPathWidth:(CGFloat)shadowPathWidth;
@end
