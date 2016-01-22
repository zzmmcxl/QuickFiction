//
//  BookDetailModel.m
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "BookDetailModel.h"
#import "MJExtension.h"

@implementation BookDetailModel

- (instancetype)init{
    if (self = [super init]) {
        [BookDetailModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{
                     @"ID" : @"id",
                     };
        }];
    }
    return self;
}

@end
