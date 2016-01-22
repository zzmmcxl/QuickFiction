//
//  PersonalCenterViewController.m
//  快读小说
//
//  Created by zzyong on 16/1/16.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonCenterCell.h"
#import "CellGroupModel.h"
#import "ArrowCell.h"
#import "SwitchCell.h"
#import "LoginCell.h"

@interface PersonalCenterViewController ()

//cell数据
@property (nonatomic,strong) NSMutableArray *data;

@end

@implementation PersonalCenterViewController

#pragma mark 懒加载方法

- (NSArray *)data{
    if (_data ==nil) {
        _data = [NSMutableArray array];
    }
    return _data;
}

#pragma mark - 初始化方法

- (instancetype)initWithStyle:(UITableViewStyle)style{
    //设置样式
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"个人中心";
    
    //创建groupOne
    [self setGroupOne];
    
    //创建groupTwo
    [self setGroupTwo];
    
    
}

- (void) setGroupOne{
    CellGroupModel *group = [[CellGroupModel alloc] init];
    group.cellData = @[[LoginCell loginCell]];
    
    [self.data addObject:group];
}

- (void) setGroupTwo{
    
    CellGroupModel *group = [[CellGroupModel alloc] init];
    
    ArrowCell *data1 = [ArrowCell cellWithTitle:@"给我评分" ];
    ArrowCell *data2 = [ArrowCell cellWithTitle:@"意见反馈" ];
    SwitchCell *data3 = [SwitchCell cellWithTitle:@"智能云加速"];
    group.cellData = @[data1,data2,data3];
    [self.data addObject:group];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CellGroupModel *group = self.data[section];
    return group.cellData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {//登录cell
        return [LoginCell loginCell];
    }else{ //普通cell
        //1.创建cell
        PersonCenterCell *cell = [PersonCenterCell cellWithTableview:tableView];
        
        //2.传递模型数据
        CellGroupModel *group = self.data[indexPath.section];
        cell.cellData = group.cellData[indexPath.row];
        
        //3.返回cell
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    if (indexPat.section == 0) {
        return 81;
    }
    return 44;
}


@end
