//
//  SettingsItemTableViewCell.h
//  0624Waterfall
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"

@interface SettingsItemTableViewCell : UITableViewCell
@property (strong,nonatomic)CellModel *cellModel;
@property (strong,nonatomic)CellModel *mineViewCellModel;
@property (strong,nonatomic)CellModel *vipCellModel;

@property (strong,nonatomic)UIImageView *cellImageView;
@property (strong,nonatomic)UILabel *cellTextLabel;
@property (strong,nonatomic)UILabel *cellDetailLabel;
@property (strong,nonatomic)UIImageView *accessoryImageView;
@end
