//
//  AuthorBooksViewController.m
//  ZZYStory
//
//  Created by zzyong on 16/1/19.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "AuthorBooksViewController.h"
#import "BookRankCell.h"

@interface AuthorBooksViewController ()

/**书*/
@property (nonatomic,strong) NSMutableArray *bookArray;

@end

@implementation AuthorBooksViewController

- (NSMutableArray *)storyArray{
    if (_bookArray == nil) {
        _bookArray  = [NSMutableArray array];
    }
    return _bookArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadBooks];
}

- (void) loadBooks{
    //请求地址 ：http://m.qreader.me/query_author_books.php
    //请求参数 ：{"author":"èè§éçç","utype":1}
    
}

- (void)setModel:(BookModel *)model{
    _model = model;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.创建cell
    BookRankCell *cell = [BookRankCell cellWithTableview:tableView];
    
    //2.传递模型数据
//    cell.bookModel = self.bookArray[indexPath.row];
    
    //3.返回cell
    return cell;
}

@end
