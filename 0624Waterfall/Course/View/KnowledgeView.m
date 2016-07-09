//
//  KnowledgeView.m
//  0624Waterfall
//
//  Created by mac on 16/6/29.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "KnowledgeView.h"
#import "UIView+SDAutoLayout.h"

@implementation KnowledgeView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _smallImageView = [[UIImageView alloc]init];
        [self addSubview:_smallImageView];
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
        _courseNumLabel = [[UILabel alloc]init];
        _courseNumLabel.font = [UIFont systemFontOfSize:12];
        _courseNumLabel.textColor = [UIColor grayColor];
        _courseNumLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_courseNumLabel];
        //4.自动布局
        _smallImageView.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(self,16)
        .heightIs(50)
        .widthIs(48);
        
        _titleLabel.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(_smallImageView,12)
        .heightIs(13)
        .widthIs(70);
        
        _courseNumLabel.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(_titleLabel,10)
        .bottomSpaceToView(self,10)
        .heightIs(12)
        .widthIs(50);
        
        [self setupAutoHeightWithBottomView:self.titleLabel bottomMargin:5];
    }
    return self;
}
@end
