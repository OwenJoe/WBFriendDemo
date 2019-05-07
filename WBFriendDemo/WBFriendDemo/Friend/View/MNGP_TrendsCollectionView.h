//
//  MNGP_TrendsCollectionView.h
//  MNGP_GP
//
//  Created by zhuwb on 2019/3/27.
//  Copyright © 2019 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNGP_TrendsCollectionView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) NSArray *pictChildArray;
@end

NS_ASSUME_NONNULL_END
