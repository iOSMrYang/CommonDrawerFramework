/*
 工程名称:快速框架搭建
 文件名称:JJTabBarController.h
 创建者  :杨杰
 创建时间:16/7/2
 版权   :  Copyright © 2016年 杨杰. All rights reserved.
 修改人 :
 修改时间:
*/
#import <UIKit/UIKit.h>

@protocol JJTabBarControllerDelegate <NSObject>

- (void)hideRedPoint:(NSInteger)index;

@end

@interface JJTabBarController : UITabBarController
@property (nonatomic , weak) id <JJTabBarControllerDelegate>delegate;
@end
