//
//  SeriesView.m
//  0624Waterfall
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "SeriesView.h"
#import "UIView+SDAutoLayout.h"
#import "UIColor+Hex.h"
#import "UIButton+UnderlineNone.h"

@implementation SeriesView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageAppImageView = [[UIImageView alloc]init];
        [self addSubview:_imageAppImageView];
        
        _studyCountLabel = [[UILabel alloc]init];
        _studyCountLabel.font = [UIFont systemFontOfSize:10];
        _studyCountLabel.textColor = [UIColor colorWithHexString:@"#767676"];
        _studyCountLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_studyCountLabel];
        
        _collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (_collectStatus) {
            [_collectButton setTitle:@"取消" forState:UIControlStateNormal];
        } else {
            [_collectButton setTitle:@"收藏" forState:UIControlStateNormal];
        }
        _collectButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_collectButton setTitleColor:[UIColor colorWithHexString:@"#def3e4"] forState:UIControlStateNormal];
        _collectButton.backgroundColor = [UIColor colorWithHexString:@"#35b558"];
        [_collectButton setUnderlineNone:YES];
        [_collectButton.layer setMasksToBounds:YES];
        [_collectButton.layer setCornerRadius:3];
        
        [self addSubview:_collectButton];
        //4.自动布局
        _imageAppImageView.sd_layout
        .centerXEqualToView(self)
        .heightIs(135)
        .widthIs(160);
        
        _studyCountLabel.sd_layout
        .topSpaceToView(_imageAppImageView,13)
        .leftSpaceToView(self,10)
        .heightIs(10)
        .widthIs(80);
        
        _collectButton.sd_layout
        .topSpaceToView(_imageAppImageView,6)
        .rightSpaceToView(self,15)
        .heightIs(25)
        .widthIs(50);
        [self setupAutoHeightWithBottomView:self.collectButton bottomMargin:4];
    }
    return self;
}

@end
