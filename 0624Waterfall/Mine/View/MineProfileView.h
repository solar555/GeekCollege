//
//  MineProfileView.h
//  0624Waterfall
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPMyProfileModel.h"
#import "MPData.h"

@interface MineProfileView : UIView
@property (strong,nonatomic)MPMyProfileModel *myProfileModel;

@property (strong,nonatomic)UIImageView *avatarImageView;
@property (strong,nonatomic)UIImageView *vipImageView;
@property (strong,nonatomic)UIImageView *notificationImageView;
@property (strong,nonatomic)UIImageView *settingImageView;

@property (strong,nonatomic)UILabel *trueNameTextLabel;
@property (strong,nonatomic)UILabel *positionTextLabel;
@property (assign,nonatomic)BOOL isFans;//是否是会员（粉丝）
@property (strong,nonatomic)UILabel *vipStatusTextLabel;

@end
