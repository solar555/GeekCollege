//
//  MineViewController.m
//  0624Waterfall
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<GeekDatasourceDelegate>
{
    NSMutableArray *_wikiModelArray;
    GeekTool *_geekTool;
}
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    CGRect tableViewFrame = self.tableView.frame;
    tableViewFrame.size.height = tableViewFrame.size.height - 200;
    self.tableView.frame = tableViewFrame;
    //1.创建Model容器
    _wikiModelArray = [[NSMutableArray alloc]init];
    //从plist文件中取出model数据
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"MyInfoCellList.plist" ofType:nil];
    _wikiModelArray = [NSMutableArray arrayWithContentsOfFile:filePath];
    //2.设置tableView背景
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //3.获取表头数据
    [self getDataSource];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    
}
#pragma mark 获取数据
- (void)getDataSource{
    //1.获取数据
    _geekTool = [[GeekTool alloc]init];
    _geekTool.delegate = self;
    NSString *myUrlStr = @"http://api.jikexueyuan.com/v3/home/get_profile?api_key=sEc5qE9f&api_sig=34d480d45fb23b6c226b653b0c521f3f&channel=AppStore&from=2-10.0-4.2.1&nonce=-366152&target_uid=4199754&timestamp=1467469121&uid=4199754";
    [_geekTool getDatasourceWithUrlString:myUrlStr];
}
#pragma mark -
#pragma mark GeekDatasourceDelegate
- (void)geekTool:(GeekTool*)geekTool didGetDatasource:(NSDictionary*)dictionary{
    self.myMadal = [MPMyProfileModel modelObjectWithDictionary:dictionary];
    if (self.myMadal) {
        //刷新table
        MineProfileView *myProfileView = [[MineProfileView alloc]init];
        myProfileView.myProfileModel = self.myMadal;
        self.tableView.tableHeaderView = myProfileView;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return _wikiModelArray.count + 1;//增加一个区（第一个区）
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if (section == 0) {
        return 1;
    } else {
        NSArray *cellArray = _wikiModelArray[section-1];
        return cellArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        MineViewFirstSectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
        if (!cell) {
            cell = [[MineViewFirstSectionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
        }
        ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
        [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
        return cell;
    } else {
        SettingsItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[SettingsItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        NSArray *groupArray = _wikiModelArray[indexPath.section - 1];
        NSDictionary *cellModelDictionary = groupArray[indexPath.row];
        
        CellModel *cellModel = [CellModel mineViewModelWithDictionary:cellModelDictionary];
        cell.mineViewCellModel = cellModel;
        cell.layer.borderColor = [UIColor colorWithHexString:@"#f6f6f6"].CGColor;
        cell.layer.borderWidth = 0.5;
        
        ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
        [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
        return cell;
    }
}

#pragma mark 自动布局
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
    CGFloat height = [self cellHeightForIndexPath:indexPath cellContentViewWidth:[UIScreen mainScreen].bounds.size.width];
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]init];
    header.backgroundColor = [UIColor colorWithHexString:@"#f4f4f4"];
    header.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 10);
    return header;
    
}

//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
