//
//  ZHttpsRequest.m
//  仿朋友圈
//
//  Created by imac on 2017/2/21.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "WBHttpsRequest.h"


@implementation WBHttpsRequest

static WBHttpsRequest *httpRequest = nil;
+(WBHttpsRequest *)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            
            httpRequest = [[WBHttpsRequest alloc]init];
            
        }
    });
    return httpRequest;
    
    
}

/**
 GET网络请求
 
 @param Url 请求url
 @param parameters boday参数
 @param sucess 成功回调
 @param failure 失败回调
 */
-(void)GetHttpWithUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];

    //解析后缀名为html的json数据了
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
  
    
    [session GET:Url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        sucess(responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}


/**
 Get请求 带Header
 @param Url 请求url
 @param parameters boday参数
 @param sucess 成功回调
 @param failure 失败回调
 */
-(void)GetHttpWithHeaderAndUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //解析后缀名为html的json数据了
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
    [session.requestSerializer setValue:GetToken forHTTPHeaderField:@"XX-Token"];
    [session.requestSerializer setValue:@"iphone" forHTTPHeaderField:@"XX-Device-Type"];
    [session GET:Url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        sucess(responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}



/**
 POST网络请求
 
 @param Url 请求url
 @param parameters boday参数
 @param sucess 成功回调
 @param failure 失败回调
 
 */
-(void)PostHttpWithUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //解析后缀名为html的json数据了
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript",@"text/plain",@"image/gif",@"text/plain",@"image/gif", nil];

    
    [session POST:Url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        sucess(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}




/**
 Post请求 带Header

 @param header 头部 可以直接给空
 @param Url 请求url
 @param parameters boday参数
 @param sucess 成功回调
 @param failure 失败回调
 */
-(void)PostHttpWithHeaderAndUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //解析后缀名为html的json数据了
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    [session.requestSerializer setValue:GetToken forHTTPHeaderField:@"XX-Token"];
    [session.requestSerializer setValue:@"iphone" forHTTPHeaderField:@"XX-Device-Type"];
    [session POST:Url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        sucess(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}




/**
 上传单张图片

 @param image <#image description#>
 */
-(void)UploadImage:(UIImage *)image  sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure{
    

    
    // －－－－－－－－－－－－－－－－－－－－－－－－－－－－上传图片－－－－
    
    /*
     
     此段代码如果需要修改，可以调整的位置
     
     1. 把upload.php改成网站开发人员告知的地址
     
     2. 把name改成网站开发人员告知的字段名
     
     */
    
    
    
    // 基于AFN3.0+ 封装的HTPPSession句柄
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //解析后缀名为html的json数据了
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:WLTokenKey]);
    [manager.requestSerializer setValue:GetToken forHTTPHeaderField:@"XX-Token"];
    [manager.requestSerializer setValue:@"iphone" forHTTPHeaderField:@"XX-Device-Type"];
    manager.requestSerializer.timeoutInterval = 20;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    

    
    // 在parameters里存放照片以外的对象

    [manager POST:@"http://d.wanjinig.cn/api/user/upload/one" parameters:@{@"file":@""} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

        // formData: 专门用于拼接需要上传的数据,在此位置生成一个要上传的数据体

        // 这里的_photoArr是你存放图片的数组
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);


        // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名

        // 要解决此问题，

        // 可以在上传时使用当前的系统事件作为文件名

        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

        // 设置时间格式

        [formatter setDateFormat:@"yyyyMMddHHmmss"];

        NSString *dateString = [formatter stringFromDate:[NSDate date]];

        NSString *fileName = [NSString  stringWithFormat:@"%@.jpg", dateString];
        
        

        /*

         *该方法的参数

         1. appendPartWithFileData：要上传的照片[二进制流]

         2. name：对应网站上[upload.php中]处理文件的字段（比如upload）

         3. fileName：要保存在服务器上的文件名

         4. mimeType：上传的文件的类型

         */

        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpeg"]; //


    } progress:^(NSProgress * _Nonnull uploadProgress) {

        NSLog(@"---上传进度--- %@",uploadProgress);

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {


        NSLog(@"```上传成功``` %@",responseObject);
 
        NSDictionary *dict = responseObject[@"data"];
        
        if ([[responseObject[@"code"]stringValue] isEqualToString:@"1"]) { //如果登录失败,就先不做头像保存
            
            
            
             sucess(dict[@"complete_url"]);
        }
        else{
           
            
        }
        
        
       
        

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {


        NSLog(@"xxx上传失败xxx %@", error);
         failure(error);
    }];


}

@end
