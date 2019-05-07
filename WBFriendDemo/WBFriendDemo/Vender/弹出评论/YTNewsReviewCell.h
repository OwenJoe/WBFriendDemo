//
//  YTNewsReviewCell.h
//  YTFuture
//
//  Created by yinju on 2018/11/15.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YTNewsReviewCell : UITableViewCell
-(void)initNewsReviewCellContentIconArray:(NSArray *)iconArray NameArray:(NSArray *)nameArray ReviewArray:(NSArray *)reviewArray GoodArray:(NSArray *)goodArray IndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
