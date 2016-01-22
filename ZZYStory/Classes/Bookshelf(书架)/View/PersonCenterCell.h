//
//  PersonCenterCell.h
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseCell;
@interface PersonCenterCell : UITableViewCell

+ (instancetype) cellWithTableview:(UITableView *)tableview;

@property (nonatomic,strong) BaseCell *cellData;

@end
