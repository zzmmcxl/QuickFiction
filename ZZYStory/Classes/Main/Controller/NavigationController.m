//
//  NavigationController.m
//
//  Created by zzyong on 15/12/28.
//  Copyright © 2015年 zzyong. All rights reserved.
//

#import "NavigationController.h"
//字体设置
#define NavTextFont [UIFont systemFontOfSize:16]

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/** 系统在第一次使用这个类的时候调用(1个类只会调用一次)*/
+ (void)initialize {
    //1.设置导航栏的样式
    UINavigationBar *naBar = [UINavigationBar appearance];
    [naBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    //2.设置字体颜色 大小
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttr[NSFontAttributeName] = NavTextFont;
    naBar.titleTextAttributes = textAttr;
    //3.设置返回按钮箭头样式
    naBar.tintColor = [UIColor whiteColor];
}

/**重写这个方法,能拦截所有的push操作*/
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
}

@end
