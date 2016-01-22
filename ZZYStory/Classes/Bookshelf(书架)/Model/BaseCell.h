//
//  CellDataModel.h
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCell : NSObject

/**图片*/
@property (nonatomic,copy) NSString *iconView;

/**名称*/
@property (nonatomic,copy) NSString *nameLable;

/**详细*/
@property (nonatomic,copy) NSString *detailLable;


+ (instancetype) cellWithTitle:(NSString *)Title;

@end
