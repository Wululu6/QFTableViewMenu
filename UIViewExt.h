//
//  AddressViewController.h
//  PetBar
//
//  Created by juvham on 14-5-23.
//  Copyright (c) 2014年 EZ. All rights reserved.
//

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;
@property (readonly) CGPoint topLeft;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;


/* 将url数组imgs中的多张图片排列摆放在一个view上
 * 分为单张图、两张图、三张图、四张图，共4种排列样式
 * imgs中超过四张图时，只显示前四张图 */

+ (UIView*)initWithImages: (NSArray*)imgs rect: (CGRect)rect;

@end