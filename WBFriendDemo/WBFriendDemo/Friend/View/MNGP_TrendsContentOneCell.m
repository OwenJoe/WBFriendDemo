//
//  MNGP_TrendsContentOneCell.m
//  MNGP_GP
//
//  Created by yinju on 2019/4/2.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_TrendsContentOneCell.h"

@implementation MNGP_TrendsContentOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconImgView.layer.masksToBounds = YES;
    self.iconImgView.layer.cornerRadius  =30/2;
}

- (void)setObjects:(NSArray *)objects{
    
    _objects = objects;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:[_objects valueForKey:@"iconUrl"]] placeholderImage:[UIImage imageNamed:@"占位图"]];
    self.nameLabel.text = [_objects valueForKey:@"name"];
    self.timeLabel.text = [_objects valueForKey:@"time"];
    self.contentLabel.text = [_objects valueForKey:@"content"];
}




@end
