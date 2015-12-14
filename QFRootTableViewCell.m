//
//  QFRootTableViewCell.m
//  QFTableViewMenu
//
//  Created by Mr.Yao on 15/12/13.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import "QFRootTableViewCell.h"

@interface QFRootTableViewCell ()

@property (nonatomic, weak)QFtpyeModel *item;

@end

@implementation QFRootTableViewCell

- (void)awakeFromNib {
    self.tagsView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.0f);
    self.tagsView.shouldAddPoundSign = NO;
    self.tagsView.hidden = YES;
    self.tagsView.delegate = self;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)createCellViewsWithItemInfo:(NSDictionary *)infoDictionary andIsOpen:(BOOL)isOpe{
    if (isOpe) {
        self.chooseButton.selected =YES;
        self.isOpenButton.selected =YES;
        self.tagsView.hidden = NO;
        NSMutableArray *typeModelItemsArray = (NSMutableArray *)[QFDateSourceFactory getTypeListArray:infoDictionary[@"typelist"]];
        [self.tagsView showTagsViewForModelsArray:typeModelItemsArray];
    }else{
        self.chooseButton.selected = NO;
        self.isOpenButton.selected = NO;
        self.tagsView.hidden = YES;
        self.chooseTagNameLabel.text =@"全部主题";
    }
    self.titleNameLabel.text = infoDictionary[@"forum_name"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)tagsContainerViewDidSelectForumItem:(QFtpyeModel *)forumItems index:(int)index{
    _item = forumItems;
    self.chooseTagNameLabel.text =_item.typeName;
}


@end
