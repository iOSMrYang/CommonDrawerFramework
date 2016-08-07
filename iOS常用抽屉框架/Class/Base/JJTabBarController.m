/*
 工程名称:快速框架搭建
 文件名称:JJTabBarController.m
 创建者  :杨杰
 创建时间:16/7/2
 版权   :  Copyright © 2016年 杨杰. All rights reserved.
 修改人 :
 修改时间:
 */

#import "JJTabBarController.h"
#import "JJNavigationController.h"
#import "HomeVC.h"
#import "FishpondVC.h"
#import "MessageVC.h"
#import "MineVC.h"
#import "JJTabBar.h"
#import "PostVC.h"
@interface JJTabBarController()<JJTabBarDelegate>

@end
@implementation JJTabBarController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    JJTabBar *tabbar = [[JJTabBar alloc] init];
    tabbar.myDelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabbar forKeyPath:@"tabBar"];
    [self setUpAllChildVc];
    self.selectedIndex = 1;
}

#pragma mark - ------------------------------------------------------------------
#pragma mark - 初始化tabBar上除了中间按钮之外所有的按钮

- (void)setUpAllChildVc
{
    
    
    HomeVC *homeVC = [[HomeVC alloc] init];
    [self setUpOneChildVcWithVc:homeVC Image:@"home_normal" selectedImage:@"home_highlight" title:@"首页"];
    
    FishpondVC *fishVC = [[FishpondVC alloc] init];
    [self setUpOneChildVcWithVc:fishVC Image:@"fish_normal" selectedImage:@"fish_highlight" title:@"鱼塘"];
    
    MessageVC *messageVC = [[MessageVC alloc] init];
    [self setUpOneChildVcWithVc:messageVC Image:@"message_normal" selectedImage:@"message_highlight" title:@"消息"];
    
    MineVC *mineVC = [[MineVC alloc] init];
    [self setUpOneChildVcWithVc:mineVC Image:@"account_normal" selectedImage:@"account_highlight" title:@"我的"];
    
    
}

#pragma mark - 初始化设置tabBar上面单个按钮的方法

/**
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    JJNavigationController *nav = [[JJNavigationController alloc] initWithRootViewController:Vc];
    
    
    Vc.view.backgroundColor = [self randomColor];
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
    
}

- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
}


#pragma mark =============== JJTabBarDelegate ===============
//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(JJTabBar *)tabBar
{
    
    
    PostVC *plusVC = [[PostVC alloc] init];
    plusVC.view.backgroundColor = [self randomColor];
    
    JJNavigationController *navVc = [[JJNavigationController alloc] initWithRootViewController:plusVC];
    
    [self presentViewController:navVc animated:YES completion:nil];
    
    
    
}


@end
