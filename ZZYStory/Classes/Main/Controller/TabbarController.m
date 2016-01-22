
#import "TabbarController.h"
#import "NavigationController.h"
#import "BookListViewController.h"
#import "BookRankViewController.h"
#import "BookSearchViewController.h"
#import "BookshelfViewController.h"

//标题文字大小
#define TabBarTitltFont [UIFont systemFontOfSize:12]
@interface TabbarController ()


@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.添加控制器
    [self addViewController];
    
    //2.设置tabbar颜色
    [self.tabBar setTintColor:[UIColor redColor]];
}

//添加控制器
- (void) addViewController{
    
    //1.书架
    NavigationController *news = [[NavigationController alloc] initWithRootViewController:[[BookshelfViewController alloc] init]];
    [self setChildViewController:news tabBarItemNorImg:@"icon_shelf" selImg:@"icon_shelf_highlighted" title:@"书架"];
    
    //2.排行
    NavigationController *blog = [[NavigationController alloc] initWithRootViewController:[[BookRankViewController alloc] init]];
    [self setChildViewController:blog tabBarItemNorImg:@"icon_rank" selImg:@"icon_rank_highlighted" title:@"排行"];
    
    //3.书单
    NavigationController *myStory = [[NavigationController alloc] initWithRootViewController:[[BookListViewController alloc] init]];
    [self setChildViewController:myStory tabBarItemNorImg:@"icon_recommend" selImg:@"icon_recommend_highlighted" title:@"书单"];
    
    //4.搜书
    NavigationController *humor = [[NavigationController alloc] initWithRootViewController:[[BookSearchViewController alloc] init]];
    [self setChildViewController:humor tabBarItemNorImg:@"icon_search" selImg:@"icon_search_highlighted" title:@"搜书"];
    
    self.viewControllers = @[news,blog,myStory,humor];
}

/**
 *  设置UITabbarItem的属性
 *
 *  @param childVc    tabbar子控制器
 *  @param norImgName tabBarItem普通图片
 *  @param selImgName tabBarItem高亮图片
 *  @param title      tabBarItem标题
 */
- (void) setChildViewController:(UIViewController *) childVc tabBarItemNorImg:(NSString *)norImgName selImg:(NSString *)selImgName title:(NSString *)title{
   
    //1.设置标题
    childVc.title = title;
    
    //2.设置普通状态图片
    childVc.tabBarItem.image = [UIImage imageNamed:norImgName];
    
    //3.设置选中状态图片，设置图片不被渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //4.设置tabbar文字大小
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = TabBarTitltFont;
    [childVc.tabBarItem setTitleTextAttributes:attr forState:UIControlStateNormal];
}

@end
