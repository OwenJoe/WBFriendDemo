//
//  MNGP_TrendsModel.h
//  MNGP_GP
//
//  Created by yinju on 2019/3/27.
//  Copyright © 2019 yinju. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNGP_TrendsModel : NSObject
/**/
@property (nonatomic,strong) NSString *content;
/**/
@property (nonatomic,strong) NSString *images;
/**/
@property (nonatomic,strong) NSString *name;
/**/
@property (nonatomic,strong) NSString *objectId;
/**/
@property (nonatomic,strong) NSString *time;
/**/
@property (nonatomic,strong) NSString *iconUrl;
/**/
@property (nonatomic,strong) NSString *title;
/**/
@property (nonatomic,strong) NSArray *mykeywords;


@property (nonatomic,assign)  BOOL isAttention;

@property (nonatomic,assign) BOOL isBlackList;


@end

NS_ASSUME_NONNULL_END
