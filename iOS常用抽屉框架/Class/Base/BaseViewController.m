//
//  BaseViewController.m
//  MMDrawerControllerDemo
//
//  Created by 谢涛 on 16/5/31.
//  Copyright © 2016年 X.T. All rights reserved.
//

#import "BaseViewController.h"
#import "LeftVC.h"
#import "RightVC.h"
#import "AppDelegate.h"

// 取得AppDelegate单利
#define ShareApp ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface BaseViewController ()

@property (nonatomic, copy) RightBarButtonActionBlock rightBarButtonAction;
@property (nonatomic, copy) LeftBarButtonActionBlock leftBarButtonAction;

@end

@implementation BaseViewController

- (void)pushNewViewController:(UIViewController *)newViewController {
    [self.navigationController pushViewController:newViewController animated:YES];
}

- (void)configureLeftBarButtonWithTitle:(NSString *)title action:(LeftBarButtonActionBlock)action {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 40, 30);
    [leftBtn addTarget:self action:@selector(clickedLeftBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *navLeftBtn = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem =navLeftBtn;
    
    self.leftBarButtonAction = action;

}

- (void)configureRightBarButtonWithTitle:(NSString *)title action:(RightBarButtonActionBlock)action {
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 40, 30);
    [rightBtn addTarget:self action:@selector(clickedRightBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *navRightBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem =navRightBtn;
    
    self.rightBarButtonAction = action;

}

- (void)configureNavgationItemTitle:(NSString *)navigationTitle {
    self.navigationItem.title = navigationTitle;
}

- (void)clickedLeftBarButtonItemAction
{
    if (self.leftBarButtonAction) {
        self.leftBarButtonAction();
    }
}

- (void)clickedRightBarButtonItemAction
{
    if (self.rightBarButtonAction) {
        self.rightBarButtonAction();
    }
}


- (void)enableOpenLeftDrawer:(BOOL)enable
{
    if (enable == YES) {
        // 能够打开
        UINavigationController *leftNav = [[UINavigationController alloc] initWithRootViewController:[[LeftVC alloc] init]];
        [ShareApp.drawerController setLeftDrawerViewController:leftNav];
    } else {
        // 不能打开抽屉
        [ShareApp.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            [ShareApp.drawerController setLeftDrawerViewController:nil];
        }];
    }
}

- (void)enableOpenRightDrawer:(BOOL)enable
{
    if (enable == YES) {
        // 能够打开
//        UINavigationController *RightNav = [[UINavigationController alloc] initWithRootViewController:[[RightViewController alloc] init]];
        RightVC *rightVC = [[RightVC alloc] init];
        [ShareApp.drawerController setRightDrawerViewController:rightVC];
    } else {
        // 不能打开抽屉
        [ShareApp.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            [ShareApp.drawerController setRightDrawerViewController:nil];
        }];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica Neue" size:21.0f], NSFontAttributeName,nil]];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:0x1369c0];
    [self.navigationController.navigationBar setTranslucent:NO];
}

@end
