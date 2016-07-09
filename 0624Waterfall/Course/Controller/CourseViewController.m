//
//  CourseViewController.m
//  0624Waterfall
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 solar. All rights reserved.
//

#define WIDTH [UIScreen mainScreen].bounds.size.width

#import "CourseViewController.h"
#import "BannerTableViewCell.h"
#import "MyTableViewCell.h"
#import "TopCourseTableViewCell.h"

#import "KnowledgeTableViewCell.h"
#import "ProfessionTableViewCell.h"
#import "SeriesTableViewCell.h"
#import "CourseLibraryTableViewController.h"

#import "UITableView+SDAutoTableViewCellHeight.h"
#import "SDAutoLayout/UIView+SDAutoLayout.h"

#import "GeekTool.h"

#import "BMCourseBannerModal.h"
#import "BMData.h"
#import "BMLists.h"
#import "MMCourseMyModal.h"
#import "TMCourseTopModal.h"
#import "HMCourseHistoryModal.h"
#import "UINavigationBar+BackgroundColor.h"

#import "UIColor+Hex.h"
#import "MJRefresh.h"


@interface CourseViewController ()<UITableViewDelegate,UITableViewDataSource,GeekDatasourceDelegate,UISearchBarDelegate>
{
    UITableView *_tableView;
    GeekTool *_geekTool;
}
@end

@implementation CourseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    //导航按钮
    [self setNavigationControllerButton];
    //创建table
    [self createTableView];
}
- (void)viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
    //添加下拉刷新
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_tableView reloadData];
    }];
    [_tableView.mj_header beginRefreshing];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.navigationController.navigationBar setHidden:NO];
    UIColor *color = [UIColor colorWithHexString:@"#ffffff"];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 64) {
        //1.改变button的背景图片
        UIImage *leftImage = [[UIImage imageNamed:@"navbar_left_40x40_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.navigationItem.leftBarButtonItem setImage:leftImage];
        UIImage *rightImage = [[UIImage imageNamed:@"navbar_right_40x40_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.navigationItem.rightBarButtonItem setImage:rightImage];
        //2.改变导航背景透明度
        CGFloat alpha = 1 - ((128 - offsetY) / 64);
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
        
        //3.添加下划线
        if (alpha >= 1) {
            self.navigationController.navigationBar.layer.borderWidth = 1;
            self.navigationController.navigationBar.layer.borderColor = [UIColor colorWithHexString:@"#89ca85"].CGColor;
        } else {
            self.navigationController.navigationBar.layer.borderWidth = 0;
        }
    } else {
        //1.改变button的背景图片
        UIImage *leftImage = [[UIImage imageNamed:@"navbar_left_white_40x40_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.navigationItem.leftBarButtonItem.image = leftImage;
        UIImage *rightImage = [[UIImage imageNamed:@"navbar_right_white_40x40_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.navigationItem.rightBarButtonItem setImage:rightImage];
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}
#pragma mark 创建tableView
- (void)createTableView{
    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 50);
    _tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 80;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
}

#pragma mark 导航按钮设置
- (void)setNavigationControllerButton{
    //初始颜色为透明
    UIColor *color = [UIColor colorWithHexString:@"#ffffff"];
    CGFloat alpha = 0.0;
    [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    NSLog(@"navigation:%@",self.navigationController.navigationBar);
    //1.创建左按钮
    UIImage *leftImage = [[UIImage imageNamed:@"navbar_left_white_40x40_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(pushToCourseLibary:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    //2.1 创建SearchBar
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    searchBar.placeholder = @"搜索课程";
    [searchBar setContentMode:UIViewContentModeLeft];
    searchBar.tintColor = [UIColor colorWithHexString:@"#838383"];
    searchBar.alpha = 0.5;
    self.navigationItem.titleView = searchBar;
    //3.创建右按钮
    UIImage *rightImage = [[UIImage imageNamed:@"navbar_right_white_40x40_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(pushToCourseLibary:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}
#pragma mark UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"开始编辑");
    return YES;
}
#pragma mark 课程列表
- (void)pushToCourseLibary:(UIBarButtonItem *)buttonItem{
    CourseLibraryTableViewController *courseLibraryTableViewController = [[CourseLibraryTableViewController alloc]init];
    [self.navigationController pushViewController:courseLibraryTableViewController animated:YES];
    NSLog(@"点击");
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            BannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
            if (!cell) {
                cell = [[BannerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 1:{
            MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
            if (!cell) {
                cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 2:{
            TopCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
            if (!cell) {
                cell = [[TopCourseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.myIndex = indexPath.row;
            return cell;
            
        }
            break;
        case 3:{
            TopCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
            if (!cell) {
                cell = [[TopCourseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.myIndex = indexPath.row;
            return cell;
        }
            break;
        case 4:{
            KnowledgeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
            if (!cell) {
                cell = [[KnowledgeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell4"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 5:{
            ProfessionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell5"];
            if (!cell) {
                cell = [[ProfessionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell5"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 6:{
            SeriesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell6"];
            if (!cell) {
                cell = [[SeriesTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell6"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
            
        default:{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
    }
}
#pragma mark 自动布局
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = [self cellHeightForIndexPath:indexPath cellContentViewWidth:WIDTH tableView:tableView];
    return cellHeight;
}

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        //end of loading
//        dispatch_async(dispatch_get_main_queue,^{
             [_tableView.mj_header endRefreshing];
//        });
    }
}
@end

















