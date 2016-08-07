//
//  ClearNavVC.m
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/4.
//  Copyright © 2016年 杨杰. All rights reserved.
//

#import "ClearNavVC.h"
#import "FishpondVC.h"
#import "UIScrollView+HeaderScaleImage.h"
@interface ClearNavVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)UIView *alphaView;
@property (nonatomic) CGFloat alpha;
@end

@implementation ClearNavVC

- (UIView *)alphaView
{
    if (_alphaView == nil) {
        _alpha = 0;
        CGRect frame = self.navigationController.navigationBar.frame;
        _alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, frame.size.width, frame.size.height+20)];
        _alphaView.userInteractionEnabled = NO;
        [self.navigationController.navigationBar insertSubview:_alphaView atIndex:0];
    }
    _alphaView.backgroundColor = [UIColor colorWithRed:250/255.0 green:227/255.0 blue:111/255.0 alpha:_alpha];
    return _alphaView;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.translucent = YES;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self alphaView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
    
    // 设置tableView头部缩放图片
    self.tableView.yz_headerScaleImage = [UIImage imageNamed:@"header.jpg"];
    
    // 设置tableView头部视图，必须设置头部视图背景颜色为clearColor,否则会被挡住
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setUpNav
{
    self.title = @"发布宝贝";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_back_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)pop
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark =============== UITableViewDataSource ===============

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]init];
    }
    cell.textLabel.text = @"动态导航栏背景色";
    return cell;
}

#pragma mark =============== UITableViewDelegate ===============
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[FishpondVC new] animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double offsetY = scrollView.contentOffset.y;
    _alpha = offsetY/112.0;
    [self alphaView];
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
