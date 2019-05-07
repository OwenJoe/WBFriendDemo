//
//  YTNewsTextView.m
//  YTFuture
//
//  Created by yinju on 2018/11/15.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "YTNewsTextView.h"

@implementation YTNewsTextView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WBScreenWidth, 45*KHeightRate)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
        button.frame = CGRectMake(15*KWidthRate, 8*KHeightRate, 275*KWidthRate, 30*KHeightRate);
        [self addSubview:button];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(35*KWidthRate, 8*KHeightRate,80*KWidthRate, 30*KHeightRate)];
//        [label sizeToFit];
        label.text = @"去评论吧~";
        label.font = [UIFont systemFontOfSize:13*KWidthRate];
        label.textColor = [UIColor colorWithHexString:@"cccccc"];
        [self addSubview:label];
        
        UIButton *goodButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [goodButton setImage:[UIImage imageNamed:@"dianzan_icon_yueduduwenzhan"] forState:UIControlStateNormal];
//        goodButton.backgroundColor = [UIColor yellowColor];
        goodButton.frame = CGRectMake(300*KWidthRate, 8*KHeightRate, 18*KWidthRate, 30*KHeightRate);
        [self addSubview:goodButton];
        [goodButton addTarget:self action:@selector(goodButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *goodLabel = [[UILabel alloc]initWithFrame:CGRectMake(WBScreenWidth-50*KWidthRate,8*KHeightRate , 15*KWidthRate, 30*KHeightRate)];
        goodLabel.text = @"赞";
        goodLabel.font = [UIFont systemFontOfSize:13*KWidthRate];
        goodLabel.textColor = [UIColor colorWithHexString:@"cccccc"];
        [self addSubview:goodLabel];
    }
    return self;
}


-(void)goodButtonClick:(UIButton *)sender{
    
    [XWHUDManager showSuccessTipHUD:@"不错哦,点赞了"];
    [sender setImage:[UIImage imageNamed:@"yidianzan_icon_yueduwenzhan"] forState:UIControlStateNormal];
}


-(void)buttonClick:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(popReview)]) {
        
        [self.delegate popReview];
    }
}

@end
