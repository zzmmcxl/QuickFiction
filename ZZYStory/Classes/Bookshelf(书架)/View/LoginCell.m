//
//  LoginCell.m
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "LoginCell.h"

@implementation LoginCell

+ (instancetype)loginCell{
    
    return [[NSBundle mainBundle] loadNibNamed:@"LoginCell" owner:nil options:nil].lastObject;
}

@end
