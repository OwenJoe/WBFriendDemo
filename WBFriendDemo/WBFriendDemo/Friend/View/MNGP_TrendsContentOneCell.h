//
//  MNGP_TrendsContentOneCell.h
//  MNGP_GP
//
//  Created by yinju on 2019/4/2.
//  Copyright © 2019 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNGP_TrendsContentOneCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

/**/
@property (nonatomic,strong) NSArray *objects;

@end

NS_ASSUME_NONNULL_END
