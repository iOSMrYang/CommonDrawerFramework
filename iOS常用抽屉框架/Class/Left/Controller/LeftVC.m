//
//  LeftVC.m
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/5.
//  Copyright © 2016年 杨杰. All rights reserved.
//

#import "LeftVC.h"
#import "AppDelegate.h"
#import "HomeDetailVC.h"
#import "JJTabBarController.h"
@interface LeftVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LeftVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureNavgationItemTitle:@"右侧页面"];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellName = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据 - %ld",indexPath.row+1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
//    [ShareApp.drawerController setCenterViewController:centerNav withCloseAnimation:YES completion:nil];
//    MMDrawerController *mm = ;
   
    
    
    [ShareApp.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        UINavigationController * cen = (UINavigationController*)((JJTabBarController *)ShareApp.drawerController.centerViewController).selectedViewController;
        [cen pushViewController:[HomeDetailVC new] animated:YES];
        
    }];
  
}

@end
