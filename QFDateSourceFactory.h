//
//  QFDateSourceFactory.h
//  QFTableViewMenu
//
//  Created by Mr.Yao on 15/12/13.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFtpyeModel.h"

@interface QFDateSourceFactory : NSObject

+ (NSArray *)createDateScoucre;

+ (NSArray *)getTypeListArray:(NSArray *)TypeItemsArray;

@end
