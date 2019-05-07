//
//  MNGP_TrendsContentHeaderView.m
//  MNGP_GP
//
//  Created by yinju on 2019/4/2.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_TrendsContentHeaderView.h"

@implementation MNGP_TrendsContentHeaderView

-(void)awakeFromNib{
    
    [super awakeFromNib];
    self.iconImgView.layer.masksToBounds = YES;
    self.iconImgView.layer.cornerRadius = 60/2;
    

}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
}


#pragma mark 赋值问题 需要重set开关的值
-(void)setIsAttention:(BOOL)isAttention{
    
    _isAttention = isAttention;
    
    if (_isAttention == true) {
        
        [self.attentionButton setTitle:@"已关注" forState:UIControlStateNormal];
        [self.attentionButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
    }
    else{
        
        [self.attentionButton setTitle:@"+关注" forState:UIControlStateNormal];
    }
}


#pragma mark 问股
- (IBAction)askButtonClick:(id)sender {
    
    if (_choseBlock != nil) {
        
        _choseBlock (@"问股");
    }
    [self.askButton setTitleColor:WBColor(@"#D80C0C") forState:UIControlStateNormal];
    [self.opinionButton setTitleColor:WBColor(@"#C3C3C3") forState:UIControlStateNormal];
    [self.chattingButton setTitleColor:WBColor(@"#C3C3C3") forState:UIControlStateNormal];
}


#pragma mark 观点
- (IBAction)opinioButton:(id)sender {
    
    if (_choseBlock != nil) {
        
        _choseBlock (@"观点");
    }
    [self.askButton setTitleColor:WBColor(@"#C3C3C3") forState:UIControlStateNormal];
    [self.opinionButton setTitleColor:WBColor(@"#D80C0C") forState:UIControlStateNormal];
    [self.chattingButton setTitleColor:WBColor(@"#C3C3C3") forState:UIControlStateNormal];
}


#pragma mark 群聊
- (IBAction)chattingButtonClick:(id)sender {
    
    if (_choseBlock != nil) {
        
        _choseBlock (@"群聊");
    }
    [self.askButton setTitleColor:WBColor(@"#C3C3C3") forState:UIControlStateNormal];
    [self.opinionButton setTitleColor:WBColor(@"#C3C3C3") forState:UIControlStateNormal];
    [self.chattingButton setTitleColor:WBColor(@"#D80C0C") forState:UIControlStateNormal];
}


#pragma mark 关注
- (IBAction)attentionButtonClick:(id)sender {
    
    self.isAttention = !self.isAttention;
    AVObject *todo = [AVObject objectWithClassName:@"Blog" objectId:self.objectId];
    [todo setObject:[NSNumber numberWithBool:self.isAttention] forKey:@"isAttention"];
    
    [todo saveEventually:^(BOOL succeeded, NSError * _Nullable error) {
        
        if (self.isAttention == false) {
            
            [self.attentionButton setTitleColor:WBColor(@"#D80C0C") forState:UIControlStateNormal];
            [self.attentionButton setTitle:@"+关注" forState:UIControlStateNormal];
            [XWHUDManager showSuccessTipHUD:@"取消关注成功"];
            
        }
        else{
            
             [self.attentionButton setTitle:@"已关注" forState:UIControlStateNormal];
             [self.attentionButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
            [XWHUDManager showSuccessTipHUD:@"关注成功"];
            
            
        }
            
      }];
}


@end
