//
//  GlobalHeader.h
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/2.
//  Copyright © 2016年 杨杰. All rights reserved.
//
//黄色导航栏
#define NavBarColor [UIColor colorWithRed:250/255.0 green:227/255.0 blue:111/255.0 alpha:1.0]
//代理方法
#define DELEGATE_FUNCTION(func) if(self.delegate && [self.delegate respondsToSelector:NSSelectorFromString(func)])\
{\
[self.delegate performSelector:NSSelectorFromString(func)];\
}\


#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleVersionKey]


#define WEAK_SELF __typeof(self) wSelf = self

#define SCREEN_TOP (IsIOS7?(20.0f+44.0f):0.0f)
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define UIKeyWindow [[UIApplication sharedApplication] keyWindow]
#define COLOR_WITH_HEX(HEX) [UIColor colorWithRed:((HEX & 0xFF0000) >> 16)/255.0 green:((HEX & 0xFF00) >> 8)/255.0 blue:(HEX & 0xFF)/255.0 alpha:1]
#define COLOR_WITH_HEX_ALPHA(HEX,ALPHA) [UIColor colorWithRed:((HEX & 0xFF0000) >> 16)/255.0 green:((HEX & 0xFF00) >> 8)/255.0 blue:(HEX & 0xFF)/255.0 alpha:ALPHA]

#define IPHONE4  (SCREEN_HEIGHT == (480))
#define IPHONE6P (SCREEN_HEIGHT == (736))

// 取得AppDelegate单利
#define ShareApp ((AppDelegate *)[[UIApplication sharedApplication]delegate])

#import "UIImage+Image.h"
#import "UIView+Extension.h"
#import "BaseViewController.h"
#import "UIColor+Hex.h"
#import "UITabBar+Badge.h"
#import "MMDrawerController.h"
