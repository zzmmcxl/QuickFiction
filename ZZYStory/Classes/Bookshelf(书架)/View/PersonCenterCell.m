//
//  PersonCenterCell.m
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "PersonCenterCell.h"
#import "BaseCell.h"
#import "SwitchCell.h"
#import "ArrowCell.h"



@implementation PersonCenterCell

//返回自定义cell
+ (instancetype) cellWithTableview:(UITableView *)tableview{
    NSString *ID = @"me";
    PersonCenterCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setCellData:(BaseCell *)cellData{
    
    _cellData  = cellData;
    
    if ([cellData isKindOfClass:[ArrowCell class]]) {//箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }else if ([cellData isKindOfClass:[SwitchCell class]]){//开关
        
    }
    
    self.textLabel.text  =cellData.nameLable;
    
}

@end
