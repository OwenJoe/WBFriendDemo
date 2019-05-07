//
//  MNGP_TrendsContentThreeCell.h
//  MNGP_GP
//
//  Created by yinju on 2019/4/2.
//  Copyright © 2019 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNGP_TrendsContentThreeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/**/
@property (nonatomic,strong) NSArray *objects;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@end

NS_ASSUME_NONNULL_END
