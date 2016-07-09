//
//  MineViewFirstSectionTableViewCell.m
//  0624Waterfall
//
//  Created by mac on 16/7/3.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "MineViewFirstSectionTableViewCell.h"
#import "UIView+SDAutoLayout.h"

@implementation MineViewFirstSectionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _historyCourseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_historyCourseButton setTitle:@"最新学习" forState:UIControlStateNormal];
        [_historyCourseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _historyCourseButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_historyCourseButton setImage:[UIImage imageNamed:@"mineCen11_24x22_"] forState:UIControlStateNormal];
        //图片和文字,都有一个edge距上下左右的边距
        //图片的上左下是依据button的,右是依据label
        //label上右下是依据button的,左是依据imgView的
        [_historyCourseButton setTitleEdgeInsets:UIEdgeInsetsMake(64, -35, 0, 0)];
        
        _favoriteCourseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_favoriteCourseButton setTitle:@"收藏课程" forState:UIControlStateNormal];
        [_favoriteCourseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _favoriteCourseButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_favoriteCourseButton setImage:[UIImage imageNamed:@"mineCen22_24x22_"] forState:UIControlStateNormal];
        [_favoriteCourseButton setTitleEdgeInsets:UIEdgeInsetsMake(64, -35, 0, 0)];
        [self sd_addSubviews:@[_historyCourseButton,_favoriteCourseButton]];
        //自动布局
        [self setAutoLayout];
    }
    return self;
}

- (void)setAutoLayout{
    _historyCourseButton.sd_layout
    .topSpaceToView(self,0)
    .leftSpaceToView(self,21)
    .widthIs(45)
    .heightIs(64);
    
    _favoriteCourseButton.sd_layout
    .topEqualToView(_historyCourseButton)
    .leftSpaceToView(_historyCourseButton,33)
    .widthRatioToView(_historyCourseButton,1)
    .heightRatioToView(_historyCourseButton,1);
    
    [self setupAutoHeightWithBottomView:_favoriteCourseButton bottomMargin:12];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
