//
//  AppDelegate.h
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/2.
//  Copyright © 2016年 杨杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJTabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MMDrawerController *drawerController;
@property (nonatomic , strong) JJTabBarController *tabBarVc;
@end
