//
//  PaymentViewController.h
//  0624Waterfall
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsItemTableViewCell.h"

#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIColor+Hex.h"
#import "GeekTool.h"
#import "PayMPaymentModel.h"

@interface PaymentViewController : UITableViewController
@property (nonatomic,strong)PayMPaymentModel *myMadal;

@end
