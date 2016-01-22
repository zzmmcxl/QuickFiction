//
//  BookshelfViewController.m
//  快读小说
//
//  Created by zzyong on 16/1/16.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "BookshelfViewController.h"
#import "PersonalCenterViewController.h"

@interface BookshelfViewController ()

@property (nonatomic,weak) UIButton *rightView;

@property (nonatomic,weak) UIButton *leftView;

@end

@implementation BookshelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"书架";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置导航栏
    [self setUpTitle];
}

- (void) setUpTitle{
    
    UIButton *leftView = [self addButtonWithImage:@"icon_account" title:nil];
    [leftView addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    self.leftView = leftView;
    
    UIButton *rightView = [self addButtonWithImage:nil title:@"管理"];
    [rightView addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.rightView = rightView;

}

- (void) leftButtonClick{
    
    PersonalCenterViewController *person = [[PersonalCenterViewController alloc] init];
    
    [self.navigationController pushViewController:person animated:YES];
}

- (void) rightButtonClick{
    self.rightView.selected = !self.rightView.selected;
    self.leftView.hidden = self.rightView.isSelected;
    
}



- (UIButton *) addButtonWithImage:(NSString *)name title:(NSString *)title{
    
    UIButton *button = [[UIButton alloc] init];
    if (name) {
        [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:@"取消" forState:UIControlStateSelected];
    }
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.frame = CGRectMake(0, 0, 40, 35);
    
    return button;
}
//请求地址 ：http://m.qreader.me/sub_books.php

//请求体：
/*
{   "books":[
         {"i":4694225,"ci":653,"t":374788496},
         {"i":1086173,"ci":1222,"t":376010528},
         {"i":1098186,"ci":1697,"t":374458880}],
     "utype":1
}
*/
//返回内容
/*
 {
     "uid": 0,
     "books": [
         {
             "id": 4694225,
             "status": 0,
             "img": 1,
             "catalog_t": 1453011179,
             "chapter_c": 645,
             "chapter_i": 653,
             "chapter_n": "第六百五十二章 一家人"
         },
         {
             "id": 1086173,
             "status": 0,
             "img": 1,
             "catalog_t": 1453018519,
             "chapter_c": 1215,
             "chapter_i": 1222,
             "chapter_n": "第一千一百三十一章 收获颇丰"
         },
         {
             "id": 1098186,
             "status": 0,
             "img": 1,
             "catalog_t": 1452975213,
             "chapter_c": 1692,
             "chapter_i": 1697,
             "chapter_n": "第一千六百六十五章 横扫"
         }
     ]
 }
 */

@end
