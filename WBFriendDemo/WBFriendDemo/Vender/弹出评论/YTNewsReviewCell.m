//
//  YTNewsReviewCell.m
//  YTFuture
//
//  Created by yinju on 2018/11/15.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import "YTNewsReviewCell.h"

@interface YTNewsReviewCell ()
/**/
@property (nonatomic,strong) UIImageView *iconView;
/**/
@property (nonatomic,strong) UILabel *nameLabel;
/**/
@property (nonatomic,strong) UILabel *reviewLabel;
/**/
@property (nonatomic,strong) UIImageView *goodImgView;
/**/
@property (nonatomic,strong) UILabel *goodLabel;
@end

@implementation YTNewsReviewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initNewsReviewCell];
//        [self initNewsReviewCellContent];
    }
    return self;
}

-(void)initNewsReviewCell{
    
    self.iconView = [[UIImageView alloc]init];
    [self addSubview:self.iconView];
    
    self.nameLabel = [[UILabel alloc]init];
    [self addSubview:self.nameLabel];
    
    self.reviewLabel = [[UILabel alloc]init];
    [self addSubview:self.reviewLabel];
    
    self.goodImgView = [[UIImageView alloc]init];
    [self addSubview:self.goodImgView];
    
    self.goodLabel = [[UILabel alloc]init];
    [self addSubview:self.goodLabel];
}

-(void)initNewsReviewCellContentIconArray:(NSArray *)iconArray NameArray:(NSArray *)nameArray ReviewArray:(NSArray *)reviewArray GoodArray:(NSArray *)goodArray IndexPath:(NSIndexPath *)indexPath{
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:iconArray[indexPath.row]] placeholderImage:[UIImage imageNamed:@"头像"]];
    self.iconView.layer.masksToBounds = YES;
    self.iconView.layer.cornerRadius = 20;
    
    self.nameLabel.text = nameArray[indexPath.row];
    self.nameLabel.textColor = [UIColor colorWithHexString:@"717171"];
    self.nameLabel.font = [UIFont systemFontOfSize:14*KWidthRate];
    [self.nameLabel sizeToFit];
    
    self.reviewLabel.text = reviewArray[indexPath.row];
    self.reviewLabel.textColor = [UIColor colorWithHexString:@"454545"];
    self.reviewLabel.font = [UIFont systemFontOfSize:15*KWidthRate];
    self.reviewLabel.numberOfLines = 0;
    [self.reviewLabel sizeToFit];
    
    self.goodImgView.image = [UIImage imageNamed:@"yidianzan_icon_yueduwenzhan"];
    self.goodLabel.text = goodArray[indexPath.row];
    self.goodLabel.textColor = [UIColor colorWithHexString:@"939393"];
    self.goodLabel.font = [UIFont systemFontOfSize:13*KWidthRate];
    [self.goodLabel sizeToFit];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.left.offset(17*KWidthRate);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.iconView.mas_top);
        make.left.mas_equalTo(self.iconView.mas_right).offset(5*KWidthRate);
    }];
    
    [self.reviewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.bottom.mas_equalTo(self.iconView.mas_bottom);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(5*KHeightRate);
        make.left.mas_equalTo(self.iconView.mas_right).offset(5*KWidthRate);
        make.right.offset(-15*KWidthRate);
    }];
    
    [self.goodImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.iconView.mas_top);
        make.size.mas_equalTo(CGSizeMake(14, 14));
        make.right.mas_equalTo(self.goodLabel.mas_left).offset(-5*KWidthRate);
    }];
    
    [self.goodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.iconView.mas_top);
//        make.size.mas_equalTo(CGSizeMake(14, 14));
        make.right.offset(-17*KWidthRate);
    }];
}

@end
