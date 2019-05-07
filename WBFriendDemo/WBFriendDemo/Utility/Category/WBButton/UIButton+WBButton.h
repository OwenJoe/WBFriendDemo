//
//  UIButton+WBButton.h
//  BL
//
//  Created by yinju on 2018/11/23.
//  Copyright © 2018年 yinju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (WBButton)

+(nullable UIButton *)initButtonWithFrame:(CGRect)frame ImageName:(nullable NSString *)imageName Title:(NSString *)title TitleColor:(NSString *)titleColor Font:(NSInteger)font BackgroundColor:(NSString *)buttonBackgroundColor Target:(nullable  id)target Action:(nullable SEL)action AddObject:(id)addObject;

/** 图片在左，标题在右 */
- (void)setIconInLeft;
/** 图片在右，标题在左 */
- (void)setIconInRight;
/** 图片在上，标题在下 */
- (void)setIconInTop;
/** 图片在下，标题在上 */
- (void)setIconInBottom;

//** 可以自定义图片和标题间的间隔 */
- (void)setIconInLeftWithSpacing:(CGFloat)Spacing;
- (void)setIconInRightWithSpacing:(CGFloat)Spacing;
- (void)setIconInTopWithSpacing:(CGFloat)Spacing;
- (void)setIconInBottomWithSpacing:(CGFloat)Spacing;



@end

NS_ASSUME_NONNULL_END
