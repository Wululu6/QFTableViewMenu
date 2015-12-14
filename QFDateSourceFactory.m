//
//  QFDateSourceFactory.m
//  QFTableViewMenu
//
//  Created by Mr.Yao on 15/12/13.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import "QFDateSourceFactory.h"

@implementation QFDateSourceFactory

+(NSArray *)createDateScoucre{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tagPlist" ofType:@"json"];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
    
    NSArray *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    return dic;
}


+(NSArray *)getTypeListArray:(NSArray *)TypeItemsArray{
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    [TypeItemsArray enumerateObjectsUsingBlock:^(NSDictionary* item, NSUInteger idx, BOOL *stop) {
        QFtpyeModel *model = [[QFtpyeModel alloc] initWithDictionary:item];
        [modelArray addObject:model];
    }];
    
    return modelArray;
}

@end
