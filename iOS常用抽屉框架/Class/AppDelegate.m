//
//  AppDelegate.m
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/2.
//  Copyright © 2016年 杨杰. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftVC.h"
#import "RightVC.h"
@interface AppDelegate ()<JJTabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //中间tabbarviewController
    self.tabBarVc = [JJTabBarController new];
    self.tabBarVc.delegate =self;
    // 将中间VC和左边VC加上导航控制器 中间部分也可以是UITabBarController 右边VC没有做处理
    [self.tabBarVc.tabBar showBadgeOnItemIndex:0];
     [self.tabBarVc.tabBar showBadgeOnItemIndex:1];
     [self.tabBarVc.tabBar showBadgeOnItemIndex:3];
    [self.tabBarVc.tabBar showBadgeOnItemIndex:4];
    UINavigationController *leftNav = [[UINavigationController alloc] initWithRootViewController:[LeftVC new]];
    RightVC *rightVC = [RightVC new];
    
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:self.tabBarVc leftDrawerViewController:leftNav rightDrawerViewController:rightVC];
    [self.drawerController setShowsShadow:YES]; // 是否显示阴影效果
    self.drawerController.maximumLeftDrawerWidth = SCREEN_WIDTH*3/4; // 左边拉开的最大宽度
    self.drawerController.maximumRightDrawerWidth = SCREEN_WIDTH*3/4; // 右边拉开的最大宽度
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    self.window.rootViewController = self.drawerController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



#pragma mark ------JJTabBarControllerDelegate
- (void)hideRedPoint:(NSInteger)index
{
    [self.tabBarVc.tabBar hideBadgeOnItemIndex:index>1?index+1:index];
}

@end
