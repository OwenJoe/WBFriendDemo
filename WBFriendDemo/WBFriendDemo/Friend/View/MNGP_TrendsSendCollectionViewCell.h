//
//  MNGP_TrendsSendCollectionViewCell.h
//  MNGP_GP
//
//  Created by yinju on 2019/4/3.
//  Copyright © 2019 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MNGP_TrendsSendCollectionViewCell;
@protocol MNGP_TrendsSendCollectionViewCellDelegate <NSObject>

-(void)deletePhoto:(UIButton *)sender;

@end
@interface MNGP_TrendsSendCollectionViewCell : UICollectionViewCell
/**/
@property (nonatomic,strong) UIImageView *imgView;
/**/
@property (nonatomic,strong) UIButton *deleteButton;

@property (nonatomic,weak) id <MNGP_TrendsSendCollectionViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
