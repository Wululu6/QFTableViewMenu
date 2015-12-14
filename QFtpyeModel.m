//
//  QFtpyeModel.m
//  QFTableViewMenu
//
//  Created by Mr.Yao on 15/12/13.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import "QFtpyeModel.h"

@implementation QFtpyeModel

- (QFtpyeModel *)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        NSDictionary *data = dictionary;
        self.typeID = data[@"typeid"];
        self.typeName = data[@"typename"];
    }
    return self;
}

@end
