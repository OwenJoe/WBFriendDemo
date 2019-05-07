//
//  MNGP_FamousCell.m
//  MNGP_GP
//
//  Created by yinju on 2019/3/28.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_FamousCell.h"

@implementation MNGP_FamousCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconImgView.layer.masksToBounds = YES;
    self.iconImgView.layer.cornerRadius  =40/2;
}

-(void)setModel:(MNGP_TrendsModel *)model{
    
    _model = model;
    self.contentLabel.text = _model.title;
    self.nameLabel.text = _model.mykeywords[0];
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:_model.images]];
    
    if (_model.mykeywords.count ==2) {
        
        self.buttonThree.hidden = YES;
    }
    else if (_model.mykeywords.count ==1){
        
        self.buttonTwo.hidden = YES;
        self.buttonThree.hidden = YES;
    }
}
@end
