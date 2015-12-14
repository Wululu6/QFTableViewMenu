//
//  QFTagsView.m
//  QFTableViewMenu
//
//  Created by Mr.Yao on 15/12/13.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import "QFTagsView.h"

NSInteger static kBase_Tag = 10000;

@interface QFTagsView()

@property (strong, nonatomic) NSArray *tags;

@property (strong, nonatomic)QFTagButton *button;

@end

@implementation QFTagsView

//- (void)showTags:(NSArray *)tags
//{
//    for( UIView * v in self.subviews ){
//        [v removeFromSuperview];
//    }
//    
//    _tags = tags;
//    CGFloat frameWidth = self.frame.size.width;
//    CGFloat tagsTotalWidth = 0.0f;
//    CGFloat tagsTotalHeight = 4.0f;
//    CGFloat tagHeight = 0.0f;
//    NSInteger tagIndex = kBase_Tag;
//    for (NSString *tag in tags){
//        QFTagButton *tagBtn = [QFTagButton tagButton];
//        tagBtn.shouldAddPoundSign = self.shouldAddPoundSign;
//        tagBtn.frame = CGRectMake(tagsTotalWidth, tagsTotalHeight, 0.0f, 0.0f);
//        [tagBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//        tagBtn.tag = tagIndex;
//        [tagBtn setTagTitle:tag];
//        [tagBtn addTarget:self action:@selector(tagDidClick:) forControlEvents:UIControlEventTouchUpInside];
//        
//        tagHeight = tagBtn.frame.size.height;
//        tagsTotalWidth += tagBtn.frame.size.width + 4.0f;
//        
//        if (tagsTotalWidth >= frameWidth){
//            tagsTotalHeight += tagBtn.frame.size.height + 4.0f;
//            tagsTotalWidth = 0.0f;
//            tagBtn.frame = CGRectMake(tagsTotalWidth, tagsTotalHeight, tagBtn.frame.size.width, tagBtn.frame.size.height);
//            tagsTotalWidth += tagBtn.frame.size.width + 4.0f;
//        }
//        [self addSubview:tagBtn];
//        
//        tagIndex++;
//    }
//    tagsTotalHeight += tagHeight;
//
//    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, frameWidth, tagsTotalHeight + 4.0f * 2);
//}

- (void)showTagsViewForModelsArray:(NSArray *)tags{
    for( UIView * v in self.subviews ){
        [v removeFromSuperview];
    }
    
    _tags = tags;
    CGFloat frameWidth = self.frame.size.width;
    CGFloat tagsTotalWidth = 20.0f;
    CGFloat tagsTotalHeight = 16.0f;
    CGFloat tagHeight = 0.0f;
    NSInteger tagIndex = kBase_Tag;
    for (QFtpyeModel *forumItem in tags){
        QFTagButton *tagBtn = [QFTagButton tagButton];
        tagBtn.shouldAddPoundSign = self.shouldAddPoundSign;
        tagBtn.frame = CGRectMake(tagsTotalWidth, tagsTotalHeight, 0.0f, 0.0f);
        [tagBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [tagBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        tagBtn.tag = tagIndex;
        [tagBtn setTagTitle:forumItem.typeName];
        [tagBtn addTarget:self action:@selector(tagTypeDidClick:) forControlEvents:UIControlEventTouchUpInside];
        
        tagHeight = tagBtn.frame.size.height;
        tagsTotalWidth += tagBtn.frame.size.width + 8.0f;
        
        if (tagsTotalWidth >= frameWidth){
            tagsTotalHeight += tagBtn.frame.size.height + 10.0f;
            tagsTotalWidth = 20.0f;
            tagBtn.frame = CGRectMake(tagsTotalWidth, tagsTotalHeight, tagBtn.frame.size.width, tagBtn.frame.size.height);
            tagsTotalWidth += tagBtn.frame.size.width + 8.0f;
        }
        [self addSubview:tagBtn];
        
        tagIndex++;
    }
    
    tagsTotalHeight += tagHeight;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, frameWidth, tagsTotalHeight + 8.0f * 2);
    
}



- (void)setTagColor:(UIColor *)color atIndex:(NSUInteger)idx{
    QFTagButton *tagBtn = (QFTagButton *)[self viewWithTag:(kBase_Tag + idx)];
    if (tagBtn){
        [tagBtn setTitleColor:color forState:UIControlStateNormal];
        [tagBtn setTitleColor:color forState:UIControlStateHighlighted];
    }
}

//- (void)tagDidClick:(QFTagButton *)sender
//{
//    NSInteger idx = sender.tag - kBase_Tag;
//    if (idx < [_tags count]){
//        if ([self.delegate respondsToSelector:@selector(tagsContainerViewDidSelectTag:index:)]){
//            [self.delegate tagsContainerViewDidSelectTag:[_tags objectAtIndex: idx] index: (int)idx];
//        }
//    }
//}


- (void)tagTypeDidClick:(QFTagButton *)sender{
    QFTagButton *button = (QFTagButton *)sender;
    button.selected = YES;
    if (self.button != button) {
        self.button.selected = NO;
    }
    self.button = button;
    NSInteger idx = sender.tag - kBase_Tag;
    if (idx < [_tags count]){
        if ([self.delegate respondsToSelector:@selector(tagsContainerViewDidSelectForumItem:index:)]){
            [self.delegate tagsContainerViewDidSelectForumItem:[_tags objectAtIndex:idx] index:(int)idx];
        }
    }
    
}


@end
