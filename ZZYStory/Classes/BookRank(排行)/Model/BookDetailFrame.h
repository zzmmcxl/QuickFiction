//
//  BookDetailFrame.h
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BookDetailModel;

@interface BookDetailFrame : NSObject

@property (nonatomic,strong) BookDetailModel *detailModel;

/**描述尺寸*/
@property (nonatomic,assign) CGSize descTextSize;

/**作者名称尺寸*/
@property (nonatomic,assign) CGSize nameSize;

@end
