//
//  CellGroupModel.h
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellGroupModel : NSObject

/** 组名称 */
@property (nonatomic,copy) NSString *groupTitle;

/** 每一组cell模型数据 */
@property (nonatomic,strong) NSArray *cellData;

/** 头部标题 */
@property (nonatomic,copy) NSString *headTitle;

/** 尾部标题 */
@property (nonatomic,copy) NSString *footTitle;

@end
