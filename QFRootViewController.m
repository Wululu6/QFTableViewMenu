//
//  QFRootViewController.m
//  QFTableViewMenu
//
//  Created by Mr.Yao on 15/12/13.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import "QFRootViewController.h"
#import "QFRootTableViewCell.h"
#import "QFDateSourceFactory.h"

@interface QFRootViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *dateSource;
@property (assign, nonatomic) NSInteger indexRow;
@property (assign, nonatomic)CGFloat cellHeight;
@end

@implementation QFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableVIew];
    _indexRow = -1;
}

- (void)createTableVIew{
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QFRootTableViewCell class]) bundle:nil] forCellReuseIdentifier:kQFRootTableViewCellIdentifier];
    
    if (!_dateSource) {
        _dateSource =[NSMutableArray new];
    }
    _dateSource = [NSMutableArray arrayWithArray:[QFDateSourceFactory createDateScoucre]];
    [self.tableView reloadData];
}

#pragma mark TableViewDelegate || TableViewDateSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dateSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QFRootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kQFRootTableViewCellIdentifier];
    [cell createCellViewsWithItemInfo:_dateSource[indexPath.row] andIsOpen:indexPath.row ==_indexRow ? YES : NO];
    _cellHeight = cell.tagsView.frame.size.height+50;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == _indexRow) {
        return;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _indexRow= indexPath.row;
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ceilf(indexPath.row ==_indexRow ? _cellHeight:50);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
