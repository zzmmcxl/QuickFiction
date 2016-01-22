//
//  BookModel.m
//  快读小说
//
//  Created by zzyong on 16/1/16.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "BookModel.h"
#import "MJExtension.h"

@implementation BookModel

- (instancetype)init{
    if (self = [super init]) {
       [BookModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
           return @{
                    @"ID" : @"id",
                   };
       }];
    }
    return self;
}

@end
