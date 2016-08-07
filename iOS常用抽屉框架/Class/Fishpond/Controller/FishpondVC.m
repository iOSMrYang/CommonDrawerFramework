//
//  FishpondVC.m
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/3.
//  Copyright © 2016年 杨杰. All rights reserved.
//

#import "FishpondVC.h"
#import "MineVC.h"
#import "ClearNavVC.h"
@interface FishpondVC ()

@end

@implementation FishpondVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"发布宝贝";
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[ClearNavVC new]];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
