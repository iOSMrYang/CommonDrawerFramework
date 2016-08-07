//
//  JJTabBar.h
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/3.
//  Copyright © 2016年 杨杰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JJTabBar;
@protocol JJTabBarDelegate <NSObject>
@optional
- (void)tabBarPlusBtnClick:(JJTabBar *)tabBar;
@end
@interface JJTabBar : UITabBar
@property (nonatomic, weak)id<JJTabBarDelegate> myDelegate;
@end
