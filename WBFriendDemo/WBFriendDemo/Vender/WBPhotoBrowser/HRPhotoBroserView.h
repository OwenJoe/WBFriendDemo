//
//  WBPhotoBroserView.h
//  WBPhotoBroserView
//
//  Created by owen on 2017/10/31.
//  Copyright © 2017年 owen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDWebImageManager.h"
#import "HoriSDImageManager.h"
#import "HoriPhotoBrowser.h"

typedef NS_ENUM(NSInteger, HoriImageManagerType) {
    
    //默认图像缓存框架是SDWebImage
    HoriImageManagerTypeSDWebImage,
    HoriImageManagerTypeYYWebImage
};



@interface HRPhotoBroserView : NSObject

@property (nonatomic, assign) HoriImageManagerType imageManagerType;
@property (nonatomic, assign) HoriPhotoBrowserInteractiveDismissalStyle dismissalStyle;
@property (nonatomic, assign) HoriPhotoBrowserBackgroundStyle backgroundStyle;
@property (nonatomic, assign) HoriPhotoBrowserPageIndicatorStyle pageindicatorStyle;
@property (nonatomic, assign) HoriPhotoBrowserImageLoadingStyle loadingStyle;
@property (nonatomic, assign) BOOL bounces;


/**
 从网址获取图像 (多个图像)

 @param imgUrlArrys 图像数组
 @param photosTag 图像对应的tag值
 @param mainViewController 当前View的顶级控制器
 @param pageindicatorStyle 显示当前图片所在位置样式 0:pageControl样式  1:数字样式
 @param backgroundStyle 背景蒙版 0:图像玻璃蒙版  1:普通蒙版  2:黑色
 */
+(void)initWithImgUrlArrys:(NSMutableArray *)imgUrlArrys  PhotosTag:(NSUInteger)photosTag MainViewController:(UIViewController *)mainViewController  PageindicatorStyle:(NSUInteger)pageindicatorStyle BackgroundStyle:(NSUInteger)backgroundStyle;


/**
 从本地获取图像 (多个图像)

 @param imgViewArrys 图像数组
 @param photosTag 图像对应的tag值
 @param mainViewController 当前View的顶级控制器
 @param pageindicatorStyle 显示当前图片所在位置样式 0:pageControl样式  1:数字样式
 @param backgroundStyle 背景蒙版 0:图像玻璃蒙版  1:普通蒙版  2:黑色
 */
+(void)initWithImgViewArrys:(NSMutableArray *)imgViewArrys PhotosTag:(NSUInteger)photosTag MainViewController:(UIViewController *)mainViewController  PageindicatorStyle:(NSUInteger)pageindicatorStyle BackgroundStyle:(NSUInteger)backgroundStyle;


/**
 从网络获取图像 (单个图像)

 @param imgUrlString 图像网址
 @param mainViewController 当前View的顶级控制器
 @param pageindicatorStyle 显示当前图片所在位置样式 0:pageControl样式  1:数字样式
 @param backgroundStyle 背景蒙版 0:图像玻璃蒙版  1:普通蒙版  2:黑色
 */
+(void)initWithImgUrlString:(NSString *)imgUrlString  MainViewController:(UIViewController *)mainViewController  PageindicatorStyle:(NSUInteger)pageindicatorStyle BackgroundStyle:(NSUInteger)backgroundStyle ;



/**
 从本地获取图像 (单个图像)

 @param imgLocationString 本地图像字符串
 @param mainViewController 当前View的顶级控制器
 @param pageindicatorStyle 显示当前图片所在位置样式 0:pageControl样式  1:数字样式
 @param backgroundStyle 背景蒙版 0:图像玻璃蒙版  1:普通蒙版  2:黑色
 */
+(void)initWithImgLocationString:(NSString *)imgLocationString  MainViewController:(UIViewController *)mainViewController  PageindicatorStyle:(NSUInteger)pageindicatorStyle BackgroundStyle:(NSUInteger)backgroundStyle;
@end
