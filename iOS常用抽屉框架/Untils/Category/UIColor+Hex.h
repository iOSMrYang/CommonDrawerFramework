//
//  UIColor+Hex.h
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/5.
//  Copyright © 2016年 杨杰. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define RGBA(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
@interface UIColor (Hex)
+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

+ (UIColor *)colorWithIntRed:(int)red green:(int)green blue:(int)blue alpha:(float)alpha;
+ (UIColor *)colorWithIntRed:(int)red green:(int)green blue:(int)blue;
@end
