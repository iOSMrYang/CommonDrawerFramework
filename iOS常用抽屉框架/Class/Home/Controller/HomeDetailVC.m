//
//  HomeDetailVC.m
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/5.
//  Copyright © 2016年 杨杰. All rights reserved.
//

#import "HomeDetailVC.h"
#import "AppDelegate.h"
@interface HomeDetailVC ()

@end

@implementation HomeDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"首页详情";
        [self setUpNav];
}
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationItem.backBarButtonItem setTitle:@""];
    [self.navigationItem setHidesBackButton:YES];
}
- (void)setUpNav
{
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_back_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)pop
{
    NSArray *viewcontrollers=self.navigationController.viewControllers;
    if (viewcontrollers.count>1) {
        if ([viewcontrollers objectAtIndex:viewcontrollers.count-1]==self) {
            //push方式
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else{
        //present方式
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [ShareApp.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    [ShareApp.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeNone];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [ShareApp.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [ShareApp.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
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
