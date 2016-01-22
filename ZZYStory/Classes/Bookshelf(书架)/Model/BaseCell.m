//
//  BaseCell.m
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell


+ (instancetype) cellWithTitle:(NSString *)title{
    BaseCell * model = [[self alloc] init];
    model.nameLable = title;
    return model;
}



@end
