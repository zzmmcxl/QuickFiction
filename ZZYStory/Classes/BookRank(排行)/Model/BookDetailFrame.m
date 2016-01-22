//
//  BookDetailFrame.m
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "BookDetailFrame.h"
#import "BookDetailModel.h"

@implementation BookDetailFrame

- (void)setDetailModel:(BookDetailModel *)detailModel{
    _detailModel = detailModel;
    
    self.descTextSize = [ detailModel.desc sizeWithFont:[UIFont systemFontOfSize:13] maxW:[UIScreen mainScreen].bounds.size.width - 16];
    
    CGFloat inset = 15;
    NSString *author = [NSString stringWithFormat:@"%@作品",detailModel.author];
    self.nameSize = [author sizeWithFont:[UIFont systemFontOfSize:14] maxW:MAXFLOAT];
    CGSize newSize = self.nameSize;
    newSize.width = self.nameSize.width + inset;
    self.nameSize = newSize;
}

@end
