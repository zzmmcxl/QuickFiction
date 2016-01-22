//
//  BookSearchViewController.m
//  ZZYStory
//
//  Created by zzyong on 16/1/20.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "BookSearchViewController.h"
#import "ZYSearchBar.h"

@interface BookSearchViewController ()

@end

@implementation BookSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"搜书";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置搜索栏
    [self setUpSearchBar];
    
}

- (void) setUpSearchBar{
    
    ZYSearchBar *search = [ZYSearchBar searchBar];
    search.width = [UIScreen mainScreen].bounds.size.width - 40;;
    search.height = 30;
    self.navigationItem.titleView = search;
    [search becomeFirstResponder];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.navigationItem.titleView endEditing:YES];
}

@end
