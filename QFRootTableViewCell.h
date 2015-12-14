//
//  QFRootTableViewCell.h
//  QFTableViewMenu
//
//  Created by Mr.Yao on 15/12/13.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFTagsView.h"
#import "QFtpyeModel.h"
#import "QFDateSourceFactory.h"

static NSString *const kQFRootTableViewCellIdentifier =@"QFRootTableViewCell";

@interface QFRootTableViewCell : UITableViewCell<QFTagsContainerViewDelegate>

@property (weak, nonatomic) IBOutlet QFTagsView *tagsView;
@property (weak, nonatomic) IBOutlet UILabel *titleNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *chooseTagNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *chooseButton;
@property (weak, nonatomic) IBOutlet UIButton *isOpenButton;

- (void)createCellViewsWithItemInfo:(NSDictionary *)infoDictionary andIsOpen: (BOOL)isOpe;

@end
