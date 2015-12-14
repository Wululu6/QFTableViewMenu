//
//  QFtpyeModel.h
//  QFTableViewMenu
//
//  Created by Mr.Yao on 15/12/13.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFtpyeModel : NSObject

@property (nonatomic,assign) NSNumber *typeID;
@property (nonatomic,strong)NSString *typeName;

- (QFtpyeModel *)initWithDictionary: (NSDictionary *)dictionary;

@end
