//
//  CourseLibraryTableViewController.m
//  0624Waterfall
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 solar. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width

#import "CourseLibraryTableViewController.h"
#import "GeekTool.h"
#import "MJRefresh.h"

#import "UITableView+SDAutoTableViewCellHeight.h"
#import "SDAutoLayout/UIView+SDAutoLayout.h"
#import "UIColor+Hex.h"
#import "UINavigationBar+BackgroundColor.h"

#import "CourseListTableViewCell.h"
#import "LrdSuperMenu.h"

@interface CourseLibraryTableViewController ()<GeekDatasourceDelegate,UISearchBarDelegate,LrdSuperMenuDataSource, LrdSuperMenuDelegate>
{
    GeekTool *_geekTool;
    //菜单
    NSArray *_menuLists;
    NSArray *_menuSubItems;
}

@property (nonatomic, strong) LrdSuperMenu *courseListMenu;
@end

@implementation CourseLibraryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    //改变tableView的位置
    CGRect frame = self.tableView.frame;
    frame.origin.y = 100;
    self.tableView.frame = frame;
    //初始颜色为透明
    [self setNavigationControllerButton];
    //获取数据
    [self getDatasource];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
#pragma mark 导航按钮设置
- (void)setNavigationControllerButton{
    UIView *navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    navigationView.backgroundColor = [UIColor whiteColor];
    UIImageView *bgImage = [[UIImageView alloc]initWithFrame:navigationView.frame];
    bgImage.image = [UIImage imageNamed:@"navbg_320x64_"];
    [navigationView addSubview:bgImage];
    [self.tableView setTableHeaderView:navigationView];
//    [self.view addSubview:navigationView];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 20, 44, 44);
    UIImage *leftImage = [[UIImage imageNamed:@"back_10x15_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [leftButton setImage:leftImage forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [navigationView addSubview:leftButton];
}
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 获取数据
- (void)getDatasource{
    //1.获取数据
    _geekTool = [[GeekTool alloc]init];
    _geekTool.delegate = self;
    //2.1 获取课程列表数据
    NSString *courseListUrlStr = @"http://api.jikexueyuan.com/v3/course/list?api_key=sEc5qE9f&api_sig=0a9c08ffd7a5c2c59bf935b4e0e6182e&channel=AppStore&flag=1&free=0&from=2-10.0-4.2.1&level=0&n=20&nonce=-3446283&p=1&timestamp=1467728027&type=0&uid=4199754";
    [_geekTool getDatasourceWithUrlString:courseListUrlStr];
    //2.2 获取菜单数据
    NSString *menuUrlStr = @"http://api.jikexueyuan.com/v3/category/group?api_key=sEc5qE9f&api_sig=30aec8176d152f1bb419537a5de3fda3&channel=AppStore&from=2-10.0-4.2.1&level=3&nonce=2281016&timestamp=1467615210";
    [_geekTool getDatasourceWithUrlString1:menuUrlStr];
}
#pragma mark -
#pragma mark GeekDatasourceDelegate
- (void)geekTool:(GeekTool*)geekTool didGetDatasource:(NSDictionary*)dictionary{
    self.myModel = [CLMCourseListModel modelObjectWithDictionary:dictionary];
    if (self.myModel) {
        //添加下拉刷新
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.tableView reloadData];
        }];
        [self.tableView.mj_header beginRefreshing];
    }
}
- (void)geekTool:(GeekTool*)geekTool didGetDatasource1:(NSDictionary*)dictionary{
    self.myMenuModel = [CLMMCourseLibraryMenuModel modelObjectWithDictionary:dictionary];
    if (self.myMenuModel) {
        _menuLists = self.myMenuModel.data.lists;
        //创建菜单
        _courseListMenu = [[LrdSuperMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:44];
        _courseListMenu.delegate = self;
        _courseListMenu.dataSource = self;
        [self.view addSubview:_courseListMenu];
        
//        [_courseListMenu selectIndexPath:[LrdIndexPath indexPathWithColumn:0 row:1]];
        [_courseListMenu selectDeafultIndexPath];
    }
}
#pragma mark -
#pragma mark 课程库列表代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myModel.data.lists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CourseListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[CourseListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.listModel = self.myModel.data.lists[indexPath.row];
    
    return cell;
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
        [self.tableView.mj_header endRefreshing];
        //        });
    }
}

#pragma mark -
#pragma mark 菜单代理
#pragma mark 列数
- (NSInteger)numberOfColumnsInMenu:(LrdSuperMenu *)menu {
    return 3;
}
#pragma mark 每列的行数
- (NSInteger)menu:(LrdSuperMenu *)menu numberOfRowsInColumn:(NSInteger)column {
    if (column == 0) {
        return _menuLists.count;
    } else {
        return 5;
    }
}
#pragma mark 每行的标题
- (NSString *)menu:(LrdSuperMenu *)menu titleForRowAtIndexPath:(LrdIndexPath *)indexPath {
    if (indexPath.column == 0) {
        CLMMLists *list = _menuLists[indexPath.row];
        return list.title;
    } else {
        return @"hello";
    }
}

//一级row图片
//- (NSString *)menu:(LrdSuperMenu *)menu imageNameForRowAtIndexPath:(LrdIndexPath *)indexPath {
//    if (indexPath.column == 0 || indexPath.column == 1) {
//        return @"baidu";
//    }
//    return nil;
//}

//二级row图片
//- (NSString *)menu:(LrdSuperMenu *)menu imageForItemsInRowAtIndexPath:(LrdIndexPath *)indexPath {
//    if (indexPath.column == 0 && indexPath.item >= 0) {
//        return @"baidu";
//    }
//    return nil;
//}
#pragma mark 每行的详细文本
- (NSString *)menu:(LrdSuperMenu *)menu detailTextForRowAtIndexPath:(LrdIndexPath *)indexPath {
    if (indexPath.column < 2) {
        return [@(arc4random()%1000) stringValue];
    }
    return nil;
}
#pragma mark 每行的项目
- (NSInteger)menu:(LrdSuperMenu *)menu numberOfItemsInRow:(NSInteger)row inColumn:(NSInteger)column {
    CLMMLists *list = _menuLists[column];
    return list.sub.count;
    
//    if (column == 0) {
//        if (row == 1) {
//            CLMMLists *list = _menuLists[0];
//            NSArray *subMenu = list.sub;
//            return subMenu.count;
//        }else if (row == 1) {
//            return self.difang.count;
//        }else if (row == 2) {
//            return self.tese.count;
//        }else if (row == 3) {
//            return self.rihan.count;
//        }else if (row == 4) {
//            return self.xishi.count;
//        }else if (row == 5) {
//            return self.shaokao.count;
//        }
//    }
//    return 0;
}
#pragma mark 每行的项目标题
- (NSString *)menu:(LrdSuperMenu *)menu titleForItemsInRowAtIndexPath:(LrdIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    
    CLMMLists *list = _menuLists[indexPath.column];
    CLMMSub *sub = list.sub[indexPath.row];
    return sub.title;
    
//    if (indexPath.column == 0) {
//        if (row == 1) {
//            return self.jiachang[indexPath.item];
//        }else if (row == 4) {
//            return self.tese[indexPath.item];
//        }else if (row == 5) {
//            return self.rihan[indexPath.item];
//        }else if (row == 6) {
//            return self.xishi[indexPath.item];
//        }else if (row == 7) {
//            return self.shaokao[indexPath.item];
//        }
//    }
//    return nil;
}
#pragma mark 每行的项目详细文本
- (NSString *)menu:(LrdSuperMenu *)menu detailTextForItemsInRowAtIndexPath:(LrdIndexPath *)indexPath {
    return [@(arc4random()%1000) stringValue];
}
#pragma mark 点击事件
- (void)menu:(LrdSuperMenu *)menu didSelectRowAtIndexPath:(LrdIndexPath *)indexPath {
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
}

@end
