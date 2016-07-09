//
//  PaymentViewController.m
//  0624Waterfall
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "PaymentViewController.h"
#import "UIColor+Hex.h"
#import "UIView+SDAutoLayout.h"

@interface PaymentViewController ()<GeekDatasourceDelegate>
{
    NSMutableArray *_wikiModelArray;
    GeekTool *_geekTool;
}

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //0.设置标题
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.center = CGPointMake(self.view.centerX, 22);
    titleLabel.bounds = CGRectMake(0, 0, 40, 18);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.text = @"VIP会员";
    self.navigationItem.titleView = titleLabel;
    //1.创建Model容器
    _wikiModelArray = [[NSMutableArray alloc]init];
    //从plist文件中取出model数据
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"VipCellList.plist" ofType:nil];
    _wikiModelArray = [NSMutableArray arrayWithContentsOfFile:filePath];
    //3.获取会员套餐数据
    [self getDataSource];
}
#pragma mark 获取数据
- (void)getDataSource{
    //1.获取数据
    _geekTool = [[GeekTool alloc]init];
    _geekTool.delegate = self;
    NSString *myUrlStr = @"http://api.jikexueyuan.com/v3/payment/vip_list?api_key=sEc5qE9f&api_sig=266e5b6bb46ade416bd1eec6f0800bbc&channel=AppStore&from=2-10.0-4.2.1&nonce=4166620&platform=1&timestamp=1467553110";
    [_geekTool getDatasourceWithUrlString:myUrlStr];
}
#pragma mark -
#pragma mark GeekDatasourceDelegate
- (void)geekTool:(GeekTool*)geekTool didGetDatasource:(NSDictionary*)dictionary{
    self.myMadal = [PayMPaymentModel modelObjectWithDictionary:dictionary];
    if (self.myMadal) {
        //刷新table
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowCount = 0;
    if (section == 0) {
        rowCount = 3;
    } else if (section == 1) {
        rowCount = 2;
    } else if (section == 2) {
        rowCount = 2;
    }
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SettingsItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[SettingsItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        CellModel *cellModel = [CellModel vipViewModelWithModel:self.myMadal withCellIndexPathRow:indexPath.row];
        cell.vipCellModel = cellModel;
        cell.layer.borderColor = [UIColor colorWithHexString:@"#f6f6f6"].CGColor;
        cell.layer.borderWidth = 0.5;
        
        ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
        [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
        return cell;
    } else if (indexPath.section == 1) {
        SettingsItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell) {
            cell = [[SettingsItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
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
    } else {
        SettingsItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[SettingsItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        CellModel *cellModel = [CellModel vipViewModelWithModel:self.myMadal withCellIndexPathRow:indexPath.row];
//        cell.vipCellModel = cellModel;
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

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]init];
    header.backgroundColor = [UIColor colorWithHexString:@"#f4f4f4"];
    header.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 10);
    return header;
    
}
//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title = @"";
    if (section == 0) {
        title = @"会员套餐";
    } else if (section == 1) {
        title = @"支付方式";
    } else if (section == 2) {
        title = @"会员特权";
    }
    return title;
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
