//
//  QFTagsView.h
//  QFTableViewMenu
//
//  Created by Mr.Yao on 15/12/13.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFTagButton.h"
#import "QFtpyeModel.h"

@protocol QFTagsContainerViewDelegate <NSObject>

@optional

- (void)tagsContainerViewDidSelectForumItem:(QFtpyeModel *)forumItems index:(int)index;

@end


@interface QFTagsView : UIView

@property (weak, nonatomic) id<QFTagsContainerViewDelegate> delegate;

@property (assign, nonatomic) BOOL shouldAddPoundSign;


//- (void)showTags:(NSArray *)tags;

- (void)showTagsViewForModelsArray:(NSArray *)tags;

- (void)setTagColor:(UIColor *)color atIndex:(NSUInteger)idx;

@end

