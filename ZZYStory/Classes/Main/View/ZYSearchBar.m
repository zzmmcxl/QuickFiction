//
//  ZYSearchBar.m
//  我的微博
//
//  Created by zzyong on 15/12/31.
//  Copyright © 2015年 zzyong. All rights reserved.
//

#import "ZYSearchBar.h"

@interface ZYSearchBar ()

//@property (nonatomic,weak) UIButton *button;
@property (nonatomic,weak) UIImageView *searchIcon;

@end

@implementation ZYSearchBar

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.tintColor=[UIColor blueColor];
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        self.placeholder = @"请输入搜索内容";
        self.font = [UIFont systemFontOfSize:15];
        
        UIButton *searchIcon = [[UIButton alloc] init];
        [searchIcon addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [searchIcon setImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"] forState:UIControlStateNormal];
        searchIcon.size = CGSizeMake(30, 30);
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+ (instancetype) searchBar{
    return [[self alloc] init];
}


- (void)searchButtonClick{
    [self resignFirstResponder];
}

@end
