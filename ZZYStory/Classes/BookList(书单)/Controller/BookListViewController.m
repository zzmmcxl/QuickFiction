//
//  BookListViewController.m
//  快读小说
//
//  Created by zzyong on 16/1/16.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "BookListViewController.h"

@interface BookListViewController ()

@end

@implementation BookListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"书单";
    
    [self setUpTitleView];
}

- (void) setUpTitleView{
    CGFloat margin = 10;
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"最新",@"最热",@"我的"]];
    segment.width = self.view.width - 13 * margin;
    [segment addTarget:self action:@selector(segmentSelect:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segment;
    
    //默认选中热门
    segment.selectedSegmentIndex = 0;
}

//监听segment
- (void) segmentSelect:(UISegmentedControl *)segment{
    ZYLog(@"%zd",segment.selectedSegmentIndex);
}

#pragma mark - Table view data source

@end
