//
//  UITabBar+Badge.h
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/6.
//  Copyright © 2016年 杨杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)
- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点
@end
