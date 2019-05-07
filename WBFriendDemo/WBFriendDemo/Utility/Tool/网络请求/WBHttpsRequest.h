//
//  ZHttpsRequest.h
//  仿朋友圈
//
//  Created by imac on 2017/2/21.
//  Copyright © 2017年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBHttpsRequest : NSObject

+(WBHttpsRequest *)shareInstance;


/**
 GET网络请求
 
 @param Url 请求url
 @param parameters boday参数
 @param sucess 成功回调
 @param failure 失败回调
 */
-(void)GetHttpWithUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure;

/**
 Get请求 带Header
 @param Url 请求url
 @param parameters boday参数
 @param sucess 成功回调
 @param failure 失败回调
 */
-(void)GetHttpWithHeaderAndUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure;


/**
 POST网络请求
 
 @param Url 请求url
 @param parameters boday参数
 @param sucess 成功回调
 @param failure 失败回调
 
 */
-(void)PostHttpWithUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure;

/**
 Post请求 带Header
 
 @param header 头部 可以直接给空
 @param Url 请求url
 @param parameters boday参数
 @param sucess 成功回调
 @param failure 失败回调
 */
-(void)PostHttpWithHeaderAndUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure;


/**
 上传单张图片
 
 @param image <#image description#>
 */
-(void)UploadImage:(UIImage *)image  sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure;

@end
