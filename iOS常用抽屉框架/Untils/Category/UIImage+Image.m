//
//  UIImage+Create.m
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/2.
//  Copyright © 2016年 杨杰. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+(UIImage*)imageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
