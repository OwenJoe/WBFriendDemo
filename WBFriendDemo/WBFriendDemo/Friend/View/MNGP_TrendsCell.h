//
//  MNGP_TrendsCell.h
//  MNGP_GP
//
//  Created by yinju on 2019/3/27.
//  Copyright © 2019 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNGP_TrendsCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@class MNGP_TrendsCell;
@protocol MNGP_TrendsCellDelegate <NSObject>

-(void)jumpBlogPersonalCenter:(NSArray *)objects;

@end



typedef void(^SucessBlock)(void);

typedef void(^BlackBlock)(NSArray *objects);

@interface MNGP_TrendsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *picViewHeight;


@property (weak, nonatomic) IBOutlet MNGP_TrendsCollectionView *ayThrendsCollectionView;

@property (weak, nonatomic) IBOutlet UIButton *attentionButton;

/*判断是否显示精选/关注;按钮*/
@property (nonatomic,assign) BOOL isAppear;

/**/
@property (nonatomic,strong) NSArray *objcets;

@property (nonatomic,weak) id<MNGP_TrendsCellDelegate>delegate;

/**/
@property (nonatomic,strong) NSString *objectId;

/**/
@property (nonatomic,strong) UIViewController *parentViewController;



@property (nonatomic,copy) SucessBlock sucessBlock;

@property (nonatomic,copy) BlackBlock blackBlock;

@end

NS_ASSUME_NONNULL_END
