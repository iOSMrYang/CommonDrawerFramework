/*
 工程名称:快速框架搭建
 文件名称:JJNavigationController.m
 创建者  :杨杰
 创建时间:16/7/2
 版权   :  Copyright © 2016年 杨杰. All rights reserved.
 修改人 :
 修改时间:
 */

#import "JJNavigationController.h"
#import "AppDelegate.h"
@implementation JJNavigationController

+ (void)load
{
        
    UIBarButtonItem *item=[UIBarButtonItem appearanceWhenContainedIn:self, nil ];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSFontAttributeName]=[UIFont systemFontOfSize:16];
    dic[NSForegroundColorAttributeName]=[UIColor blackColor];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    [bar setBackgroundImage:[UIImage imageWithColor:NavBarColor] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *dicBar=[NSMutableDictionary dictionary];
    
    dicBar[NSFontAttributeName]=[UIFont systemFontOfSize:10];
    [bar setTitleTextAttributes:dic];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"%ld",self.viewControllers.count);
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }else
    {

    }
    
    return [super pushViewController:viewController animated:animated];
}

@end
