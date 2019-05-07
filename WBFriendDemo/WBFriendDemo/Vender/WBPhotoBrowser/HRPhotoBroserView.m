//
//  WBPhotoBroserView.m
//  WBPhotoBroserView
//
//  Created by owen on 2017/10/31.
//  Copyright © 2017年 owen. All rights reserved.
//

#import "HRPhotoBroserView.h"

@implementation HRPhotoBroserView


+(void)initWithImgUrlArrys:(NSMutableArray *)imgUrlArrys  PhotosTag:(NSUInteger)photosTag MainViewController:(UIViewController *)mainViewController  PageindicatorStyle:(NSUInteger)pageindicatorStyle BackgroundStyle:(NSUInteger)backgroundStyle {
    
    NSMutableArray *items = @[].mutableCopy;
    for (int i = 0; i < imgUrlArrys.count; i++) {
        UIImageView * imageView;
        HoriPhotoItem *item = [HoriPhotoItem itemWithSourceView:imageView imageUrl:[NSURL URLWithString:imgUrlArrys[i]]];
        [items addObject:item];
    }
    HoriPhotoBrowser *browser = [HoriPhotoBrowser browserWithPhotoItems:items selectedIndex:photosTag];
    browser.delegate = (id)self;
    browser.dismissalStyle = HoriPhotoBrowserInteractiveDismissalStyleScale;
    browser.backgroundStyle = backgroundStyle;
    browser.loadingStyle = HoriPhotoBrowserImageLoadingStyleIndeterminate;
    browser.pageindicatorStyle = pageindicatorStyle;
    browser.bounces = NO;
    [browser showFromViewController:mainViewController];
    
}

+(void)initWithImgViewArrys:(NSMutableArray *)imgViewArrys PhotosTag:(NSUInteger)photosTag MainViewController:(UIViewController *)mainViewController  PageindicatorStyle:(NSUInteger)pageindicatorStyle BackgroundStyle:(NSUInteger)backgroundStyle {
    
    NSMutableArray *items = @[].mutableCopy;
    for (int i = 0; i<imgViewArrys.count; i++) {
        
        UIImageView * imageView;
        HoriPhotoItem * item = [HoriPhotoItem itemWithSourceView:imageView image:[UIImage imageNamed:imgViewArrys[i]]];
        [items addObject: item];
    }
    
    HoriPhotoBrowser *browser = [HoriPhotoBrowser browserWithPhotoItems:items selectedIndex:photosTag];
    browser.delegate = (id)self;
    browser.dismissalStyle = HoriPhotoBrowserInteractiveDismissalStyleScale;
    browser.backgroundStyle = backgroundStyle;
    browser.loadingStyle = HoriPhotoBrowserImageLoadingStyleIndeterminate;
    browser.pageindicatorStyle = pageindicatorStyle;
    browser.bounces = NO;
    [browser showFromViewController:mainViewController];
    
}



+(void)initWithImgUrlString:(NSString *)imgUrlString  MainViewController:(UIViewController *)mainViewController  PageindicatorStyle:(NSUInteger)pageindicatorStyle BackgroundStyle:(NSUInteger)backgroundStyle {
    
    NSArray *arry = [NSArray arrayWithObject:imgUrlString];
    NSMutableArray *items = @[].mutableCopy;

    
    
    UIImageView * imageView;
    HoriPhotoItem *item = [HoriPhotoItem itemWithSourceView:imageView imageUrl:[NSURL URLWithString:arry[0]]];
    [items addObject:item];

    HoriPhotoBrowser *browser = [HoriPhotoBrowser browserWithPhotoItems:items selectedIndex:0];
    browser.delegate = (id)self;
    browser.dismissalStyle = HoriPhotoBrowserInteractiveDismissalStyleScale;
    browser.backgroundStyle = backgroundStyle;
    browser.loadingStyle = HoriPhotoBrowserImageLoadingStyleIndeterminate;
    browser.pageindicatorStyle = pageindicatorStyle;
    browser.bounces = NO;

    [browser showFromViewController:mainViewController];
    
}


+(void)initWithImgLocationString:(NSString *)imgLocationString  MainViewController:(UIViewController *)mainViewController  PageindicatorStyle:(NSUInteger)pageindicatorStyle BackgroundStyle:(NSUInteger)backgroundStyle {
    
    NSMutableArray *items = @[].mutableCopy;
    NSArray *arry = [NSArray arrayWithObject:imgLocationString];
        
    UIImageView * imageView;
    HoriPhotoItem * item = [HoriPhotoItem itemWithSourceView:imageView image:[UIImage imageNamed:arry[0]]];
    [items addObject: item];

    
    HoriPhotoBrowser *browser = [HoriPhotoBrowser browserWithPhotoItems:items selectedIndex:0];
    browser.delegate = (id)self;
    browser.dismissalStyle = HoriPhotoBrowserInteractiveDismissalStyleScale;
    browser.backgroundStyle = backgroundStyle;
    browser.loadingStyle = HoriPhotoBrowserImageLoadingStyleIndeterminate;
    browser.pageindicatorStyle = pageindicatorStyle;
    browser.bounces = NO;
    [browser showFromViewController:mainViewController];
    
}





@end
