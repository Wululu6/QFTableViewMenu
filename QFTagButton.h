//
//  QFTagButton.h
//  QFTableViewMenu
//
//  Created by Mr.Yao on 15/12/13.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"

@interface QFTagButton : UIButton

@property (nonatomic, copy, setter=setTagTitle:)NSString *title;
@property (nonatomic, assign) BOOL shouldAddPoundSign;
@property (nonatomic, retain, setter=setTitleFont:)UIFont *font;

+ (instancetype)tagButton;

- (void)setTagTitle: (NSString *)tagTitle;

- (void)setTitleFont: (UIFont *)titleFont;

- (void)setCornerRadius: (CGFloat)cornerRadius;

@end
