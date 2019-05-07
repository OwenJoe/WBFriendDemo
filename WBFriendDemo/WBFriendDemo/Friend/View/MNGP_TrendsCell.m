//
//  MNGP_TrendsCell.m
//  MNGP_GP
//
//  Created by yinju on 2019/3/27.
//  Copyright © 2019 yinju. All rights reserved.
//

#import "MNGP_TrendsCell.h"
#import "AVFile.h"
#import "MNGP_TrendsCollectionView.h"
#import "MNGP_TrendsCommentViewController.h"
#import "MNGP_TrendsModel.h"
#import "MNGP_LoginViewController.h"
@interface MNGP_TrendsCell ()
/**/
@property (nonatomic,strong) MNGP_TrendsModel *model;
@end


@implementation MNGP_TrendsCell


- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.iconImgView.layer.masksToBounds = YES;
    self.iconImgView.layer.cornerRadius = 40/2;
 
    
    self.model = [[MNGP_TrendsModel alloc]init];
    
    UITapGestureRecognizer *iconTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(iconTapClick:)];
    [self.iconImgView addGestureRecognizer:iconTap];

}

#pragma mark 点击头像跳转到个人详情
-(void)iconTapClick:(UITapGestureRecognizer *)tap{
    
    if ([self.delegate respondsToSelector:@selector(jumpBlogPersonalCenter:)]) {
        
        [self.delegate jumpBlogPersonalCenter:self.objcets];
    }
}




-(void)setObjcets:(NSArray *)objcets{
    
    _objcets = objcets;
    self.objectId = [_objcets valueForKey:@"objectId"];
    self.nameLabel.text = [_objcets valueForKey:@"name"];
    self.contentLabel.text = [_objcets valueForKey:@"Content"];
    [self settingPhotoView:[_objcets valueForKey:@"images"]];
    self.timeLabel.text = [_objcets valueForKey:@"time"];
    [self.iconImgView sd_setImageWithURL:[_objcets valueForKey:@"iconUrl"] placeholderImage:[UIImage imageNamed:@"占位图"]];
    NSLog(@"----->%@",self.contentLabel.text);
    
    
    
    if ([[_objcets valueForKey:@"isAttention"]boolValue] == true) {

        _model.isAttention = YES;
        [self.attentionButton setTitle:@"已关注" forState:UIControlStateNormal];
        [self.attentionButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    else{

        _model.isAttention = NO;
        [self.attentionButton setTitle:@"+关注" forState:UIControlStateNormal];
        [self.attentionButton setTitleColor:WBColor(@"#D80C0C") forState:UIControlStateNormal];
    }
}


#pragma mark 对图片进行布局
-(void)settingPhotoView:(NSString *)photoString{
    
    //将string字符串转换为array数组
     NSArray  *pictArray = [photoString componentsSeparatedByString:@","];
     self.ayThrendsCollectionView.pictChildArray = pictArray;
        if (pictArray.count == 0) {
    
            self.picViewHeight.constant = 0;
    
        } else if (pictArray.count<=3 && pictArray.count >0) {
    
            self.picViewHeight.constant = 95*KHeightRate;
    
        } else if (pictArray.count <=6 && pictArray.count>3){
    
            self.picViewHeight.constant = 95*KHeightRate*2 +10*KHeightRate;
    
        } else if (pictArray.count <=9 && pictArray.count>6){
    
            self.picViewHeight.constant = 95*KHeightRate*3 +20*KHeightRate;
        }
}



#pragma mark 评论页面
- (IBAction)commentButtonClick:(id)sender {
    
    if (isLogin == 0) {
        
        MNGP_LoginViewController *loginVc = [[MNGP_LoginViewController alloc]init];
        UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginVc];
        [[self topViewController] presentViewController:loginNav animated:YES completion:^{
        }];
    }
    else{
        

        MNGP_TrendsCommentViewController *commentVc =  [[MNGP_TrendsCommentViewController alloc]init];
        commentVc.objectId = self.objectId;
        [self.parentViewController.navigationController pushViewController:commentVc animated:YES];
    }
    
   
}


#pragma mark 点赞
- (IBAction)goodButtonClick:(id)sender {
    
    
    if (isLogin == 0) {
        
        MNGP_LoginViewController *loginVc = [[MNGP_LoginViewController alloc]init];
        UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginVc];
        [[self topViewController] presentViewController:loginNav animated:YES completion:^{
        }];
    }
    else{
        
        [XWHUDManager showTipHUD:@"你又偷偷点赞了"];
    }
    


}


#pragma mark 关注
- (IBAction)attentionButtonClick:(id)sender {
    
    
    _model.isAttention = !_model.isAttention;
    
    AVObject *todo = [AVObject objectWithClassName:@"Blog" objectId:[_objcets valueForKey:@"objectId"]];
    [todo setObject:[NSNumber numberWithBool:_model.isAttention] forKey:@"isAttention"];
    [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
        if (self->_model.isAttention == NO) {
            
            
            [self.attentionButton setTitleColor:WBColor(@"#D80C0C") forState:UIControlStateNormal];
            [self.attentionButton setTitle:@"+关注" forState:UIControlStateNormal];
            [XWHUDManager showSuccessTipHUD:@"取消关注成功"];

        }
        else{
            

            [self.attentionButton setTitle:@"已关注" forState:UIControlStateNormal];
            [self.attentionButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [XWHUDManager showSuccessTipHUD:@"关注成功"];
            
        }
        
        
        if (self->_sucessBlock) {
            self->_sucessBlock ();
        }
        
        
    }];
    
    
    
    
    
    
}


#pragma mark 举报
- (IBAction)warnButtonClick:(id)sender {
    
    UIAlertController *alert = [[UIAlertController alloc]init];
    //    alert.preferredStyle = UIAlertControllerStyleActionSheet;
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *action07 = [UIAlertAction actionWithTitle:@"拉黑作者" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        if (_blackBlock) {
            _blackBlock (_objcets);
        }
        [XWHUDManager showSuccessTipHUD:@"拉黑成功,我们将对内容审核后对屏蔽"];
    }];
    
    UIAlertAction *action01 = [UIAlertAction actionWithTitle:@"标题夸张" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [XWHUDManager showSuccessTipHUD:@"举报成功"];
    }];
    UIAlertAction *action02 = [UIAlertAction actionWithTitle:@"低俗色情" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [XWHUDManager showSuccessTipHUD:@"举报成功"];
    }];
    UIAlertAction *action03 = [UIAlertAction actionWithTitle:@"错别字太多" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [XWHUDManager showSuccessTipHUD:@"举报成功"];
    }];
    UIAlertAction *action04 = [UIAlertAction actionWithTitle:@"内容不实" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [XWHUDManager showSuccessTipHUD:@"举报成功"];
    }];
    UIAlertAction *action05 = [UIAlertAction actionWithTitle:@"涉嫌违法犯罪" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [XWHUDManager showSuccessTipHUD:@"举报成功"];
    }];
    UIAlertAction *action06 = [UIAlertAction actionWithTitle:@"侵权 (抄袭、侵犯名誉等)" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [XWHUDManager showSuccessTipHUD:@"举报成功"];
    }];
    
    [alert addAction:sureAction];
    [alert addAction:action07];
    [alert addAction:action01];
    [alert addAction:action02];
    [alert addAction:action03];
    [alert addAction:action04];
    [alert addAction:action05];
    [alert addAction:action06];
    
    [[self topViewController] presentViewController:alert animated:YES completion:^{
        
    }];
    
}




@end
