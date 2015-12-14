//
//  QFTagButton.m
//  QFTableViewMenu
//
//  Created by Mr.Yao on 15/12/13.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import "QFTagButton.h"

#define tagTopMargin 2.0f
#define tagBottomMargin 2.0f
#define tagleftMargin 4.0f
#define tagrightMargin 4.0f

@interface QFTagButton ()

@property(nonatomic) NSString *addedPoundSignTitle;

@end

@implementation QFTagButton


+ (instancetype)tagButton {
    QFTagButton *btn = [[QFTagButton alloc] initWithFrame:CGRectZero];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 4.0f;
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    btn.backgroundColor = [UIColor whiteColor];
    btn.shouldAddPoundSign = YES;
    return btn;
}

- (void)setTagTitle:(NSString *)tagTitle {
    _title = tagTitle;
    if (self.shouldAddPoundSign) {
        self.addedPoundSignTitle = [NSString stringWithFormat:@"#%@#", tagTitle];
    } else {
        self.addedPoundSignTitle = tagTitle;
    }
    [self setTitle:_addedPoundSignTitle forState:UIControlStateNormal];
    [self setTitle:_addedPoundSignTitle forState:UIControlStateHighlighted];
    
    [self updateFrame];
}

- (void)setTitleFont:(UIFont *)titleFont {
    
    _font = titleFont;
    self.titleLabel.font = _font;
    
    [self updateFrame];
}

- (void)updateFrame {
    if (!_font) {
        _font = [UIFont systemFontOfSize:14.0f];
        ;
    }
    NSDictionary *attrs = @{NSFontAttributeName : _font};
    CGSize titleSize =
    [_addedPoundSignTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, titleSize.width + tagleftMargin + tagrightMargin + 4,
                            titleSize.height + tagTopMargin + tagBottomMargin + 4);
    
    if (self.width < self.height) {
        
        self.width = self.height;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    
    self.layer.cornerRadius = cornerRadius;
}


@end
