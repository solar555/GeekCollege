//
//  GeeksViewController.m
//  0624Waterfall
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 solar. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width

#import "GeeksViewController.h"
#import "GeekCircleTableViewCell.h"

#import "GeekTool.h"
#import "UIColor+Hex.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
//极客朋友圈

@interface GeeksViewController ()<UITableViewDelegate,UITableViewDataSource,GeekDatasourceDelegate,UISearchBarDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataSourceArray;
    GeekTool *_geekTool;
}

@end

@implementation GeeksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //0.设置标题
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.center = CGPointMake(self.view.centerX, 22);
    titleLabel.bounds = CGRectMake(0, 0, 40, 18);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.text = @"极客圈广场";
    self.navigationItem.titleView = titleLabel;
    //添加下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //获取数据
        [self getDataSource];
    }];
    [self.tableView.mj_header beginRefreshing];
    //导航按钮
    [self setNavigationControllerButton];
}
#pragma mark 获取数据
- (void)getDataSource{
    //1.获取数据
    _geekTool = [[GeekTool alloc]init];
    _geekTool.delegate = self;
    NSString *myUrlStr = @"http://api.jikexueyuan.com/v3/feed/my?api_key=sEc5qE9f&api_sig=6e3e5b715f23ad3d2f3e8d0d72d6d285&channel=AppStore&from=2-10.0-4.2.1&n=10&nonce=535978&p=1&timestamp=1467293549&uid=4199754";
    [_geekTool getDatasourceWithUrlString:myUrlStr];
}
#pragma mark -
#pragma mark GeekDatasourceDelegate
- (void)geekTool:(GeekTool*)geekTool didGetDatasource:(NSDictionary*)dictionary{
    self.myMadal = [GCMGeekCircleModel modelObjectWithDictionary:dictionary];
    if (self.myMadal) {
        //创建table
        [self.tableView reloadData];//**********************************************
        
        [self.tableView.mj_header endRefreshing];
    }
}
#pragma mark 导航按钮设置
- (void)setNavigationControllerButton{
    //1.创建左按钮
    UIImage *leftImage = [[UIImage imageNamed:@"add_25x18_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(pushToCourseLibary:)];
    self.navigationItem.leftBarButtonItem = leftButton;
}
#pragma mark 跳转到添加极客朋友
- (void)pushToCourseLibary:(UIBarButtonItem *)buttonItem{
    NSLog(@"点击添加极客朋友");
}
#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myMadal.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GeekCircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[GeekCircleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSLog(@"row %ld",indexPath.row);
    GCMList *geekList = self.myMadal.data.list[indexPath.row];
    cell.geekList = geekList;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    
    return cell;
}
#pragma mark 自动布局
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
    CGFloat height = [self cellHeightForIndexPath:indexPath cellContentViewWidth:[UIScreen mainScreen].bounds.size.width];
    return height;
}
@end


















