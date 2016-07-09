//
//  DiscoverViewController.m
//  0624Waterfall
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "DiscoverViewController.h"
#import "SettingsItemTableViewCell.h"
#import "CellModel.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIColor+Hex.h"

@interface DiscoverViewController ()
{
    NSMutableArray *_wikiModelArray;
}
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //0.设置标题
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.center = CGPointMake(self.view.centerX, 22);
    titleLabel.bounds = CGRectMake(0, 0, 40, 18);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.text = @"发现";
    self.navigationItem.titleView = titleLabel;
    //1.创建Model容器
    _wikiModelArray = [[NSMutableArray alloc]init];
    //从plist文件中取出model数据
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"DiscoverCellList.plist" ofType:nil];
    _wikiModelArray = [NSMutableArray arrayWithContentsOfFile:filePath];
    //2.设置tableView背景
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#f4f4f4"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return _wikiModelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    NSArray *cellArray = _wikiModelArray[section];
    return cellArray.count;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     SettingsItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
     if (!cell) {
         cell = [[SettingsItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
     }
     NSArray *groupArray = _wikiModelArray[indexPath.section];
     NSDictionary *cellModelDictionary = groupArray[indexPath.row];
     
     CellModel *cellModel = [CellModel modelWithDictionary:cellModelDictionary];
     cell.cellModel = cellModel;
     cell.layer.borderColor = [UIColor colorWithHexString:@"#c8c7cc"].CGColor;
     cell.layer.borderWidth = 0.5;
     
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]init];
    header.backgroundColor = [UIColor colorWithHexString:@"#f4f4f4"];
    header.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 17);
    return header;
    
}

//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 17;
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



















