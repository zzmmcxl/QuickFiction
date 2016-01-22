//
//  CheckChaptersViewController.m
//  ZZYStory
//
//  Created by zzyong on 16/1/19.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "CheckChaptersViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "BookModel.h"
#import "MJExtension.h"

@interface CheckChaptersViewController ()

@property (nonatomic,strong) NSMutableArray *chapterArray;

@end

@implementation CheckChaptersViewController

- (NSMutableArray *)chapterArray{
    if (_chapterArray == nil) {
        _chapterArray = [NSMutableArray array];
    }
    return _chapterArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"目录";
}

// http://m.qreader.me/query_catalog.php
// {"id":1007738,"utype":1}
// catalog

- (void)setModel:(BookModel *)model{
    _model = model;
    
    [self loadData];
}

- (void) loadData{
    
    //1.创建管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //2.设置请求参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"utype"] = @1;
    param[@"id"] = self.model.ID;
    
    //3.发送请求
    [mgr POST:@"http://m.qreader.me/query_catalog.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary  *responseObject) {
        
        //1.解析数据
        NSArray *newData = [BookModel mj_objectArrayWithKeyValuesArray:responseObject[@"catalog"]];
        [self.chapterArray addObjectsFromArray:newData];
        
        //2.刷新表格
        [self.tableView reloadData];
        
        //3.移除遮盖
        [MBProgressHUD hideHUD];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUD];
        ZYLog(@"%@",error);
    }];
    
    //4.设置指示器
    [MBProgressHUD showMessageWithoutDimBackground:@"Loading"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chapterArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"chapter";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    BookModel *model = self.chapterArray[indexPath.row];
    cell.textLabel.text = model.n;
    if (indexPath.row == 0) {
        cell.textLabel.textColor = [UIColor blueColor];
    }else{
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BookModel *model = self.chapterArray[indexPath.row];
    
    //1.创建管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //2.设置请求参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"utype"] = @1;
    param[@"id"] = self.model.ID;
    param[@"cid"] = model.i;
    ZYLog(@"%@",param);
    //3.发送请求
    [mgr POST:@"http://chapter.qreader.me/download_chapter.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  responseObject) {
        
        //1.解析数据
//        NSData *data = responseObject;
        UIImage *image = [NSKeyedUnarchiver unarchiveObjectWithData:responseObject];
        ZYLog(@"%@",[responseObject class]);
        //2.移除遮盖
        [MBProgressHUD hideHUD];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUD];
        ZYLog(@"%@",error);
    }];
    
    //4.设置指示器
    [MBProgressHUD showMessageWithoutDimBackground:@"Loading"];
}


@end
