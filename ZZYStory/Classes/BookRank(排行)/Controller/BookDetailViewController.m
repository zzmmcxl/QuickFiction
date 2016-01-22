//
//  BookDetailViewController.m
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "BookDetailViewController.h"
#import "DetailView.h"
#import "AFNetworking.h"
#import "BookModel.h"
#import "MBProgressHUD+MJ.h"
#import "MJExtension.h"
#import "BookDetailFrame.h"
#import "BookDetailModel.h"
#import "AuthorBooksViewController.h"
#import "CheckChaptersViewController.h"

@interface BookDetailViewController ()<DetailViewDelegate>

//book详情view
@property (nonatomic,weak) DetailView *detail;
//book详情数据
@property (nonatomic,strong) BookDetailModel *bookDetailModel;

@end

@implementation BookDetailViewController

#pragma mark - 懒加载

- (BookDetailModel *)bookDetailModel{
    

    
    if (_bookDetailModel == nil) {
        _bookDetailModel = [[BookDetailModel alloc] init];
    }
    return _bookDetailModel;
}

#pragma mark - 初始化方法

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.添加detailview
    [self setUpDetailView];
    
}
/**
 *  添加详情页面
 */
- (void) setUpDetailView{
    self.view.backgroundColor = [UIColor whiteColor];
    DetailView *detail = [DetailView DetailView];
    //设置代理
    detail.delegate = self;
    detail.frame = self.view.bounds;
    [self.view addSubview:detail];
    self.detail = detail;
}

#pragma mark - 加载书详情数据

- (void)setBookModel:(BookModel *)bookModel{
    _bookModel = bookModel;
    //1.设置标题
    self.title = bookModel.name;
    
    //2.加载网络数据
    [self loadBookData];
}

- (void) loadBookData{
    //http://m.qreader.me/query_book_detail.php
    //{"id":4694225,"utype":1}
    //1.创建管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //2.设置请求参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"utype"] = @1;
    param[@"id"] = self.bookModel.ID;
    //3.发送请求
    [mgr POST:@"http://m.qreader.me/query_book_detail.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary  *responseObject) {
        
        //1.字典转为模型
        self.bookDetailModel = [BookDetailModel mj_objectWithKeyValues:responseObject];
        
        //2.传递模型数据
        BookDetailFrame *bookFrame = [[BookDetailFrame alloc] init];
        bookFrame.detailModel = self.bookDetailModel;
        self.detail.bookDetailFrame = bookFrame;
        
        //3.移除加载提示
        [MBProgressHUD hideHUD];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUD];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD showError:@"网络不给力，请检查网络"];
        });
    }];
    
    //4.设置加载提示
    [MBProgressHUD showMessageWithoutDimBackground:@"Loading"];
}

#pragma mark DetailView代理方法

- (void)detailView:(DetailView *)detailView didButtonClickWithType:(DetailViewButtonType)type{
    switch (type) {
        case DetailViewButtonAuthor:{
            AuthorBooksViewController *authorBooks = [[AuthorBooksViewController alloc] init];
            authorBooks.title = [NSString stringWithFormat:@"%@作品",self.bookModel.author];
            [self.navigationController pushViewController:authorBooks animated:YES];
        }
            break;
        case DetailViewButtonReadNow:
            
            break;
        case DetailViewButtonAddBookshelf:
            
            break;
        case DetailViewButtonCacheBook:
            
            break;
        case DetailViewButtonLastChapter:
            
            break;
        case DetailViewButtonCheckChapter:{
            CheckChaptersViewController *checkChapters = [[CheckChaptersViewController alloc] init];
            [self.navigationController pushViewController:checkChapters animated:YES];
            checkChapters.model = self.bookModel;
        }
            break;
    }
    //设置返回按钮标题
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
}



@end
