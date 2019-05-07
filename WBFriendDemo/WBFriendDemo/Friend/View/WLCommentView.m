//
//  WLCommentView.m
//  WL
//
//  Created by yinju on 2018/12/5.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "WLCommentView.h"

@interface WLCommentView  ()
@property (nonatomic, strong) GXUpvoteButton *upvoteButton;
@end
@implementation WLCommentView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WBScreenWidth, 45*KHeightRate)];
        view.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
        [self addSubview:view];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor colorWithHexString:@"F3F8FC"];
        button.frame = CGRectMake(15*KWidthRate, 8*KHeightRate, 287*KWidthRate, 30*KHeightRate);
        [self addSubview:button];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(35*KWidthRate, 8*KHeightRate,120*KWidthRate, 30*KHeightRate)];
        //        [label sizeToFit];
        label.text = @"说说你有什么想法吧";
        label.font = [UIFont systemFontOfSize:13*KWidthRate];
        label.textColor = [UIColor colorWithHexString:@"909090"];
        [self addSubview:label];
        
        self.upvoteButton = [GXUpvoteButton buttonWithType:UIButtonTypeCustom];
//        [self.upvoteButton setImage:[UIImage imageNamed:@"jiaoliuquan_icon_dianzan_pressed-1"] forState:UIControlStateNormal];
        self.upvoteButton.frame = CGRectMake(WBScreenWidth -22*KWidthRate-25*KWidthRate, 14*KHeightRate, 22*KWidthRate, 22*KHeightRate);
        [self addSubview:self.upvoteButton];
        [self.upvoteButton addTarget:self action:@selector(goodButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}

-(void)buttonClick:(UIButton *)sender{
    
    if (_commentBlock != nil) {
        _commentBlock();
    }
}


-(void)goodButtonClick:(UIButton *)sender{
    
    [XWHUDManager showSuccessTipHUD:@"不错哦,点赞了"];
    [sender setImage:[UIImage imageNamed:@"yidianzan_icon_yueduwenzhan"] forState:UIControlStateNormal];
}


@end
