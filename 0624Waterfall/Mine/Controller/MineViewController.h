//
//  MineViewController.h
//  0624Waterfall
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsItemTableViewCell.h"
#import "MineViewFirstSectionTableViewCell.h"

#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIColor+Hex.h"
#import "MineProfileView.h"
#import "GeekTool.h"


@interface MineViewController : UITableViewController
@property (nonatomic,strong)MPMyProfileModel *myMadal;

@end
