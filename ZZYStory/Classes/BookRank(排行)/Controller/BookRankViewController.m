//
//  BookRankViewController.m
//  快读小说
//
//  Created by zzyong on 16/1/16.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "BookRankViewController.h"
#import "BookModel.h"
#import "BookRankCell.h"
#import "MBProgressHUD+MJ.h"
#import "MJExtension.h"
#import "BookDetailViewController.h"
#import "MJRefresh.h"
#import "AFNetworking.h"

@interface BookRankViewController ()

/**书*/
@property (nonatomic,strong) NSMutableArray *bookArray;
@property (nonatomic,weak) UIButton *errorButton;

@end

@implementation BookRankViewController

- (NSMutableArray *)storyArray{
    if (_bookArray == nil) {
        _bookArray  = [NSMutableArray array];
    }
    return _bookArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //1.设置导航栏标题
    self.navigationItem.title = @"小说";
    
    //2.加载网络小说数据
    [self loadWebStoryData];
    
    //3.设置行高
    self.tableView.rowHeight = 91;
    
    //4.集成上拉刷新
    [self setUpRefrsh];
    
    //5.设置titleView
    [self setUpTitleView];
}

- (UIButton *)errorButton{
    if (_errorButton ==nil) {
        UIButton *error = [UIButton buttonWithType:UIButtonTypeSystem];
        error.hidden = YES;
        [error setTitle:@"网络错误，请检查后后重试" forState:UIControlStateNormal];
        error.width = self.view.width;
        error.height = 40;
        error.x = 0;
        error.y = (self.tableView.height - error.height) *0.45;
        [error addTarget:self action:@selector(errorButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:error];
        _errorButton = error;
    }
    return _errorButton;
}

- (void) setUpTitleView{
    CGFloat margin = 10;
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"热门",@"分类",@"榜单"]];
    segment.width = self.view.width - 2 * margin;
    [segment addTarget:self action:@selector(segmentSelect:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segment;
    
    //默认选中热门
    segment.selectedSegmentIndex = 0;
}
                           
//监听网络错误
- (void) errorButtonClick{
    //1.再次加载数据
    [self loadWebStoryData];
    
    //2.隐藏网络错误按钮
    self.errorButton.hidden = YES;
}

//监听segment
- (void) segmentSelect:(UISegmentedControl *)segment{
    ZYLog(@"%zd",segment.selectedSegmentIndex);
}

- (void)dealloc{
    
    [self.tableView removeFooter];
}
//上拉刷新
- (void) setUpRefrsh{
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
}

- (void) loadMoreData{
    
    //刷新范围
    static NSUInteger num = 21;
    
    //1.创建管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //2.设置请求参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"utype"] = @1;
    param[@"offset"] = @(num);
    
    //3.发送请求
    [mgr POST:@"http://m.qreader.me/query_books.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary  *responseObject) {
        
        //1.解析数据
        NSArray *newData = [BookModel mj_objectArrayWithKeyValuesArray:responseObject[@"books"]];
        [self.bookArray addObjectsFromArray:newData];
        
        //2.刷新表格
        [self.tableView reloadData];
        
        //3.退出刷新状态
        [self.tableView footerEndRefreshing];
        
        //4.下次刷新范围
        num += 20;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self.tableView footerEndRefreshing];
    }];
}

- (void) loadWebStoryData{
    
    //1.创建管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //2.设置请求参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"utype"] = @1;
    
    //3.发送请求
    [mgr POST:@"http://m.qreader.me/query_books.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary  *responseObject) {
        
        //1.解析数据
        NSArray *newData = [BookModel mj_objectArrayWithKeyValuesArray:responseObject[@"books"]];
        [self.bookArray addObjectsFromArray:newData];
        
        //2.刷新表格
        [self.tableView reloadData];
        
        //3.移除遮盖
        [MBProgressHUD hideHUD];
        
        //4.隐藏网络错误按钮
        self.errorButton.hidden = YES;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUD];
        
        //显示网络错误按钮
        self.errorButton.hidden = NO;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        ZYLog(@"%@",error);
    }];
    
    //4.设置指示器
    [MBProgressHUD showMessageWithoutDimBackground:@"Loading"];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.storyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.创建cell
    BookRankCell *cell = [BookRankCell cellWithTableview:tableView];
    
    //2.传递模型数据
    cell.bookModel = self.bookArray[indexPath.row];
    
    //3.返回cell
    return cell;
}


#pragma mark - Table view delegate
//选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    BookDetailViewController *bookVC = [[BookDetailViewController alloc] init];
    
    bookVC.bookModel = self.storyArray[indexPath.row];
    [self.navigationController pushViewController:bookVC animated:YES];
}



@end
