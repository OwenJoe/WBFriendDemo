//
//  MNGP_TrendsContentHeaderView.h
//  MNGP_GP
//
//  Created by yinju on 2019/4/2.
//  Copyright © 2019 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ChoseBlock)(NSString *buttonText);
@interface MNGP_TrendsContentHeaderView : UIView

/*按钮回调*/
@property (nonatomic,copy) ChoseBlock choseBlock;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@property (weak, nonatomic) IBOutlet UIButton *askButton;
@property (weak, nonatomic) IBOutlet UIButton *opinionButton;
@property (weak, nonatomic) IBOutlet UIButton *chattingButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *attentionButton;
@property (weak, nonatomic) IBOutlet UILabel *attentionLabel;
@property (weak, nonatomic) IBOutlet UILabel *FansLabel;
/**/
@property (nonatomic,assign) BOOL isAttention;
/**/
@property (nonatomic,strong) NSString *objectId;

@end

NS_ASSUME_NONNULL_END
