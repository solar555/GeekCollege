//
//  MineProfileView.m
//  0624Waterfall
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "MineProfileView.h"
#import "UIView+SDAutoLayout.h"
#import "UIImageView+WebCache.h"
#import "UIColor+Hex.h"

@implementation MineProfileView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 320, 110);
        self.backgroundColor = [UIColor colorWithHexString:@"#35b558"];
        [self addControl];
        [self setAutoLayout];
    }
    return self;
}

- (void)addControl{
    _avatarImageView = [[UIImageView alloc]init];
    _vipImageView = [[UIImageView alloc]init];
    _notificationImageView = [[UIImageView alloc]init];
    _settingImageView = [[UIImageView alloc]init];
    _trueNameTextLabel = [[UILabel alloc]init];
    _trueNameTextLabel.font = [UIFont systemFontOfSize:17];
    _trueNameTextLabel.textColor = [UIColor colorWithHexString:@"#ffffff"];
    _positionTextLabel = [[UILabel alloc]init];
    _positionTextLabel.font = [UIFont systemFontOfSize:12];
    _positionTextLabel.textColor = [UIColor colorWithHexString:@"#ffffff"];
    _isFans = NO;
    _vipStatusTextLabel = [[UILabel alloc]init];
    _vipStatusTextLabel.font = [UIFont systemFontOfSize:12];
    _vipStatusTextLabel.textColor = [UIColor colorWithHexString:@"#ffffff"];
    [self sd_addSubviews:@[_avatarImageView,_vipImageView,_notificationImageView,_settingImageView,_trueNameTextLabel,_positionTextLabel,_vipStatusTextLabel]];
}

- (void)setAutoLayout{
    _avatarImageView.sd_layout
    .topSpaceToView(self,45)
    .leftSpaceToView(self,10)
    .widthIs(52)
    .heightIs(52);
    
    _trueNameTextLabel.sd_layout
    .topSpaceToView(self,50)
    .leftSpaceToView(_avatarImageView,16)
    .heightIs(17);
    [_trueNameTextLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    _vipImageView.sd_layout
    .leftSpaceToView(_trueNameTextLabel,12)
    .bottomEqualToView(_trueNameTextLabel)
    .heightIs(19)
    .widthIs(51);
    
    _notificationImageView.sd_layout
    .leftSpaceToView(_vipImageView,10)
    .topSpaceToView(self,40)
    .heightIs(20)
    .widthIs(20);
    
    _settingImageView.sd_layout
    .leftSpaceToView(_notificationImageView,19)
    .topEqualToView(_notificationImageView)
    .heightIs(20)
    .widthIs(20);
    
    _positionTextLabel.sd_layout
    .leftEqualToView(_trueNameTextLabel)
    .topSpaceToView(_trueNameTextLabel,10)
    .heightIs(12);
    [_positionTextLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    _vipStatusTextLabel.sd_layout
    .topSpaceToView(self,81)
    .rightSpaceToView(self,15)
    .heightIs(12);
    [_vipStatusTextLabel setSingleLineAutoResizeWithMaxWidth:100];
}

- (void)setMyProfileModel:(MPMyProfileModel *)myProfileModel{
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:myProfileModel.data.avatar]];
    _notificationImageView.image = [UIImage imageNamed:@""];
    _settingImageView.image = [UIImage imageNamed:@"setIcon_21x20_"];
    _trueNameTextLabel.text = myProfileModel.data.truename;
    if ([myProfileModel.data.position isEqualToString:@""]) {
        _positionTextLabel.text = @"暂无职位信息";
    } else {
        _positionTextLabel.text = myProfileModel.data.position;
    }
    if (_isFans) {
        _vipImageView.image = [UIImage imageNamed:@"yue_40x15_"];
    } else {
        _vipImageView.image = [UIImage imageNamed:@"yuevip_40x15_"];
        _vipStatusTextLabel.text = @"会员已经过期";
    }
    
    //***********************高度自适应cell设置步骤************************
    [self setupAutoHeightWithBottomView:_avatarImageView bottomMargin:14];
    
}



@end













