//
//  BookModel.h
//  快读小说
//
//  Created by zzyong on 16/1/16.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject
/**作者*/
@property (nonatomic,copy) NSString *author;
/**描述*/
@property (nonatomic,copy) NSString *desc;
/**书名*/
@property (nonatomic,copy) NSString *name;
/**标识*/
@property (nonatomic,copy) NSNumber *ID;
/**目录标题*/
@property (nonatomic,copy) NSString *n;
/**目录id*/
@property (nonatomic,copy) NSString *i;

@end
