//
//  MNGP_FamousCell.h
//  MNGP_GP
//
//  Created by yinju on 2019/3/28.
//  Copyright © 2019 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MNGP_TrendsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNGP_FamousCell : UITableViewCell
/**/
@property (nonatomic,strong) MNGP_TrendsModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

NS_ASSUME_NONNULL_END
